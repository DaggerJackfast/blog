from django.conf.urls import url, include, patterns
import article
from article.views import *

urlpatterns = [
    url(r'^$', ArticleListView.as_view(), name='articles'),
    # url(r'^articles/all/$', articles, name='articles_all'),
    url(r'^(?P<pk>\d+)/detail/$', ArticleDetailView.as_view(), name='article_detail'),
    # url(r'^articles/get/(?P<article_id>[0-9]+)/$', article, name='article_get'),
    # url(r'^articles/add_like/(?P<page_number>[0-9]+)/(?P<article_id>[0-9]+)/$', add_like, name='add_like'),
    # url(r'^articles/add_comment/(?P<article_id>[0-9]+)/$', add_comment, name='add_comment'),
    url(r'^like/$',ArticleLikeView.as_view(), name='article_like'),
    # url(r'^\?page=(?P<page>\d+)/$', ArticleListView.as_view(), name='articles_page'),

]
