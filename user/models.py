# -*- coding: utf-8 -*-
# user的models模块
from django.db import models
from django.contrib.auth.models import AbstractUser


class MyUser(AbstractUser):
    qq = models.CharField('QQ号码', max_length=20)
    weChat = models.CharField('微信账号', max_length=20)
    mobile = models.CharField('手机账号', max_length=11)
    integral = models.IntegerField('积分', default=0)
    playlist = models.TextField('歌曲列表', default='')
    level = models.CharField('用户类型', max_length=20, default='普通用户')
    position = models.IntegerField('播放位置', default=0)

    # 设置返回值
    def __str__(self):
        return self.username

# 这里与之前数据库的建立连接是一个意思，此时需要将之前库内所有表删除(建议先导出数据保存)，在将这个执行
# python manage.py makemigrations和python manage.py migrate 两个指令操作
