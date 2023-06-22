
from django.urls import path,include
from .views import *

urlpatterns = [
    path("register/", UserRegistrationView.as_view(),name='company_register'),
    path("login/", CompanyLoginView.as_view(),name='company_login'),
    path('profile/', CompanyProfileView.as_view(), name='company_profile'),
]