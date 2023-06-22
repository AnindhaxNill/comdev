from django.shortcuts import render
from rest_framework.utils import json
from .models import *
from companies.models import Company
from .serializers import EmployeeSerializer
from django.http import Http404
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status


# Create your views here.
class EmployeeList(APIView):
    def get(self, request, format=None):
        employee = Employee.objects.all()
        serializer = EmployeeSerializer(employee, many=True)
        return Response(serializer.data)


class EmployeeDetail(APIView):
    def get_object(self, id):
        try:
            return Employee.objects.get(pk=id)
        except Employee.DoesNotExist:
            raise Http404

    def get(self, request, id, format=None):
        e = self.get_object(id)
        serializer = EmployeeSerializer(e)
        return Response(serializer.data)

class EmployeeAdd(APIView):
    def post(self, request, format=None):
        serializer = EmployeeSerializer(data=request.data)
        existing_emp_emails = []
        submitted_emp_email = request.data
        print(submitted_emp_email['emp_email'])

        in_db_emp_email = Employee.objects.values()
        for i in in_db_emp_email:
            print(i['emp_email'])
            existing_emp_emails.append(i['emp_email'])

        if submitted_emp_email['emp_email'] in existing_emp_emails:
            return Response("emp already exist")
        else:
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class EmployeeUpdate(APIView):
    def get_object(self, id):
        try:
            return Employee.objects.get(pk=id)
        except Employee.DoesNotExist:
            raise Http404

    def put(self, request, id, format=None):
        d = self.get_object(id)
        serializer = EmployeeSerializer(d, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class EmployeeDelete(APIView):
    def get_object(self, id):
        try:
            return Employee.objects.get(pk=id)
        except Employee.DoesNotExist:
            raise Http404
    def delete(self, request, id, format=None):
        d = self.get_object(id)
        d.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)