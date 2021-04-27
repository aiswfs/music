# -*-coding: utf-8 -*-

from django.contrib.auth.decorators import login_required
from django.http import StreamingHttpResponse
from django.shortcuts import render
from index.models import *
from user.models import MyUser
import json


def playView(request, song_id):
    # 热搜歌曲
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:6]
    # 歌曲信息
    song_info = Song.objects.get(song_id=int(song_id))
    # 歌曲列表
    play_list = request.session.get('play_list', [])
    song_exist = False
    if play_list:
        for i in play_list:
            print(i['song_id'])
            if int(song_id) == i['song_id']:
                song_exist = True
    if song_exist == False:
        play_list.append(
            {'song_id': int(song_id), 'song_singer': song_info.song_singer, 'song_name': song_info.song_name,
             'song_time': song_info.song_time})
        request.session['play_list'] = play_list

    # 如果登录，将session和db中的playlist合并
    if request.user.is_authenticated:
        userid = request.user.id
        user_info = MyUser.objects.get(id=int(userid))
        dblist = str(user_info.playlist)
        if 0 == len(dblist):
            dblist = []
        else:
            dblist = json.loads(dblist)
        addlist = []
        for item1 in dblist:
            flag = False
            for item2 in play_list:
                if item1['song_id'] == item2['song_id']:
                    flag = True
                    break
            if not flag:
                addlist.append(item1)
        play_list = play_list + addlist
        user_info.playlist = json.dumps(play_list)
        user_info.save()
        request.session['play_list'] = play_list
    # 歌词
    if song_info.song_lyrics != '暂无歌词':
        f = open('static/songLyric/' + song_info.song_lyrics, 'r', encoding='utf-8')
        song_lyrics = f.read()
        f.close()
        # 相关歌曲
    song_type = Song.objects.values('song_type').get(song_id=song_id)['song_type']
    song_relevant = Dynamic.objects.select_related('song').filter(song__song_type=song_type).order_by(
        '-dynamic_plays').all()[:6]

    # 添加播放次数
    dynamic_info = Dynamic.objects.filter(song_id=int(song_id)).first()
    # 判断歌曲动态信息是否存在, 存在就在原来的基础上+1
    if dynamic_info:
        dynamic_info.dynamic_plays += 1
        dynamic_info.save()
        # 若动态信息不存在，则创建新的动态信息
    else:
        dynamic_info = Dynamic(dynamic_plays=1, dynamic_search=0, dynamic_down=0, song_id=song_id)
        dynamic_info.save()
    return render(request, 'play.html', locals())


@login_required(login_url='/user/login.html')
# 歌曲下载
def downloadView(request, song_id):
    # 根据song_id查找歌曲信息
    song_info = Song.objects.get(song_id=int(song_id))
    song_name = Song.objects.get(song_id=int(song_id))
    print(str(song_name))
    # 添加下载次数
    dynamic_info = Dynamic.objects.filter(song_id=int(song_id)).first()
    if dynamic_info:
        dynamic_info.dynamic_down += 1
        dynamic_info.save()
        # 若动态信息不存在，则创建新的动态信息
    else:
        dynamic_info = Dynamic(dynamic_plays=0, dynamic_search=0, dynamic_down=1, song_id=song_id)
        dynamic_info.save()
    # 读取文件内容
    file = 'static/songFile/' + song_info.song_file

    def file_iterator(file, chunk_size=512):
        with open(file, 'rb') as f:
            while True:
                c = f.read(chunk_size)
                if c:
                    yield c
                else:
                    break

    # 将文件内容写入StreamingHttpResponse对象，并以字节流的方式返回给用户，实现文件下载
    filename = str(song_id) + '.mp3'
    response = StreamingHttpResponse(file_iterator(file))
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment; filename="%s"' % (filename)
    return response
