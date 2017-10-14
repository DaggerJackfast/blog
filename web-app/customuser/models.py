from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin
from django.db import models



class UserManager(BaseUserManager):
    def create_user(self, email, password=None):
        if not email:
            raise ValueError('Email непременно должен быть указан')

        user = self.model(
            email=UserManager.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        user = self.create_user(email, password)
        user.is_admin = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


def get_userprofile_avatar(instance, filename):
    return 'userprofile/avatars/{0}/{1}-{2}.{3}'.format(instance.email, instance.firstname, instance.lastname,
                                                        filename.split('.')[-1:][0])


def get_default_name():
    return 'defaults/user_avatars.jpg'


class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        'Email',
        max_length=255,
        unique=True,
        db_index=True
    )
    avatar = models.ImageField(
        'Аватар',
        blank=True,
        null=True,
        upload_to=get_userprofile_avatar,
        default=get_default_name()
    )
    firstname = models.CharField(
        'Имя',
        max_length=40,
        null=True,
        blank=True
    )
    lastname = models.CharField(
        'Фамилия',
        max_length=40,
        null=True,
        blank=True
    )
    middlename = models.CharField(
        'Отчество',
        max_length=40,
        null=True,
        blank=True
    )
    date_of_birth = models.DateField(
        'Дата рождения',
        null=True,
        blank=True
    )
    register_date = models.DateField(
        'Дата регистрации',
        auto_now_add=True
    )
    gender = models.NullBooleanField(
        'Пол',
        null=True,
        blank=True
    )
    is_active = models.BooleanField(
        'Активен',
        default=True
    )
    is_admin = models.BooleanField(
        'Суперпользователь',
        default=False
    )

    # def save(self, *args, **kwargs):
    #     try:
    #         this = CustomUser.objects.get(email=self.email)
    #         if this.avatar != self.avatar:
    #             if this.avatar.name != get_default_name():
    #                 path=this.avatar.path
    #                 this.avatar.delete()
    #                 shutil.rmtree(os.path.dirname(path))
    #     except:
    #         pass
    #     super(CustomUser, self).save(*args, **kwargs)

    def get_full_name(self):
        return self.email

    def get_official_name(self):
        return "{0} {1}".format(self.firstname, self.lastname)
    # @property
    # def is_superuser(self):
    #     return self.is_admin

    @property
    def is_staff(self):
        return self.is_admin

    def get_avatar(self):
        return self.avatar

    def get_short_name(self):
        return self.email

    def __str__(self):
        return self.email

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    class Meta:
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'

