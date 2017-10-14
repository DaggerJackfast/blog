from django.db import models
from customuser.models import  CustomUser


class Friend(models.Model):
    user=models.ForeignKey(CustomUser, related_name='user')
    friend=models.ForeignKey(CustomUser,related_name='friend')
    datetime=models.DateTimeField(auto_now_add=True)

