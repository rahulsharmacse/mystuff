from django.db import models
from rest_framework import serializers
from mysite.common.constants import *

# Create your models here.
class users (models.Model):
    class Meta:
        db_table = "users"

    userid  = models.CharField(max_length=MAX_USER_ID_LEN)
    emailid = models.CharField(max_length=MAX_EMAIL_ID_LEN,null=True)
    creationdate = models.DateTimeField(auto_now_add = True)
    password = models.CharField(max_length=MAX_PASSWORD_LEN, null=True)
    balance  = models.FloatField(default=DEFAULT_FLOAT_VALUE)
    profit  = models.FloatField(default=DEFAULT_FLOAT_VALUE)
    lastlogintime = models.DateTimeField(auto_now_add = True,null=False)
    networth  = models.FloatField(default=DEFAULT_FLOAT_VALUE)


class users_serializer(serializers.ModelSerializer):
    class meta:
        model = users
        fields =('userid', 'emailid','password')

