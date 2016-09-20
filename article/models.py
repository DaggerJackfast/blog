# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from customuser.models import CustomUser
from django.db import models
from ckeditor_uploader import fields


class Comment(models.Model):
    text = models.TextField(verbose_name='Текст комментария')
    date = models.DateTimeField(verbose_name='Дата комментирования', auto_now_add=True)
    user = models.ForeignKey(CustomUser)
    article = models.ForeignKey('Article')

    class Meta:
        # ordering=['-date']
        db_table = 'comments'
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'

    def __str__(self):
        return self.user.get_official_name()


class Tag(models.Model):
    tag_name = models.CharField(max_length=200, verbose_name='Название тега')

    def __str__(self):
        return self.tag_name

    class Meta:
        db_table = 'tags'
        verbose_name = "Тег"
        verbose_name_plural = "Теги"


class Article(models.Model):
    title = models.CharField(max_length=200, verbose_name='Название')
    text = fields.RichTextUploadingField(verbose_name='Текст')
    date_created = models.DateTimeField(verbose_name='Дата публикации',auto_now_add=True)
    date_updated=models.DateTimeField(verbose_name='Дата изменения',auto_now=True)
    likes = models.IntegerField(default=0, verbose_name='Лайки')
    author = models.ForeignKey(CustomUser, verbose_name='Автор',related_name='article_author')
    tags = models.ManyToManyField(Tag, verbose_name='Теги', blank=True)
    user = models.ManyToManyField(CustomUser, through='LikeUser', through_fields=('article', 'user'))

    class Meta:
        db_table = 'articles'
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'

    def __str__(self):
        return self.title


class LikeUser(models.Model):
    article = models.ForeignKey(Article)
    user = models.ForeignKey(CustomUser)
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'articles_user'
