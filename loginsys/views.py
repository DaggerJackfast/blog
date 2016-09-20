# -*- coding:utf-8 -*-
from django.contrib import auth
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.core.mail import EmailMessage,send_mail
from django.shortcuts import redirect
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.debug import sensitive_post_parameters
from django.views.generic import FormView, RedirectView
import datetime,hashlib,random
from django.utils import timezone
from loginsys.forms import RegistrationForm

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


def send_message(user):
    subject = 'Регистрация на сайте www.myblog.com'
    body = 'Здравствуйте пользователь {0}, вы зарегистрировались на сайте www.myblog.com \n\r' + \
           ' для активации вашей учетной записи перейдите по ссылке '
    mail_from = 'jackfast.dagger@yandex.ru'
    mail_to = [user.email]
    mail = EmailMessage(subject, body, mail_from, mail_to)
    mail.content_subtype = 'html'
    mail.send(fail_silently=False)


class RegisterView(FormView):
    form_class = RegistrationForm
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
        email=form.cleaned_data['email']
        password = form.cleaned_data['password1']
        user=User.objects.get(username=username)
        userauth = auth.authenticate(username=username, password=password)
        auth.login(self.request, userauth)
        return redirect('/')
