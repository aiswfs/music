# Generated by Django 2.0 on 2020-05-10 07:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_auto_20200504_1728'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='position',
            field=models.IntegerField(default=0, verbose_name='播放位置'),
        ),
    ]
