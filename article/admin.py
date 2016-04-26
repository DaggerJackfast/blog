# -*- coding:utf-8 -*-
from django.contrib import admin
from article.models import Article, Comment


class ArticleInline(admin.StackedInline):  # класс для изменения вида инлайнов Commebt
    model = Comment
    extra = 1


class ArticleAdmin(admin.ModelAdmin):  # класс для регулировки полей админки в Article
    fields = ['title', 'text', 'date']
    inlines = [ArticleInline]
    line_filter = ['date']


admin.site.register(Article, ArticleAdmin)
