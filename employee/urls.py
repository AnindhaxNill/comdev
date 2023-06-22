from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from employee import views

urlpatterns = [
    path('list/',views.EmployeeList.as_view(),),
    path('detail/<int:id>',views.EmployeeDetail.as_view(),),
    path('add/',views.EmployeeAdd.as_view(),),
    path('info_update/<int:id>/', views.EmployeeUpdate.as_view()),
    path('delete/<int:id>/', views.EmployeeDelete.as_view()),

]
