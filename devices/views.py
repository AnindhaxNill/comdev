from django.shortcuts import render
from rest_framework.utils import json

from .models import *
from companies.models import Company
from .serializers import DeviceSerializer
from django.http import Http404
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status


# Create your views here.
class DeviceList(APIView):
    def get(self, request, format=None):
        device = Device.objects.all()
        serializer = DeviceSerializer(device, many=True)
        return Response(serializer.data)

class DeviceAdd(APIView):
    def post(self, request, format=None):
        serializer = DeviceSerializer(data=request.data)
        submitted_device_id = request.data
        existing_device_id = []

        if not submitted_device_id:
            print("empty")
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            print("not empty")
            submitted_device_id = request.data
            print(submitted_device_id['device_id'])

            in_db_device_id = Device.objects.values()
            for i in in_db_device_id:
                print(i['device_id'])
                existing_device_id.append(i['device_id'])

            if submitted_device_id['device_id'] in existing_device_id:
                return Response("Device already exist")
            else:
                if serializer.is_valid():
                    serializer.save()
                    return Response(serializer.data, status=status.HTTP_201_CREATED)
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeviceDetail(APIView):
    def get_object(self, id):
        try:
            return Device.objects.get(pk=id)
        except Device.DoesNotExist:
            raise Http404

    def get(self, request, id, format=None):
        d = self.get_object(id)
        serializer = DeviceSerializer(d)
        return Response(serializer.data)

class DeviceUpdate(APIView):
    def get_object(self, id):
        try:
            return Device.objects.get(pk=id)
        except Device.DoesNotExist:
            raise Http404

    def put(self, request, id, format=None):
        d = self.get_object(id)
        serializer = DeviceSerializer(d, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class DeviceDelete(APIView):
    def get_object(self, id):
        try:
            return Device.objects.get(pk=id)
        except Device.DoesNotExist:
            raise Http404
    def delete(self, request, id, format=None):
        d = self.get_object(id)
        d.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)