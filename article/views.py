from django.contrib import auth
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator
from django.http import Http404
from django.shortcuts import render_to_response, render, redirect
from django.template.context_processors import csrf

from article.forms import CommentForm
from article.models import Article, Comment, LikeUser


def articles(request, page_number=1):
    all_articles = Article.objects.all().order_by('-date')
    current_page = Paginator(all_articles, 4)
    page_articles = current_page.page(page_number)
    context = {
        'articles': page_articles,
        'username': auth.get_user(request).username
    }
    return render_to_response('articles.html', context=context)


def article(request, article_id=1):
    comment_form = CommentForm()
    context = {}
    context.update(csrf(request))
    context['username'] = auth.get_user(request).username
    context['article'] = Article.objects.get(id=article_id)
    context['comments'] = Comment.objects.filter(article_id=article_id).values('id','text','date','user__username')
    context['comment_form'] = comment_form
    return render_to_response('article.html', context)


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


def add_comment(request, article_id=1):
    if request.POST and ('pause' not in request.session):
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            comment=comment_form.save(commit=False)
            comment.article=Article.objects.get(id=article_id)
            comment.user=auth.get_user(request)
            comment_form.save()
    redirect_url = reverse('article_get', args=(article_id,))
    return redirect(redirect_url)
