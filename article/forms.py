# -*- coding:utf-8 -*-

from django import forms
from ckeditor_uploader import fields
from ckeditor import widgets
from article.models import Comment, Tag, Article


class CommentForm(forms.ModelForm):
    text = forms.CharField(label='Текст комментария', required=True, widget=forms.Textarea(
        attrs={'class': 'form-control', 'placeholder': 'Введите текст комментария'}))

    class Meta:
        model = Comment
        fields = ['text']


class ArticleForm(forms.ModelForm):
    title = forms.CharField(label='Заголовок статьи',
                            required=True,
                            widget=forms.TextInput(
                                attrs={'placeholder': 'Введите заголовок статьи', 'class': 'form-control'}))
    text = forms.CharField(label='Текст статьи',
                           required=True,
                           widget=widgets.CKEditorWidget(attrs={'class': 'form-control'}))
    tags = forms.ModelMultipleChoiceField(label='Теги',
                                          queryset=Tag.objects.all(),
                                          required=True,
                                          widget=forms.SelectMultiple(
                                              attrs={'class': 'js-select2-multiple form-control'})
                                          )

    class Meta:
        model = Article
        fields = ['title', 'text', 'tags']
