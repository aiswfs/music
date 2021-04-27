# play��urls.py
from django.urls import path
from . import views

urlpatterns = [
    # ��������ҳ��
    path('<int:song_id>.html', views.playView, name='play'),
    # ��������
    path('download/<int:song_id>.html', views.downloadView, name='download')
]
