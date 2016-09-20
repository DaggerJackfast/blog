# coding=utf-8
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models
from datetime import date

def get_userprofile_avatar(instance, filename):
    return 'userprofile/avatars/{0}/{1}'.format(instance.user.username, filename)


