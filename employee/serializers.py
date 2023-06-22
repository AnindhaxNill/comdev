from django.db.models import fields
from rest_framework import serializers
from devices.serializers import DeviceSerializer
from .models import Employee


class EmployeeSerializer(serializers.ModelSerializer):
    devices = DeviceSerializer(many=True, read_only=True)
    class Meta:
        model = Employee
        fields = ['id', 'company', 'employee_id', 'name', 'date_joined', 'department', 'address', 'emp_email','devices']
