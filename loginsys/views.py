# -*- coding:utf-8 -*-
from django.shortcuts import render, render_to_response, redirect
from django.contrib import auth
from django.template.context_processors import csrf
from django.contrib.auth.forms import UserCreationForm, \
    User  # импортируем модeль пользователя и форму для регистрации пользователя


# Create your views here.
def login(request):  # для авторизации в системе
    args = {}  # создание словаря параметров которые будут переданы на страницу
    args.update(csrf(request))  # генерация csrf токена
    if request.POST:  # проверка как переданы ли данные методом POST
        username = request.POST.get('username', '')  # получение данных пользователя
        password = request.POST.get('password', '')  # получение пароля пользователя
        user = auth.authenticate(username=username,
                                 password=password)  # аутентификация пользоватлея проверка верности пароля
        if user is not None:  # если имеется такой пользователь
            auth.login(request, user)  # вызов авторизация пользователя
            return redirect('/')  # переход на главную страницу
        else:  # если такого пользователя нет
            args['login_error'] = "Пользователь не найден"  # создание параметра ошибки
            return render_to_response('login.html', args)  # передача параметров на страницу
    else:
        return render_to_response('login.html', args)  # передача параметров (пустых) на страницу


def logout(request):  # для выхода
    auth.logout(request)  # выход пользователя из системы
    return redirect('/')  # переход на главную страницу


def register(request):  # для регистрации
    args = {}  # создаем словарь параметров которые будут переданы на страницу
    args.update(csrf(request))  # генерируем csrf токен
    args['form'] = UserCreationForm(request.POST) # создаем параметр регистрации пользователей
    if request.POST: # если данные переданы методом POST
        newuser_form = UserCreationForm(request.POST) #
        if newuser_form.is_valid():# если данные полученые из формы регистрации валидны
            newuser_form.save() # сохраняем данные пользователя в бд
            username = newuser_form.cleaned_data['username'] # получаем логин пользователя
            password = newuser_form.cleaned_data['password1'] # получаем пароль пользователя
            newuser = auth.authenticate(username=username, password=password) # проводим аунтентификацию пользователя
            auth.login(request, newuser) # проводим авторизацию пользователя
            return redirect('/') # переход на главную страницу
        else:
            args['form'] = newuser_form # передаем в словарь агрументов
    return render_to_response('register.html', args) # пустые аргументы на страницу
