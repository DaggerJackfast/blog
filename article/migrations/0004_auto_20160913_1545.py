# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-09-13 09:45
from __future__ import unicode_literals

import ckeditor_uploader.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0003_article_author'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='text',
            field=ckeditor_uploader.fields.RichTextUploadingField(verbose_name='Текст'),
        ),
    ]
