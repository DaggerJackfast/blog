import os
SERVER = os.getenv('SERVER')
if SERVER == 'production':
    from blog.setting_files.production import *
else:
    try:
        from blog.setting_files.development import *
    except ImportError:
        from blog.setting_files.production import *

