# -*- coding: utf-8 -*-
# views.py
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render, redirect
from django.http import Http404
from index.models import *
import time


def commentView(request, song_id):
    # 搜索结果
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:6]
    # 点评提交处理
    if request.method == 'POST':
        comment_text = request.POST.get('comment', '')
        comment_user = request.user.username if request.user.username else '匿名用户'
        if comment_text:
            comment = Comment()
            comment.comment_text = comment_text
            comment.comment_user = comment_user
            comment.comment_date = time.strftime('%Y-%m-%d', time.localtime(time.time()))
            comment.song_id = song_id
            comment.save()
        return redirect('/comment/%s.html' % (str(song_id)))
    else:
        song_info = Song.objects.filter(song_id=song_id).first()
        # 歌曲不存在，抛出404
        if not song_info:
            raise Http404
        comment_all = Comment.objects.filter(song_id=song_id).order_by('comment_date')
        song_name = song_info.song_name
        page = int(request.GET.get('page', 1))  # 当请求参数不存在时，默认页数为1，如果存在，将参数值转化为Int类型
        # 每2条点评信息设置为一页
        paginator = Paginator(comment_all, 2)  # Paginator分页功能 可以接收列表、元组或其它可迭代的对象。
        try:
            contacts = paginator.page(page)
        except PageNotAnInteger:
            contacts = paginator.page(1)
        except EmptyPage:
            contacts = paginator.page(paginator.num_pages)
        return render(request, 'comment.html', locals())
