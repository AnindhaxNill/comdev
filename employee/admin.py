from django.contrib import admin
from .models import Employee


# Register your models here.

class EmployeeModelAdmin(admin.ModelAdmin):
    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserModelAdmin
    # that reference specific fields on auth.User.
    list_display = ('id', 'emp_email', 'name', 'department','company')

    fieldsets = (
        ('Personal info', {'fields': ['name']}),
        ('Personal info', {'fields': ['address']}),
        ('Personal info', {'fields': ['department']}),
        ('Personal info', {'fields': ['employee_id']}),
        ('Personal info', {'fields': ['emp_email']}),
    )

    search_fields = ['emp_email']
    # ordering = 'id'
    filter_horizontal = ()


admin.site.register(Employee, EmployeeModelAdmin)
