from django.conf.urls import url, include, patterns
import article
from article.views import *

urlpatterns = [
    url(r'^$', articles, name='main'),
    url(r'^articles/all/$', articles,name='articles_all'),
    url(r'^articles/get/(?P<article_id>[0-9]+)/$', article, name='article_get'),
    url(r'^articles/add_like/(?P<page_number>[0-9]+)/(?P<article_id>[0-9]+)/$', add_like,name='add_like'),
    url(r'^articles/add_comment/(?P<article_id>[0-9]+)/$', add_comment,name='add_comment'),
    url(r'^page/([0-9]+)/$', articles, name='page'),

]
