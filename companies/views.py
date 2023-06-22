from django.shortcuts import render
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from .serializers import *
from devices.models import Device
from employee.models import Employee
from django.contrib.auth import authenticate
from .renderes import Renderer
from rest_framework_simplejwt.tokens import RefreshToken
from employee.serializers import EmployeeSerializer
from devices.serializers import DeviceSerializer


# Create your views here.
def get_tokens_for_company(company):
    refresh = RefreshToken.for_user(company)
    return {
        'refresh': str(refresh),
        'access': str(refresh.access_token),
    }


class UserRegistrationView(APIView):
    renderer_classes = [Renderer]

    def post(self, request, format=None):
        serializer = CompanyRegistrationSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            company = serializer.save()
            token = get_tokens_for_company(company)
            return Response({"token": token, 'msg': 'Reg Succ'}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status.HTTP_400_BAD_REQUEST)


class CompanyLoginView(APIView):
    renderer_classes = [Renderer]
    def post(self, request, format=None):
        serializer = CompanyLoginSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            company_email = serializer.data.get('company_email')
            password = serializer.data.get('password')
            company = authenticate(company_email=company_email, password=password)
            token = get_tokens_for_company(company)
            if company is not None:
                return Response({"token": token, "msg": "log succ"}, status=status.HTTP_200_OK)
            else:
                return Response({'errors': {'non_field_errors': ['email or password is not valid']}},
                                status=status.HTTP_400_BAD_REQUEST)


class CompanyProfileView(APIView):
    renderer_classes = [Renderer]
    permission_classes = [IsAuthenticated]
    def get(self, request, format=None):

        serializer = CompanyProfileSerializer(request.user)

        print(serializer.data)
        return Response(serializer.data, status=status.HTTP_200_OK)
