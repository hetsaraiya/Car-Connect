<<<<<<< HEAD
from .views import *
=======
from .views import signUp, signIn
>>>>>>> origin/main
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path("signup/", signUp, name="signup"),
    path("signin/", signIn, name="signin"),
<<<<<<< HEAD
    path("createreq/", makeRequest, name="makeRequest"),
    path("test/", test, name="test"),
    path("getridesdata/", getRequestData, name="getrequest"),
]

=======
]
>>>>>>> origin/main
