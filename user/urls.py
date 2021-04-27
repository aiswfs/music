# user��urlsģ��

from django.urls import path
from . import views

urlpatterns = [
    # �û���ע��͵�½
    path('login.html', views.loginView, name='login'),
    # �û���¼����
    path('home/<int:page>.html', views.homeView, name='home'),
    # �˳��û���½
    path('logout.html', views.logoutView, name='logout'),
    path('info.html', views.infoView, name='info'),
    path('position', views.position, name='position'),
    path('delete', views.delete, name='delete'),
    path('signin', views.signin, name='signin'),
    path('levelup', views.levelup, name='levelup'),
    path('modify', views.modify, name='modify'),
    path('upload', views.upload, name='upload'),
]
