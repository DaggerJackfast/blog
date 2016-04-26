from django.conf.urls import url, include, patterns
import article
from article.views import *

urlpatterns = [
    url(r'^1/$', basic_one),
    url(r'^2/$', template_two),
    url(r'^3/$', template_three_simple),
    url(r'^articles/all/$', articles,name='articles_all'),
    url(r'^articles/get/(?P<article_id>\d+)/$', article, name='article_get'),
    url(r'^articles/addlike/(?P<article_id>\d+)/(?P<page_number>[0-9]+)/$', addlike,name='addlike'),
    url(r'^articles/addcomment/(?P<article_id>\d+)/$', addcomment,name='addcomment'),
    url(r'^page/(\d+)/$', articles, name='page'),
    url(r'^$', articles,name='main'),
]
