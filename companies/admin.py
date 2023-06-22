from django.contrib import admin
from companies.models import Company
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin


class CompanyModelAdmin(BaseUserAdmin):
    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserModelAdmin
    # that reference specific fields on auth.User.
    list_display = ('id', 'company_email', 'company_name', 'is_admin')
    list_filter = ('is_admin',)
    fieldsets = (
        ('User Credentials', {'fields': ('company_email', 'password')}),
        ('Personal info', {'fields': ['company_name']}),
        ('Permissions', {'fields': ['is_admin']}),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserModelAdmin
    # overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (None, {
            'classes': 'wide',
            'fields': ('company_email', 'company_name', 'password1', 'password2'),
        }),
    )
    search_fields = ['company_email']
    ordering = ('company_email', 'id')
    filter_horizontal = ()


# Now register the new UserModelAdmin...
admin.site.register(Company, CompanyModelAdmin)
# Register your models here.
