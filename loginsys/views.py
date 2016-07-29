# -*- coding:utf-8 -*-
from django.shortcuts import render, render_to_response, redirect

from django.template.context_processors import csrf
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.utils.http import is_safe_url
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.debug import sensitive_post_parameters
from django.contrib import auth
from django.views.generic import FormView, RedirectView
from django.views.generic.base import View, TemplateView
from loginsys.forms import LoginForm


# class LoginView(FormView):
#     form_class = AuthenticationForm
#     success_url = '/'
#     redirect_fields_name = REDIRECT_FIELD_NAME
#     template_name = 'login.html'
#
#
#     @method_decorator(sensitive_post_parameters('password'))
#     @method_decorator(never_cache)
#     @method_decorator(csrf_protect)
#     def dispatch(self, request, *args, **kwargs):
#         return super(LoginView, self).dispatch(request, *args, **kwargs)
#
#     def form_valid(self, form):
#         login(self.request, form.get_user())
#         return super(LoginView, self).form_valid(form)
#
#     def get_success_url(self):
#         redirect_to = self.request.REQUEST.get(self.redirect_fields_name)
#         if not is_safe_url(url=redirect_to, host=self.request.get_host()):
#             redirect_to = self.success_url
#         return redirect_to


class LogoutView(RedirectView):
    url = '/'

    def get(self, request, *args, **kwargs):
        auth.logout(request)
        return super(LogoutView, self).get(request, *args, **kwargs)


class LoginView(FormView):
    form_class = AuthenticationForm
    template_name = "login.html"
    success_url = "/"

    @method_decorator(sensitive_post_parameters('password'))
    @method_decorator(never_cache)
    @method_decorator(csrf_protect)
    def dispatch(self, request, *args, **kwargs):
        return super(LoginView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        self.user = form.get_user()
        auth.login(self.request, self.user)
        return super(LoginView, self).form_valid(form)


class RegisterView(FormView):
    form_class = UserCreationForm
    template_name = "register.html"
    success_url = "/"

    @method_decorator(sensitive_post_parameters('password1', 'password2'))
    @method_decorator(never_cache)
    @method_decorator(csrf_protect)
    def dispatch(self, request, *args, **kwargs):
        return super(RegisterView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        form.save()
        username = form.cleaned_data['username']
        password = form.cleaned_data['password1']
        user = auth.authenticate(username=username, password=password)
        auth.login(self.request, user)
        return redirect('/')

        # def register(request):  # для регистрации

# args = {}  # создаем словарь параметров которые будут переданы на страницу
#     args.update(csrf(request))  # генерируем csrf токен
#     args['form'] = UserCreationForm(request.POST)  # создаем параметр регистрации пользователей
#     if request.POST:  # если данные переданы методом POST
#         newuser_form = UserCreationForm(request.POST)  #
#         if newuser_form.is_valid():  # если данные полученые из формы регистрации валидны
#             newuser_form.save()  # сохраняем данные пользователя в бд
#             username = newuser_form.cleaned_data['username']  # получаем логин пользователя
#             password = newuser_form.cleaned_data['password1']  # получаем пароль пользователя
#             newuser = auth.authenticate(username=username,
#                                         password=password)  # проводим аунтентификацию пользователя
#             auth.login(request, newuser)  # проводим авторизацию пользователя
#             return redirect('/')  # переход на главную страницу
#         else:
#             args['form'] = newuser_form  # передаем в словарь агрументов
#     return render_to_response('register.html', args)  # пустые аргументы на страницу

#
# class LoginView(TemplateView):
#     template_name = 'login.html'
#     success_url = '/'
#     redirect_fields_name = auth.REDIRECT_FIELD_NAME
#     form = None
#
#     def get(self, request, *args, **kwargs):
#         self.template_name = 'login.html'
#         self.form = AuthenticationForm()
#         return super(LoginView, self).get(request, *args, **kwargs)
#
#     def get_context_data(self, **kwargs):
#         context = super(LoginView, self).get_context_data(**kwargs)
#         context['form'] = self.form
#         return context
#
#     def post(self, request, *args, **kwargs):
#         username = request.POST.get('username')
#         password = request.POST.get('password')
#         l = request.GET
#         user = auth.authenticate(username=username, password=password)
#         if user is not None:
#             if user.is_active():
#                 auth.login(self.request, user)
#                 return redirect('/')
#             else:
#                 return super(LoginView, self).get(request, *args, **kwargs)
#         else:
#             return super(LoginView, self).get(request, *args, **kwargs)


# def login(request):  # для авторизации в системе
#     args = {}  # создание словаря параметров которые будут переданы на страницу
#     args.update(csrf(request))  # генерация csrf токена
#     if request.POST:  # проверка как переданы ли данные методом POST
#         username = request.POST.get('username', '')  # получение данных пользователя
#         password = request.POST.get('password', '')  # получение пароля пользователя
#         user = auth.authenticate(username=username,
#                                  password=password)  # аутентификация пользоватлея проверка верности пароля
#         if user is not None:  # если имеется такой пользователь
#             auth.login(request, user)  # вызов авторизация пользователя
#             return redirect('/')  # переход на главную страницу
#         else:  # если такого пользователя нет
#             args['login_error'] = "Пользователь не найден"  # создание параметра ошибки
#             return render_to_response('login.html', args)  # передача параметров на страницу
#     else:
#         return render_to_response('login.html', args)  # передача параметров (пустых) на страницу
#
#
# def logout(request):  # для выхода
#     auth.logout(request)  # выход пользователя из системы
#     return redirect('/')  # переход на главную страницу
#
