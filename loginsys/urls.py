from django.conf.urls import  include, url

from loginsys.views import *

urlpatterns = [

    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^register', RegisterView.as_view(), name='register')

]
