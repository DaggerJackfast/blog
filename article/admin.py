# -*- coding:utf-8 -*-
from django.contrib import admin

from article.models import Article, Comment,Tag
from article.forms import ArticleModelForm,EasyArticeModelForm,ArticleModelFormSelectForm

class ArticleInline(admin.StackedInline):

    model = Comment
    extra = 1



class ArticleAdmin(admin.ModelAdmin):
    form = ArticleModelFormSelectForm
    line_filter = ['date']

admin.site.register(Article,ArticleAdmin)
admin.site.register(Tag)
admin.site.register(Comment)

