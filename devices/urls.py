from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from devices import views

urlpatterns = [
    path('list/',views.DeviceList.as_view(),),
    path('add/',views.DeviceAdd.as_view(),),
    path('detail/<int:id>/', views.DeviceDetail.as_view()),
    path('info_update/<int:id>/', views.DeviceUpdate.as_view()),
    path('delete/<int:id>/', views.DeviceDelete.as_view()),

]