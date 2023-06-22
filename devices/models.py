from django.db import models
from employee.models import *

# Create your models here.
Choices = (
    ("1", "Yes"),
    ("0", "No"),

)


class Device(models.Model):
    assigned_employee = models.ForeignKey(Employee, on_delete=models.SET_NULL, null=True, related_name='devices')
    device_id = models.CharField(max_length=255)
    device_company_name = models.CharField(max_length=255)
    device_type = models.CharField(max_length=255)
    device_model = models.CharField(max_length=255)
    device_info = models.CharField(max_length=255)
    device_assigned_from = models.DateTimeField(null=True, blank=True, default=None)
    device_assigned_to = models.DateTimeField(null=True, blank=True, default=None)
    device_log = models.CharField(max_length=255)
    device_currently_used = models.CharField(max_length=3, choices=Choices)
    device_returned = models.CharField(max_length=3, choices=Choices)
    device_returned_date = models.DateTimeField(null=True, blank=True, default=None)


    def __str__(self) -> str:
        return self.device_id
