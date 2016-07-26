# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.forms import User
from django.db import models


class Comment(models.Model):
    text = models.TextField(verbose_name='Текст комментария')
    date = models.DateTimeField(verbose_name='Дата комментирования', auto_now_add=True)
    user = models.ForeignKey(User)
    article = models.ForeignKey('Article')

    class Meta:
        db_table = 'comments'
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'

    def __unicode__(self):
        return self.user.username


class Tag(models.Model):
    name = models.CharField(max_length=200, verbose_name='Название тега')

    def __unicode__(self):
        return self.name

    class Meta:
        db_table = 'tags'
        verbose_name = "Тег"
        verbose_name_plural = "Теги"


class Article(models.Model):
    title = models.CharField(max_length=200, verbose_name='Название')
    text = models.TextField(verbose_name='Текст')
    date = models.DateTimeField(verbose_name='Дата публикации')
    likes = models.IntegerField(default=0, verbose_name='Лайки')
    tags = models.ManyToManyField(Tag, verbose_name='Теги', blank=True)
    user = models.ManyToManyField(User, through='LikeUser', through_fields=('article', 'user'))

    class Meta:
        db_table = 'articles'
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'

    def __unicode__(self):
        return self.title


class LikeUser(models.Model):
    article = models.ForeignKey(Article)
    user = models.ForeignKey(User)
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'articles_user'
