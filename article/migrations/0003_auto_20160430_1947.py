# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-04-30 13:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0002_auto_20160430_1945'),
    ]

    operations = [
        migrations.AlterField(
            model_name='likeuser',
            name='date',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
