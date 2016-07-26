from django.conf.urls import url, include, patterns
from article.views import ArticleLikeView,ArticleListView,ArticleDetailView,CommentView
from django.contrib.auth.decorators import login_required

urlpatterns = [
    url(r'^$', ArticleListView.as_view(), name='articles'),
    url(r'^(?P<pk>\d+)/detail/$', ArticleDetailView.as_view(), name='article_detail'),
    url(r'^(?P<pk>\d+)/like/$', login_required(ArticleLikeView.as_view()), name='article_like'),
    url(r'^(?P<pk>\d+)/comment/$',login_required(CommentView.as_view()),name='article_comment')
]
