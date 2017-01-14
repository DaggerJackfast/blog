import os
from .base import *

DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'blog',
        'USER': 'djangouser',
        'PASSWORD': 'admin123',
        'PORT': '',
        'OPTIONS': {
            'init_command': 'SET default_storage_engine=INNODB',
        }
    }
}

MANAGERS = (('admin', 'admin@gmail.com'))
EMAIL_HOST = 'smtp.google.com'
EMAIL_HOST_USER = 'admin@gmail.com'
EMAIL_HOST_PASSWORD = 'admin123'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'admin@gmail.com'

EMAIL_BACKEND = 'django.core.mail.backends.filebased.EmailBackend'
EMAIL_FILE_PATH = os.path.join(BASE_DIR, 'media/temp/email/')
