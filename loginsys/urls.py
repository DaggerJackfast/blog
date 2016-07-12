from django.conf.urls import patterns, include, url

from loginsys.views import *

urlpatterns = [
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', logout, name='logout'),
    url(r'^register', register, name='register')
]
