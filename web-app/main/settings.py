"""
Django settings for blog project.

Generated by 'django-admin startproject' using Django 1.9.2.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""
import os
import environ
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SECRET_KEY = '%#l9d%*i=bqoe$8vb#i0*rrlh@4(ir+j+-f(nur3w(gs_j7r!d'

ALLOWED_HOSTS = ["*"]

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'easy_thumbnails',
    'ckeditor',
    'ckeditor_uploader',
    'article',
    'authsystem',
    'customuser',
]

AUTH_USER_MODEL = 'customuser.CustomUser'
AUTHENTICATION_BACKENDS = (
    "django.contrib.auth.backends.ModelBackend",
)


MIDDLEWARE_CLASSES = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

THUMBNAIL_ALIASES = {
    '': {
        'header': {'size': (22, 22), 'crop': True},
        'userprofile': {'size': (300, 300), 'crop': True},
    },
}




ROOT_URLCONF = 'main.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',

        'DIRS': [os.path.join(BASE_DIR, 'templates'), ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'main.wsgi.application'

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

LANGUAGE_CODE = 'ru-ru'

TIME_ZONE = 'Asia/Bishkek'

USE_I18N = True

USE_L10N = True

USE_TZ = True

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'collectstatic')
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)
STATICFILES_STORAGE='django.contrib.staticfiles.storage.CachedStaticFilesStorage'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'
LOGIN_URL = 'login'
LOGOUT_URL = 'logout'
LOGIN_REDIRECT_URL = 'articles'
CKEDITOR_UPLOAD_PATH = 'articles/uploads/'
CKEDITOR_CONFIGS = {
    'default': {
        'height': 400,
        'width': '100%',
    },
}
from easy_thumbnails.conf import Settings as thumbnail_settings

THUMBNAIL_PROCESSORS = (
                           'image_cropping.thumbnail_processors.crop_corners',
                       ) + thumbnail_settings.THUMBNAIL_PROCESSORS

LOGS_DIR = os.path.join(BASE_DIR, 'logs')
LOG_FILE = os.path.join(LOGS_DIR,'django.log')
FILE_LOGGER='file_logger'
TWENTY_MBYTES = 20971520
BACKUP_COUNT = 4
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '[%(asctime)s] %(levelname)s [%(name)s.%(funcName)s:%(lineno)d] %(message)s',
            'datefmt': '%Y-%m-%d %H:%M:%S'
        },
    },
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
        FILE_LOGGER: {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'maxBytes': TWENTY_MBYTES,
            'backupCount': BACKUP_COUNT,
            'filename': LOG_FILE,
            'formatter': 'verbose'
        }
    },
    'loggers': {
        'django': {
            'handlers': [FILE_LOGGER],
            'level': 'INFO',
            'propagate': False
        },
    },
}
#secret settings

env=environ.Env(DEBUG=(bool, False))
DEBUG=env('DEBUG')
TEMPLATE_DEBUG=DEBUG
DATABASES={
    'default':{
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": os.environ.get("DATABASE_NAME"),
        "USER": os.environ.get("DATABASE_USER"),
        "PASSWORD":os.environ.get("DATABASE_PASSWORD"),
        "HOST": os.environ.get("DATABASE_HOST"),
    }
}
MANAGERS = (('admin', os.environ.get("EMAIL")))
EMAIL_HOST =  os.environ.get("EMAIL_HOST")
EMAIL_HOST_USER =  os.environ.get("EMAIL_HOST_PASSWORD")
EMAIL_HOST_PASSWORD =  os.environ.get("EMAIL")
EMAIL_PORT =  os.environ.get("EMAIL")
EMAIL_USE_TLS =  os.environ.get("EMAIL")
DEFAULT_FROM_EMAIL =  os.environ.get("EMAIL")

try:
    from main.settings_local import *
except ImportError:
   pass