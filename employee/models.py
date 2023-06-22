from django.db import models
from companies.models import *


# Create your models here.

class Employee(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='employeess_of')
    employee_id = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    date_joined = models.DateTimeField(null=False, blank=False, default=None)
    department = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    emp_email = models.EmailField( max_length=255,default=None)

    def __str__(self) -> str:
        return self.employee_id
