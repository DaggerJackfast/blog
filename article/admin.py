# -*- coding:utf-8 -*-
from django.contrib import admin

from article.models import Article, Comment,Tag

class ArticleInline(admin.StackedInline):

    model = Comment
    extra = 1



class ArticleAdmin(admin.ModelAdmin):
    # form = ArticleModelFormSelectForm
    line_filter = ['date']
    list_display = ('title','date_created','date_updated','author',)
    search_fields = ['title']

class TagAdmin(admin.ModelAdmin):
    search_fields = ['tag_name']
admin.site.register(Article,ArticleAdmin)
admin.site.register(Tag,TagAdmin)
admin.site.register(Comment)

