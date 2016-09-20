from django import forms
from django.contrib.auth.forms import PasswordChangeForm

from customuser.models import CustomUser
from customuser.forms import UserCreationForm, LoginForm, UserChangeForm
from datetime import date
from image_cropping import ImageCropWidget

class NullBooleanGenderSelect(forms.Select):
    def __init__(self, attrs=None):
        choices = (
            (None, 'Не выбрано'),
            (True, 'Мужской'),
            (False, 'Женский'),
        )
        super(NullBooleanGenderSelect, self).__init__(attrs=attrs,choices=choices)


def get_text_widget(placeholder):
    return forms.TextInput(attrs={'placeholder': placeholder, 'class': 'form-control'})


def get_pswd_widget(placeholder):
    return forms.PasswordInput(attrs={'placeholder': placeholder, 'class': 'form-control'})


def get_years():
    now_year = date.today().year
    return [x for x in range(now_year - 75, now_year + 1)]


class RegistrationForm(UserCreationForm):
    firstname = forms.CharField(required=True, label='Имя', widget=get_text_widget('Введите имя'))
    lastname = forms.CharField(required=True, label='Фамилия', widget=get_text_widget('Введите фамилию'))
    middlename = forms.CharField(required=False, label='Отчество', widget=get_text_widget('Введите отчество'))
    email = forms.EmailField(required=True, label='E-Mail',
                             widget=forms.EmailInput(attrs={'placeholder': 'Введите email', 'class': 'form-control'}))

    date_of_birth = forms.DateField(required=True, label='Дата рождения',
                                    widget=forms.SelectDateWidget(empty_label=('---', '---', '---'),
                                                                  attrs={
                                                                      'class': 'text-center well well-sm block-inline'},
                                                                  years=get_years()))
    gender = forms.NullBooleanField(required=True, widget=NullBooleanGenderSelect(attrs={'class':'well well-sm block-inline'}),label='Пол')
    password1 = forms.CharField(required=True, label='Пароль', widget=get_pswd_widget('Введите пароль'))
    password2 = forms.CharField(required=True, label='Потверждение пароля',
                                widget=get_pswd_widget('Введите пароль еще раз'))

    class Meta:
        model = CustomUser
        fields = ('firstname', 'lastname', 'middlename', 'email', 'date_of_birth', 'gender', 'password1', 'password2')

    def clean_email(self):
        email = self.cleaned_data['email']
        try:
            CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            return email
        raise forms.ValidationError('Такой адрес электронной почты уже зарегистрирован')


class ProfileEditForm(forms.ModelForm):
    firstname = forms.CharField(required=True, label='Имя', widget=get_text_widget('Введите имя'))
    lastname = forms.CharField(required=True, label='Фамилия', widget=get_text_widget('Введите фамилию'))
    middlename = forms.CharField(required=False, label='Отчество', widget=get_text_widget('Введите отчество'))

    date_of_birth = forms.DateField(required=True, label='Дата рождения',
                                    widget=forms.SelectDateWidget(empty_label=('---', '---', '---'),
                                                                  attrs={
                                                                      'class': 'text-center well well-sm block-inline'},
                                                                  years=get_years()))
    gender = forms.NullBooleanField(required=True,
                                    label='Пол',
                                    widget=NullBooleanGenderSelect(attrs={'class':'well well-sm block-inline'}))

    class Meta:
        model = CustomUser
        fields = ('firstname', 'lastname', 'middlename', 'date_of_birth', 'gender')


class UserPasswordChangeForm(PasswordChangeForm):
    old_password = forms.CharField(
        label='Старый пароль',
        strip=False,
        widget=get_pswd_widget('Введите старый пароль'),
    )
    new_password1 = forms.CharField(
        label="Новый пароль",
        widget=get_pswd_widget('Введите новый пароль'),
        strip=False,
    )
    new_password2 = forms.CharField(
        label="Потверждение нового пароля",
        strip=False,
        widget=get_pswd_widget('Введите новый пароль еще раз'),
    )


    # def clean_email(self):
    #     email = self.cleaned_data['email']
    #     try:
    #         CustomUser.objects.get(email=email)
    #     except CustomUser.DoesNotExist:
    #         return email
    #     raise forms.ValidationError('Такой адрес электронной почты уже зарегистрирован')


class UserLoginForm(LoginForm):
    username = forms.CharField(required=True, label='Email',
                               widget=forms.EmailInput(attrs={'placeholder': 'Введите email', 'class': 'form-control'}))
    password = forms.CharField(required=True, label='Пароль', widget=get_pswd_widget('Введите пароль'))


class UserPasswordResetForm(forms.Form):
    email = forms.EmailField(required=True, label='E-Mail',
                             widget=forms.EmailInput(attrs={'placeholder': 'Введите email', 'class': 'form-control'}))


class UserSetPasswordForm(forms.Form):
    error_messages = {
        'password_mismatch': ("Два пароля должны совпадать"),
    }
    new_password1 = forms.CharField(label=("Новый пароль"),
                                    widget=get_pswd_widget('Введите новый пароль'))
    new_password2 = forms.CharField(label="Потверждение нового пароля",
                                    widget=get_pswd_widget('Введите новый пароль еще раз'))

    def clean_new_password2(self):
        password1 = self.cleaned_data.get('new_password1')
        password2 = self.cleaned_data.get('new_password2')
        if password1 and password2:
            if password1 != password2:
                raise forms.ValidationError(
                    self.error_messages['password_mismatch'],
                    code='password_mismatch',
                )
        return password2
