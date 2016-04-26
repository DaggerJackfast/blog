# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.forms import User
from django.db import models
from datetime import datetime


class Article(models.Model):
    class Meta:
        db_table = 'articles'

    title = models.CharField(max_length=200, verbose_name='Название')
    text = models.TextField(verbose_name='Текст')
    date = models.DateTimeField(verbose_name='Дата публикации')
    likes = models.IntegerField(default=0, verbose_name='Лайки')
    user = models.ManyToManyField(User, through='LikeUser', through_fields=('article', 'user'))

    def __unicode__(self):
        return self.title


class LikeUser(models.Model):
    class Meta:
        db_table = 'articles_user'

    article = models.ForeignKey(Article)
    user = models.ForeignKey(User)
    date = models.DateTimeField(default=datetime.now())


class Comment(models.Model):
    class Meta:
        db_table = 'comments'

    text = models.TextField(verbose_name='Текст комментария')
    date = models.DateTimeField(verbose_name='Дата комментирования')
    user = models.ForeignKey(User)
    article = models.ForeignKey(Article)


