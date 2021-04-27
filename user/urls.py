# user的urls模块

from django.urls import path
from . import views

urlpatterns = [
    # 用户的注册和登陆
    path('login.html', views.loginView, name='login'),
    # 用户登录中心
    path('home/<int:page>.html', views.homeView, name='home'),
    # 退出用户登陆
    path('logout.html', views.logoutView, name='logout'),
    path('info.html', views.infoView, name='info'),
    path('position', views.position, name='position'),
    path('delete', views.delete, name='delete'),
    path('signin', views.signin, name='signin'),
    path('levelup', views.levelup, name='levelup'),
    path('modify', views.modify, name='modify'),
    path('upload', views.upload, name='upload'),
]
