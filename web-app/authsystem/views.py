from django.contrib import auth
from django.contrib.auth.tokens import default_token_generator
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.db.models import Q
from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import redirect
from django.utils.decorators import method_decorator
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.debug import sensitive_post_parameters
from django.views.generic import FormView, RedirectView, TemplateView, UpdateView, DeleteView
from django.contrib import messages
from django.core.mail import send_mail
from django.template import loader
from main.settings import DEFAULT_FROM_EMAIL
from authsystem.forms import RegistrationForm, UserLoginForm, ProfileEditForm, UserPasswordChangeForm, \
    UserPasswordResetForm, UserSetPasswordForm
from django.core.urlresolvers import reverse
from customuser.models import CustomUser

from PIL import Image
import json


class RegisterView(FormView):
    template_name = 'register.html'
    form_class = RegistrationForm

    @method_decorator(sensitive_post_parameters('password1', 'password2'))
    @method_decorator(never_cache)
    @method_decorator(csrf_protect)
    def dispatch(self, request, *args, **kwargs):
        return super(RegisterView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        form.save()
        username = form.cleaned_data['email']
        password = form.cleaned_data['password1']
        user = auth.authenticate(username=username, password=password)
        auth.login(self.request, user)
        return redirect(reverse('main'))

    def get_success_url(self):
        return reverse('main')


class LoginView(FormView):
    form_class = UserLoginForm
    template_name = 'login.html'

    @method_decorator(sensitive_post_parameters('password'))
    @method_decorator(never_cache)
    @method_decorator(csrf_protect)
    def dispatch(self, request, *args, **kwargs):
        return super(LoginView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        self.user = form.get_user()
        auth.login(self.request, self.user)
        return super(LoginView, self).form_valid(form)

    def get_success_url(self):
        return reverse('main')


class LogoutView(RedirectView):
    def get(self, request, *args, **kwargs):
        auth.logout(request)
        return super(LogoutView, self).get(request, *args, **kwargs)

    def get_redirect_url(self):
        return reverse('main')


class UserProfileSeeView(TemplateView):
    template_name = 'user_profile.html'

    def get_context_data(self, **kwargs):
        context = super(UserProfileSeeView, self).get_context_data(**kwargs)
        context['person'] = self.request.user
        return context


class UserPersonProfileSeeView(TemplateView):
    template_name = 'person_profile.html'

    def get_context_data(self, **kwargs):
        context = super(UserPersonProfileSeeView, self).get_context_data(**kwargs)
        context['person'] = CustomUser.objects.get(email=kwargs.get('email'))
        return context


class UserAvatarChange(TemplateView):
    def post(self, request, *args, **kwargs):
        user = CustomUser.objects.get(email=request.user.email)
        image_file = request.FILES.get('avatar_file')
        user.avatar = image_file
        user.save()

        image_data = json.loads(request.POST.get('avatar_data'))
        print(image_data)
        x = image_data['x']
        y = image_data['y']
        w = round(image_data['width'])
        h = round(image_data['height'])
        img = Image.open(image_file)
        croped_img = img.crop((x, y, x + w, y + h))
        croped_img.save(user.avatar.path)
        return JsonResponse({'state': 200,
                             'Message': 'Good',
                             'result': user.avatar.path})


class UserProfileEditView(UpdateView):
    template_name = 'user_profile_edit.html'
    form_class = ProfileEditForm
    model = CustomUser
    success_url = '/accounts/profile-edit/'

    def get_object(self, queryset=None):
        return CustomUser.objects.get(email=self.request.user.email)

    @method_decorator(sensitive_post_parameters('password'))
    @method_decorator(never_cache)
    @method_decorator(csrf_protect)
    def dispatch(self, request, *args, **kwargs):
        return super(UserProfileEditView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form, **kwargs):
        f = form.save()
        messages.add_message(request=self.request, level=messages.SUCCESS, message='Профиль успешно изменен')
        return super(UserProfileEditView, self).form_valid(form)


class UserProfileDeleteView(DeleteView):
    model = CustomUser
    template_name = 'user_profile_delete.html'

    def delete(self, request, *args, **kwargs):
        """
        Calls the delete() method on the fetched object and then
        redirects to the success URL.
        """
        self.object = self.get_object()
        user = self.object
        success_url = self.get_success_url()
        self.object.delete()

        c = {
            'email': user.email,
            'domain': request.META['HTTP_HOST'],
            'site_name': 'reminder',
            'user': user,
            'protocol': 'http',
        }

        subject_template_name = 'email_templates/userprofile_delete_subject.txt'
        email_template_name = 'email_templates/userprofile_delete_email.html'
        subject = loader.render_to_string(subject_template_name, c)
        subject = ''.join(subject.splitlines())
        email = loader.render_to_string(email_template_name, c)
        send_mail(subject, email, DEFAULT_FROM_EMAIL, [user.email], fail_silently=False)

        messages.success(request, 'Ваш профиль {0} был удален'.format(user.email))

        return HttpResponseRedirect(success_url)

    def get_object(self, queryset=None):
        return CustomUser.objects.get(email=self.request.user.email)

    def get_success_url(self):
        return reverse('information')


class UserPasswordChangeView(FormView):
    template_name = 'password_change.html'
    form_class = UserPasswordChangeForm
    success_url = '/accounts/profile-edit/'

    def get_form_kwargs(self):
        kwargs = super(UserPasswordChangeView, self).get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    # @method_decorator(sensitive_post_parameters('password'))
    # @method_decorator(never_cache)
    # @method_decorator(csrf_protect)
    # def dispatch(self, request, *args, **kwargs):
    #     return super(UserPasswordChangeView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form, **kwargs):
        f = form.save()
        return super(UserPasswordChangeView, self).form_valid(form)


class ResetPasswordView(FormView):
    template_name = 'password_reset.html'
    # success_url = '/accounts/information/'
    form_class = UserPasswordResetForm

    def get_success_url(self):
        return reverse('information')

    @staticmethod
    def validate_email_address(email):
        try:
            validate_email(email)
            return True
        except ValidationError:
            return False

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            data = form.cleaned_data['email']
            if self.validate_email_address(data) is True:
                associated_users = CustomUser.objects.filter(Q(email=data))
                if associated_users.exists():
                    for user in associated_users:
                        c = {
                            'email': user.email,
                            'domaim': request.META['HTTP_HOST'],
                            'site_name': 'reminder',
                            'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                            'user': user,
                            'token': default_token_generator.make_token(user),
                            'protocol': 'http',
                        }
                        subject_template_name = 'email_templates/password_reset_subject.txt'
                        email_template_name = 'email_templates/password_reset_email.html'
                        subject = loader.render_to_string(subject_template_name, c)
                        subject = ''.join(subject.splitlines())
                        email = loader.render_to_string(email_template_name, c)
                        send_mail(subject, email, DEFAULT_FROM_EMAIL, [user.email], fail_silently=False)
                    result = self.form_valid(form)
                    messages.success(request,
                                     'Письмо отправлено на ваш адрес email: ' + data + '. Пожалуйста перейдите по сслылке из письма. ')
                    return result
                result = self.form_invalid(form)
                messages.error(request, 'Пользователь с email {0} не зарегистрирован в системе'.format(data))
                return result
            messages.error(request, 'Неправильный адрес email')
            return self.form_invalid(form)


class PasswordResetConfirmView(FormView):
    template_name = "password_set.html"
    form_class = UserSetPasswordForm

    def get_success_url(self):
        return reverse('login')

    def post(self, request, uidb64=None, token=None, *arg, **kwargs):
        UserModel = auth.get_user_model()
        form = self.form_class(request.POST)
        assert uidb64 is not None and token is not None
        try:
            uid = urlsafe_base64_decode(uidb64)
            user = UserModel._default_manager.get(pk=uid)
        except (TypeError, ValueError, OverflowError, UserModel.DoesNotExist):
            user = None

        if user is not None and default_token_generator.check_token(user, token):
            if form.is_valid():
                new_password = form.cleaned_data['new_password2']
                user.set_password(new_password)
                user.save()
                messages.success(request, 'Пароль успешно сменен')
                return self.form_valid(form)
            else:
                messages.error(request, 'Смена пароля произошла неудачно')
                return self.form_invalid(form)
        else:
            messages.error(request, 'Ссылка для смены пароля уже не действительна')
            return self.form_invalid(form)


class InformationView(TemplateView):
    template_name = 'info.html'
