from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from authsystem.views import RegisterView, LoginView, LogoutView, UserProfileSeeView, UserProfileEditView, \
    UserAvatarChange, UserPasswordChangeView, ResetPasswordView, PasswordResetConfirmView, InformationView, \
    UserProfileDeleteView

urlpatterns = [
    url(r'^register/$', RegisterView.as_view(), name='registration'),
    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    # url(r'^profile/(?P<email>\w+|[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4})/$',
    #     login_required(UserProfileSeeView.as_view()), name='profile'),
    url(r'^profile/$',login_required(UserProfileSeeView.as_view()), name='profile'),
    url(r'^profile-edit/$', login_required(UserProfileEditView.as_view()), name='profile_edit'),
    url(r'^profile-edit/delete-profile/$', login_required(UserProfileDeleteView.as_view()), name='profile_delete'),
    url(r'^profile-edit/change-password/$', login_required(UserPasswordChangeView.as_view()), name='change_password'),
    url(r'^profile-edit/change-avatar/$', login_required(UserAvatarChange.as_view()), name='change_avatar'),
    url(r'^reset-password/$', ResetPasswordView.as_view(), name='reset_password'),
    url(r'^reset_password_confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$', PasswordResetConfirmView.as_view(),
        name='reset_password_confirm'),
    url(r'^information/$', InformationView.as_view(), name='information')

]
