# -*-coding: utf-8 -*-
# ranking的views.py
from django.shortcuts import render
from index.models import *


def rankingView(request):
    # 热搜歌曲
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:4]

    # 歌曲分类列表
    All_list = Song.objects.values('song_type').distinct()
    # 关键词 DISTINCT 用于返回唯一不同的值。

    # 歌曲列表信息
    song_type = request.GET.get('type', '')
    # 寻找名为type的GET参数，而且如果参数没有提交，返回一个空的字符串。

    if song_type:
        song_info = Dynamic.objects.select_related('song').filter(song__song_type=song_type).order_by(
            '-dynamic_plays').all()[:10]
    else:
        song_info = Dynamic.objects.select_related('song').order_by('-dynamic_plays').all()[:10]
    return render(request, 'ranking.html', locals())


def labelView(request):
    # 热搜歌曲
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:4]

    # 歌曲分类列表
    All_list = Label.objects.values('label_id', 'label_name')

    # 歌曲列表信息
    song_label = request.GET.get('label', '')
    # 寻找名为type的GET参数，而且如果参数没有提交，返回一个空的字符串。

    if song_label:
        song_info = Dynamic.objects.select_related('song').filter(song__label_id=song_label).order_by(
            '-dynamic_plays').all()[:10]
    else:
        song_info = Dynamic.objects.select_related('song').order_by('-dynamic_plays').all()[:10]
    return render(request, 'label.html', locals())


"""
web开发一般是一个无聊的过程，尤其在视图编写功能方面。所以在Django中植入了通用视图这一概念，该功能封装了视图开发常用的代码和模式。根据用途划分三大类：

TemplateView直接返回HTML模板，但无法将数据库的数据展示出来

ListView能将数据库的数据传递给HTML模板，通常获取某个表的所有数据

DetailView能将数据库的数据传递给HTML模板，通常获取数据表的单条数据

通用模板的代码

#ranking.urls
from django.urls import path
from . import views

urlpatterns = [
    #通用视图
    path('.list', views.RankingList.as_view(), name = 'rankingList'),
]

#ranking.views
from django.views.generic import ListView

class RankingList(ListView):
    #context_object_name 设置HTML模板的某一个变量名称
    context_object_name = 'song_info'
    #设定模板文件
    template_name = 'ranking.html'
    #查询变量song_info的数据
    def get_queryset(self):
        #获取请求参数
        song_type = self.request.GET.get('type', '')
        if song_type:
            song_info = Dynamic.objects.select_related('song').filter(song__song_type=song_type).order_by('-dynamic_plays').all()[:10]
        else:
            song_info = Dynamic.objects.select_related('song').order_by('-dynamic_plays').all()[:10]
        return song_info

    #添加其他变量
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        #搜索歌曲
        context['search_song'] = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:4]
        #所有歌曲分类
        context['All_list'] = Song.objects.values('song_type').distinct()
        return context
"""
