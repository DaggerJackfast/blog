from django.contrib import auth
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator
from django.http import Http404
from django.shortcuts import render_to_response, render, redirect
from django.template.context_processors import csrf
from django.http import JsonResponse
from article.forms import CommentForm
from django.views.generic import TemplateView, ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView, ProcessFormView
from django.contrib.auth.mixins import LoginRequiredMixin, AccessMixin
from django.core.serializers import serialize
from article.models import Article, Comment, LikeUser
from django.views.decorators.csrf import csrf_protect


class ArticleLikeView(TemplateView):
    def get(self, request, *args, **kwargs):
        article_id = kwargs.get('pk')
        user = request.user
        likeuser = LikeUser.objects.filter(article_id=article_id, user=user)
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
        response = {'likenumber': article.likes}
        return JsonResponse(response)


class ArticleListView(ListView):
    model = Article
    template_name = 'articles.html'
    paginate_by = 2

    def get_queryset(self):
        queryset = Article.objects.all().order_by('-date')
        return queryset

    def get_context_data(self, **kwargs):
        context = super(ArticleListView, self).get_context_data(**kwargs)
        context['username'] = self.request.user.username
        return context


class ArticleDetailView(DetailView):
    model = Article
    template_name = 'article.html'

    def get_context_data(self, **kwargs):
        context = super(ArticleDetailView, self).get_context_data(**kwargs)
        context['username'] = self.request.user.username
        comments = Comment.objects.filter(article=kwargs.get('object'))
        context['comments'] = comments
        context['comment_form'] = CommentForm()
        return context


class CommentView(TemplateView):

    def post(self, request, *args, **kwargs):
        if 'pause' not in request.session:
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                comment = comment_form.save(commit=False)
                comment.article = Article.objects.get(pk=kwargs.get('pk'))
                comment.user = self.request.user
                comment_form.save()
                d={'status':'success',
                                     'username':self.request.user.username,}
                print(d)
                return JsonResponse({'status':'success',
                                     'username':self.request.user.username,})
            else:
                return JsonResponse({'status':'error'})
