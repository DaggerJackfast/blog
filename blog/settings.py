try:
    from blog.setting_files.development import *
except ImportError:
    from blog.setting_files.production import *

