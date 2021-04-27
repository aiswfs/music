# -*-coding: utf-8 -*-
# Create your views here.
# views.py
from django.shortcuts import render, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from index.models import *


def searchView(request, page):
    if request.method == 'GET':

        search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:6]

        kword = request.session.get('kword', '')
        if kword:
            song_info = Song.objects.values('song_id', 'song_name', 'song_singer', 'song_time').filter(
                Q(song_name__icontains=kword) | Q(song_singer=kword)).order_by('-song_release').all()
        else:
            song_info = Song.objects.values('song_id', 'song_name', 'song_singer', 'song_time').order_by(
                '-song_release').all()[:50]
            info = "1111"
        # 分页功能,是django的一个库函数，叫做分页器，设置每一页显示几条数据
        paginator = Paginator(song_info, 5)
        try:
            contacts = paginator.page(page)
        except PageNotAnInteger:
            contacts = paginator.page(1)
        except EmptyPage:
            contacts = paginator.page(paginator.num_pages)
        # 添加歌曲搜索次数
        song_exist = Song.objects.filter(song_name=kword)
        if song_exist:
            song_id = song_exist[0].song_id
            dynamic_info = Dynamic.objects.filter(song_id=int(song_id)).first()
            # 判断歌曲动态信息是否存在,存在就在原来的基础上加1
            if dynamic_info:
                dynamic_info.dynamic_search += 1
                dynamic_info.save()
            # 若动态信息不存在，则创建新的动态信息
            else:
                dynamic = Dynamic(dynamic_plays=0, dynamic_search=1, dynamic_down=0, song_id=song_id)
                dynamic.save()
            return render(request, 'search.html', locals())
    else:

        request.session['kword'] = request.POST.get('kword', '')
        return redirect('/search/1.html')
    return render(request, 'search.html', locals())
