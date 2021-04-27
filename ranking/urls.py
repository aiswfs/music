# rankingµÄurls.py
from django.urls import path
from . import views

urlpatterns = [
    path('rank', views.rankingView, name='ranking'),
    path('label', views.labelView, name='label'),
]
