import os
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEBUG=False
ALLOWED_HOSTS = []

MANAGERS = (('admin', 'jackfast.dagger@yandex.ru'))
EMAIL_HOST = 'smtp.yandex.ru'
EMAIL_HOST_USER = 'jackfast.dagger@yandex.ru'
EMAIL_HOST_PASSWORD = 'adminder123456789'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'jackfast.dagger@yandex.ru'

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

# STATIC_URL = '/static/'
# STATIC_ROOT = os.path.join(BASE_DIR, 'static/collectstatic/')
# STATICFILES_DIRS = (
#     os.path.join(BASE_DIR, 'static'),
# )
# MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
# MEDIA_URL = '/media/'
# LOGIN_URL = 'login'
# LOGOUT_URL = 'logout'
# LOGIN_REDIRECT_URL = 'articles'