from django.db.models import fields
from rest_framework import serializers
from .models import Device


class DeviceSerializer(serializers.ModelSerializer):

    class Meta:
        model = Device
        fields = ['id','assigned_employee', 'device_id', 'device_company_name',
                  'device_type', 'device_model', 'device_info',
                  'device_assigned_from','device_assigned_to','device_log',
                  'device_currently_used','device_returned',
                  'device_returned_date']
