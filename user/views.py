# -*- coding: utf-8 -*-
# user的views模块
from django.shortcuts import render, redirect
from django.db.models import Q
from index.models import Dynamic
from user.models import *
from django.contrib.auth import login, logout
from django.contrib.auth.hashers import check_password
from .form import MyUserCreationForm
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponseRedirect, HttpResponse
import json
import os
from django.conf import settings
from .form_upload import FileFieldForm

# 用户注册与登录
def loginView(request):
    # 表单对象user
    user = MyUserCreationForm()
    # 表单提交
    if request.method == 'POST':
        # 用户登陆
        if request.POST.get('loginUser', ''):               # 获取搜索内容如果为loginUser，没有返回空
            loginUser = request.POST.get('loginUser', '')   # 这里是已经获取到用户输入的
            password = request.POST.get('password', '')
            if MyUser.objects.filter(Q(mobile = loginUser) | Q(username=loginUser)):
                user = MyUser.objects.filter(Q(mobile=loginUser) | Q(username=loginUser)).first()
                if check_password(password, user.password):
                    login(request, user)
                    # userclass = MyUser.objects.get(is_superuser = user)
                    # print(userclass)
                    return redirect('/user/home/1.html')    # 页面跳转
                else:
                    tips = '密码错误'
            else:
                tips = '用户不存在'
        # 用户注册
        else:
            user = MyUserCreationForm(request.POST)
            if user.is_valid():
                user.save()
                tips = '注册成功'
            else:
                if user.errors.get('username', ''):
                    tips = user.errors.get('username', '注册失败')
                else:
                    tips = user.errors.get('mobile', '注册失败')
    return render(request, 'login.html', locals())

# 用户中心
# 设置用户登录限制
@login_required(login_url='/user/login.html')
def homeView(request, page):
    userid = request.user.id
    user_info = MyUser.objects.get(id=int(userid))
    userlevel = bool(user_info.is_superuser)
    if 0 == len(user_info.playlist):
        dblist = []
    else:
        dblist = json.loads(user_info.playlist)
    # 热搜歌曲
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:4]
    # 分页功能
    song_info = request.session.get('play_list', [])
    addlist = []
    for item1 in dblist:
        flag = False
        for item2 in song_info:
            if item1['song_id'] == item2['song_id']:
                flag = True
                break
        if not flag:
            addlist.append(item1)
    song_info = song_info + addlist
    user_info.playlist = json.dumps(song_info)
    user_info.save()
    request.session['play_list'] = song_info
    paginator = Paginator(song_info, 3)
    try:
        contacts = paginator.page(page)
    except PageNotAnInteger:
        contacts = paginator.page(1)
    except EmptyPage:
        contacts = paginator.page(paginator.num_pages)
    return render(request, 'home.html', locals())

@login_required(login_url='/user/login.html')
def logoutView(request):
    logout(request)
    return redirect('/')

@login_required(login_url='/user/login.html')
def infoView(request):
    userid = request.user.id
    user = MyUser.objects.get(id=int(userid))
    return render(request, 'info.html', locals())


def single_upload(f):
    file_path = os.path.join(settings.FILE_URL,f.name)

    destination =  open(file_path,'wb+')
    for chunk in f.chunks():
        destination.write(chunk)
    destination.close()

@login_required(login_url='/user/login.html')
def upload(request):
    # if request.method == 'GET':  #单个文件上传
    #     return render(request,'upload.html')
    # elif request.method == 'POST':
    #     content = request.FILES.get("upload",None)
    #     if not content :
    #         return HttpResponse("没有上传内容")
    #     position = os.path.join(settings.FILE_URL,content.name)
    #
    #     storage = open(position,'wb+')
    #     for chunk in content.chunks():
    #         storage.write(chunk)
    #     storage.close()
    #     return HttpResponse('上传成功')
    # return HttpResponseRedirect('失败了')

    # 批次文件上传
    if request.method == 'POST':
        form = FileFieldForm(request.POST,request.FILES)
        files = request.FILES.getlist('file_field',None)
        msg = 0
        if form.is_valid():
            for f in files:
                single_upload(f)
            msg = 1
            print(msg)
            # return HttpResponseRedirect('upload',msg)
            return render(request,'upload.html',locals())
            # return render(request,'upload.html',bool(msg))
        return HttpResponseRedirect('文件上传失败')
    else:
        form = FileFieldForm()
    return render(request,'upload.html',locals())


def position(request):
    song_id = int(request.GET['songid'])
    print('song_id: ' + str(song_id))
    if request.user.is_authenticated:
        userid = request.user.id
        user_info = MyUser.objects.get(id=int(userid))
        user_info.position = song_id
        user_info.save()
    return HttpResponse('ok')

def delete(request):
    song_id = int(request.GET['songid'])
    print('song_id: ' + str(song_id))
    # song_info = request.session.get('play_list', [])
    if request.user.is_authenticated:
        userid = request.user.id
        user_info = MyUser.objects.get(id=int(userid))
        if 0 == len(user_info.playlist):
            playlist = []
        else:
            playlist = json.loads(user_info.playlist)
        idx = -1
        for i in range(len(playlist)):
            if playlist[i]['song_id'] == song_id:
                idx = i
                break
        if idx >= 0:
            del playlist[idx]
            user_info.playlist = json.dumps(playlist)
        print(user_info.playlist)
        user_info.save()
        request.session['play_list'] = playlist
    return HttpResponse('ok')


def signin(request):
    if not request.user.is_authenticated:
        return HttpResponse('login')
    userid = request.user.id
    user_info = MyUser.objects.get(id=int(userid))
    user_info.integral += 1
    user_info.save()
    return HttpResponse('ok')


def levelup(request):
    if not request.user.is_authenticated:
        return HttpResponse('login')
    userid = request.user.id
    user_info = MyUser.objects.get(id=int(userid))
    if user_info.integral < 30:
        return HttpResponse('fail')
    user_info.integral -= 30
    user_info.level = 'VIP用户'
    user_info.save()
    return HttpResponse('ok')

# 修改信息接口
@login_required(login_url='/user/login.html')
def modify(request):
    oldpwd = request.GET['oldpwd']
    newpwd1 = request.GET['newpwd1']
    newpwd2 = request.GET['newpwd2']
    if newpwd1 != newpwd2:
        return HttpResponse('pwddiff')
    userid = request.user.id
    user = MyUser.objects.get(id=int(userid))
    if not check_password(oldpwd, user.password):
        return HttpResponse('pwderr')
    user.set_password(newpwd1)
    user.save()
    return HttpResponse('ok')

# def songlistdis(request):
#     pass
#     return HttpResponse('ok')