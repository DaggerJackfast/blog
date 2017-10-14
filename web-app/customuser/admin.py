from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from customuser.forms import UserCreationForm, UserChangeForm
from customuser.models import CustomUser


class UserAdmin(UserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = [
        'email',
        'date_of_birth',
        'firstname',
        'lastname',
        'middlename',
        'is_admin',
    ]

    list_filter = ('is_admin',)

    fieldsets = (
                (None, {'fields': ('email', 'password')}),
                ('Personal info', {
                 'fields': (
                     'avatar',
                     'date_of_birth',
                     'firstname',
                     'lastname',
                     'middlename',
                     'gender',
                 )}),
                ('Permissions', {'fields': ('is_admin',)}),
                ('Important dates', {'fields': ('last_login',)}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'date_of_birth',
                'email',
                'password1',
                'password2'
            )}
         ),
    )

    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()

# Регистрация нашей модели
admin.site.register(CustomUser, UserAdmin)
# admin.site.unregister(Group)