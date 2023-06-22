from rest_framework import serializers

from .models import *
from employee.serializers import EmployeeSerializer

class CompanyRegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = Company
        fields = ['company_email', 'company_name', 'password', 'password2']
        extra_kwargs = {
            'password': {'write_only': True}
        }

        # Validating Password and Confirm Password while Registration

    def validate(self, attrs):
        password = attrs.get('password')
        password2 = attrs.get('password2')
        if password != password2:
            raise serializers.ValidationError("Password and Confirm Password doesn't match")
        return attrs

    def create(self, validate_data):
        return Company.objects.create_user(**validate_data)


class CompanyLoginSerializer(serializers.ModelSerializer):
    company_email = serializers.EmailField(max_length=255)

    class Meta:
        model = Company
        fields = ['company_email', 'password']


class CompanyProfileSerializer(serializers.ModelSerializer):
    employeess_of= EmployeeSerializer(many=True,read_only=True)
    class Meta:
        model = Company
        fields = ['id', 'company_email', 'company_name', 'employeess_of']

