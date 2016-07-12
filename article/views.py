from django.contrib import auth
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator
from django.http import Http404
from django.shortcuts import render_to_response, render, redirect
from django.template.context_processors import csrf
from article.forms import CommentForm
from django.views.generic import TemplateView, ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from django.views.generic.base import View
from article.models import Article, Comment, LikeUser


class ArticleLikeView(View):
    def get(self, request, *args, **kwargs):
        article_id = request.GET.get('article')
        page = request.GET.get('page')
        user = auth.get_user(request)
        likeuser=LikeUser.objects.filter(article_id=article_id, user=user)
        if likeuser.exists():
            article = Article.objects.get(pk=article_id)
            article.likes -= 1
            article.save()
            like = likeuser.first()
            like.delete()
        else:
            article = Article.objects.get(pk=article_id)
            article.likes += 1
            article.save()
            like = LikeUser()
            like.article = article
            like.user = user
            like.save()
        return redirect(reverse('articles') + "?page=" + page)


class ArticleListView(ListView):
    model = Article
    template_name = 'articles.html'
    paginate_by = 4

    def get_queryset(self):
        queryset = Article.objects.all().order_by('-date')
        return queryset

    def get_context_data(self, **kwargs):
        context = super(ArticleListView, self).get_context_data(**kwargs)
        context['username'] = auth.get_user(self.request).username
        return context


class ArticleDetailView(DetailView):
    model = Article
    template_name = 'article.html'

    def get_context_data(self, **kwargs):
        context = super(ArticleDetailView, self).get_context_data(**kwargs)
        context['username'] = auth.get_user(self.request).username
        comments = Comment.objects.filter(article=kwargs.get('object'))
        context['comments'] = comments
        context['comment_form'] = CommentForm()
        return context

    def post(self, request, *args, **kwargs):
        if 'pause' not in request.session:
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                comment = comment_form.save(commit=False)
                comment.article = Article.objects.get(pk=kwargs.get('pk'))
                comment.user = auth.get_user(request)
                comment_form.save()
                return super(ArticleDetailView, self).get(request, *args, **kwargs)


def add_like(request, page_number, article_id):
    try:
        if article_id in request.COOKIES:
            reverse('add_like', kwargs={'page': page_number})
        else:
            get_article = Article.objects.get(id=article_id)
            get_article.likes += 1
            get_article.user = auth.get_user(request)
            get_article.save()
            response = reverse('add_like', kwargs={'page': page_number})
            response.set_cookie(article_id, 'test')
            return response
    except ObjectDoesNotExist:
        raise Http404
    return reverse('add_like', kwargs={'page': page_number})
