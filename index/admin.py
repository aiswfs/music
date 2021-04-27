# -*- coding: utf-8 -*-
# index的admin.py
from django.contrib import admin
from .models import *

# 修改title和header

admin.site.site_title = '我的音乐后台管理系统'
admin.site.site_header = '我的音乐'


# 模型Label

@admin.register(Label)
class LabelAdmin(admin.ModelAdmin):
    # 设置模型字段，用于Admin后台数据的表头设置
    list_display = ['label_id', 'label_name']
    # 设置可搜索的字段并在Admin后台数据生成搜索框,如有外键应使用双下画线链接两个模型的字段
    search_fields = ['label_name']
    # 设置排序方式
    ordering = ['label_id']


# 模型Song
@admin.register(Song)
class SongAdmin(admin.ModelAdmin):
    list_display = ['song_id', 'song_name', 'song_singer', 'song_album', 'song_languages', 'song_release']
    search_fields = ['song_name', 'song_singer', 'song_album', 'song_languages']
    # 设置过滤器，在后台数据的右侧生成导航栏,如有外键应使用双下画线连接两个模型的字段
    list_filter = ['song_singer', 'song_album', 'song_languages']
    ordering = ['song_id']


# 模型Dynamic
@admin.register(Dynamic)
class DynamicAdmin(admin.ModelAdmin):
    list_display = ['dynamic_id', 'song', 'dynamic_plays', 'dynamic_search', 'dynamic_down']
    search_fields = ['song']
    list_filter = ['dynamic_plays', 'dynamic_search', 'dynamic_down']
    ordering = ['dynamic_id']


# 模型Comment
@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['comment_id', 'comment_text', 'comment_user', 'song', 'comment_date']
    search_fields = ['comment_user', 'song', 'comment_date']
    list_filter = ['song', 'comment_date']
    ordering = ['comment_id']

# @admin.register(FileUpload)
# class FileUpload(admin.ModelAdmin):
#     pass
