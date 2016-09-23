from django.conf.urls import url, include

from article.views import ArticleLikeView, ArticleListView, ArticleDetailView, CommentView, \
    TagView, ArticleNewView, ArticleAddView, ArticleUserView, ArticleUserEditView, ArticlePopularView
from django.contrib.auth.decorators import login_required

urlpatterns = [
    url(r'^$', ArticleListView.as_view(), name='main'),
    url(r'^new/$', ArticleNewView.as_view(), name='new_articles'),
    url(r'^popular/$', ArticlePopularView.as_view(), name='popular_articles'),
    url(r'^user_articles/$', ArticleUserView.as_view(), name='user_articles'),
    url(r'^(?P<pk>\d+)/detail/$', ArticleDetailView.as_view(), name='article_detail'),
    url(r'^(?P<pk>\d+)/like/$', login_required(ArticleLikeView.as_view()), name='article_like'),
    url(r'^(?P<pk>\d+)/comment/$', login_required(CommentView.as_view()), name='article_comment'),
    url(r'^tags/(?P<pk>\d+)/$', TagView.as_view(), name='tags'),
    url(r'^artice_add/$', login_required(ArticleAddView.as_view()), name='article_add'),
    url(r'^artice_edit/(?P<pk>\d+)/$', login_required(ArticleUserEditView.as_view()), name='article_user_edit')

]
