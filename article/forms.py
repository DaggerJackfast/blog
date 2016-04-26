# -*- coding:utf-8 -*-
from django.forms import ModelForm  # импортируем форму для модели
from article.models import Comment  # импортируем модель комментариев


class CommentForm(ModelForm):  # форма для модели комментариев Comment
    class Meta:
        model = Comment
        fields = ['text']
