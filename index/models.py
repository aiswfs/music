# -*- coding: utf-8 -*-

from django.db import models

# Create your models here.
# 歌曲分类表label
from music import settings


class Label(models.Model):
    label_id = models.AutoField('序号', primary_key=True)
    label_name = models.CharField('分类标签', max_length=10)

    def __str__(self):
        # 设置返回值，若不设置，则默认返回Type对象
        return self.label_name

    class Meta:
        # 设置Admin界面的显示内容
        verbose_name = '歌曲分类'
        verbose_name_plural = '歌曲分类'


# 歌曲信息表song
class Song(models.Model):
    song_id = models.AutoField('序号', primary_key=True)
    song_name = models.CharField('歌名', max_length=50)
    song_singer = models.CharField('歌手', max_length=50)
    song_time = models.CharField('时长', max_length=10)
    song_album = models.CharField('专辑', max_length=50)
    song_languages = models.CharField('语种', max_length=20)
    song_type = models.CharField('类型', max_length=20)
    song_release = models.CharField('发行时间', max_length=20)
    song_img = models.CharField('歌曲图片', max_length=20)
    song_lyrics = models.CharField('歌词', max_length=50, default='暂无歌词')
    song_file = models.CharField('歌曲文件', max_length=50)
    label = models.ForeignKey(Label, on_delete=models.CASCADE, verbose_name='歌名分类')

    def __str__(self):
        return self.song_name

    class Meta:
        # 设置Admin界面的显示内容
        verbose_name = '歌曲信息'
        verbose_name_plural = '歌曲信息'


# 歌曲动态表dynamic
class Dynamic(models.Model):
    dynamic_id = models.AutoField('序号', primary_key=True)  # 生成默认的id字段
    song = models.ForeignKey(Song, on_delete=models.CASCADE, verbose_name='歌名')
    dynamic_plays = models.IntegerField('播放次数')
    dynamic_search = models.IntegerField('搜索次数')
    dynamic_down = models.IntegerField('下载次数')

    class Meta:
        # 设置admin界面的显示内容
        verbose_name = '歌曲动态'
        verbose_name_plural = '歌曲动态'


class Comment(models.Model):
    comment_id = models.AutoField('序号', primary_key=True)
    comment_text = models.CharField('内容', max_length=500)
    comment_user = models.CharField('用户', max_length=20)
    song = models.ForeignKey(Song, on_delete=models.CASCADE, verbose_name='歌名')
    # on_delete=models.CASCADE,删除关联数据,与之关联也删除
    on_delete = models.CASCADE
    comment_date = models.CharField('日期', max_length=50)

    class Meta:
        verbose_name = '歌曲评论'
        verbose_name_plural = '歌曲评论'

# class FileUpload(models.Model):
#     file = models.FileField(upload_to=settings.FILE_URL,verbose_name="文件选择")
#     name = models.CharField(max_length=200,blank=True,verbose_name="文件名称")
#
#     class Meta:
#         verbose_name = '文件'
#         verbose_name_plural = verbose_name
#
#     def __str__(self):
#         return self.name
