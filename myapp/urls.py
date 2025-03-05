

from django.contrib import admin
from django.urls import path, include

from myapp import views

urlpatterns = [
    path('',views.login),
    path('logincode',views.logincode),
    path('adminhome',views.adminhome),
    path('AddExpert',views.AddExpert),
    path('ComplaintReply', views.ComplaintReply),
    path('ManageExpert', views.ManageExpert),
    path('ViewComplaintandReply',views.ViewComplaintandReply),
    path('ViewParent',views.ViewParent),
    path('ViewRatingandReview', views.ViewRatingandReview),
    path('ViewStudent', views.ViewStudent),







]
