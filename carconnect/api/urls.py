from . import views
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path("signup/", views.signUp, name="signup"),
    path("login/", views.login, name="login"),
    path("signin/", views.signIn, name="signin"),
    
]