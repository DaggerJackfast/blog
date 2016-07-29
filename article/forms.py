# -*- coding:utf-8 -*-

from django.forms import (ModelMultipleChoiceField,
                          ModelForm,
                          Form,
                          ChoiceField,
                          RadioSelect,
                          NumberInput,
                          MultiWidget,
                          DecimalField,
                          EmailField)  # импортируем форму для модели
from django.utils.encoding import force_text
from django import forms

from article.models import Comment,Tag, Article
from django_select2.forms import (
    ModelSelect2Widget,
    ModelSelect2TagWidget,
    ModelSelect2MultipleWidget)


class TagTaggedWidget(ModelSelect2TagWidget):
    model = Tag

    def create_value(self, value):
        self.get_queryset().create(title=value)

class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ['text']


# -------------------------------------------------
class TagNameWidget(ModelSelect2MultipleWidget):
    model = Tag
    search_fields = [
        'name__icontains'
    ]

    def label_from_instance(self, obj):
        return force_text(obj.name).lower()


class EasyArticeModelForm(ModelForm):
    class Meta:
        model = Article
        widgets = {
            'tags': TagNameWidget
        }
        exclude = ['likes']


# -----------------------------------------------------------
class ArticleModelForm(ModelForm):
    class Meta:
        model = Article
        exclude = []
        widgets = {
            'tags': TagTaggedWidget,
        }


class ArticleModelFormSelectForm(ModelForm):
    tags = ModelMultipleChoiceField(widget=ModelSelect2MultipleWidget(
        queryset=Tag.objects.all(),
        search_fields=['name__icontains'],
    ), queryset=Tag.objects.all(), required=False)

    class Meta:
        model = Article
        exclude = []
