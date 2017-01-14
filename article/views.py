from django.contrib import messages
from django.http import JsonResponse
from django.shortcuts import redirect
from django.urls import reverse
from django.views.generic import FormView
from django.views.generic import TemplateView, ListView
from django.views.generic import UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormMixin
from article.forms import CommentForm, ArticleForm
from article.models import Article, Comment, LikeUser, Tag


class ArticleLikeView(TemplateView):
    def get(self, request, *args, **kwargs):
        article_id = kwargs.get('pk')
        user = request.user
        user_like = LikeUser.objects.filter(article_id=article_id, user=user)
        if user_like.exists():
            article = Article.objects.get(pk=article_id)
            article.likes -= 1
            article.save()
            like = user_like.first()
            like.delete()
        else:
            article = Article.objects.get(pk=article_id)
            article.likes += 1
            article.save()
            like = LikeUser()
            like.article = article
            like.user = user
            like.save()
        response = {'like_count': article.likes}
        return JsonResponse(response)


class ArticleListView(ListView):
    model = Article
    template_name = 'articles.html'
    paginate_by = 4
    current_menu = 'home'

    def get_queryset(self):
        queryset = Article.objects.all().order_by('-date_created')
        return queryset

    def get_context_data(self, **kwargs):
        context = super(ArticleListView, self).get_context_data(**kwargs)
        context['current_menu'] = self.current_menu
        return context


class ArticleNewView(ArticleListView):
    template_name = 'new_articles.html'
    current_menu = 'new'


class ArticlePopularView(ArticleListView):
    template_name = 'popular_articles.html'
    current_menu = 'popular'

    def get_queryset(self):
        queryset = Article.objects.all().order_by('-likes')
        return queryset


class ArticleUserView(ArticleListView):
    template_name = 'user_articles.html'
    current_menu = 'user_articles'

    def get_queryset(self):
        queryset = Article.objects.filter(author=self.request.user).order_by('-date_created')
        return queryset


class ArticleDetailView(DetailView):
    model = Article
    template_name = 'article.html'

    def get_context_data(self, **kwargs):
        context = super(ArticleDetailView, self).get_context_data(**kwargs)
        comments = Comment.objects.filter(article=kwargs.get('object'))
        context['comments'] = comments
        context['comment_form'] = CommentForm()
        return context


class CommentView(TemplateView):
    def get(self, request, *args, **kwargs):
        comment = Comment.objects.filter(article_id=kwargs.get('pk')).values_list('user__firstname', 'user__lastname',
                                                                                  'text')
        comment = map(lambda x: ("{0} {1}".format(x[0], x[1]), x[2]), comment)
        json_response = JsonResponse({'result': list(comment)})
        return json_response

    def post(self, request, *args, **kwargs):
        if 'pause' not in request.session:
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                comment = comment_form.save(commit=False)
                comment.article = Article.objects.get(pk=kwargs.get('pk'))
                comment.user = self.request.user
                comment_form.save()
                return JsonResponse({'status': 'success',
                                     'user': self.request.user.get_official_name(), })
            else:
                return JsonResponse({'status': 'error'})


class TagView(ListView):
    model = Article
    template_name = 'tag_articles.html'
    paginate_by = 4

    def get_queryset(self):
        queryset = Tag.objects.get(pk=self.kwargs.get('pk')).article_set.all().order_by('-date_created')
        return queryset

    def get_context_data(self, **kwargs):
        context = super(TagView, self).get_context_data(**kwargs)
        context['page_title'] = Tag.objects.get(pk=self.kwargs.get('pk'))
        return context


class ArticleActionMixin(FormMixin):
    def get_context_data(self, **kwargs):
        context = super(ArticleActionMixin, self).get_context_data(**kwargs)
        context['title'] = self.title
        context['action'] = self.action
        return context


class ArticleAddView(FormView, ArticleActionMixin):
    form_class = ArticleForm
    template_name = 'article_form.html'
    title = 'Добавление статьи'
    action = 'Добавить'

    def form_valid(self, form):
        new_article = form.save(commit=False)
        new_article.author = self.request.user
        new = form.save()
        return super(ArticleAddView, self).form_valid(form)

    def get_success_url(self):
        return reverse('main')


class InfoView(TemplateView):
    template_name = 'article_info.html'


class ArticleUserEditView(UpdateView, ArticleActionMixin):
    template_name = 'article_form.html'
    form_class = ArticleForm
    model = Article
    title = 'Редактирование статьи'
    action = 'Редактировать'

    def get(self, request, *args, **kwargs):
        article = self.get_object()
        if article.is_author(request.user):
            return super(ArticleUserEditView, self).get(request, *args, **kwargs)
        else:
            messages.add_message(request=self.request, level=messages.ERROR,
                                 message='У вас нет прав на изменение данной статьи')
            return redirect('article_info')

    def get_success_url(self):
        return reverse('article_user_edit', kwargs={'pk': self.kwargs.get('pk')})

    def form_valid(self, form, **kwargs):
        f = form.save()
        messages.add_message(request=self.request, level=messages.SUCCESS, message='Статья успешно изменена')
        return super(ArticleUserEditView, self).form_valid(form)
