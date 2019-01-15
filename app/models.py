from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=300)
    phone = models.CharField(max_length=50,unique=True)
    token = models.CharField(max_length=300)


    def __str__(self):
        return self.username

class Carousel(models.Model):
    name = models.CharField(max_length=50)
    imgs = models.CharField(max_length=300)
    trackid = models.CharField(max_length=10)
    class Meta:
        db_table = 'mml_carousel'

# Carousel map

# class Base(models.Model):
#     img = models.CharField(max_length=100)
#     name = models.CharField(max_length=100)
#     trackid = models.CharField(max_length=10)
#
#     class Meta:
#         abstract = True
#
# # 轮播图 模型类
# class Wheel(Base):
#     class Meta:
#

class Goods(models.Model):
    name = models.CharField(max_length=50)
    imgs = models.CharField(max_length=300)
    trackid = models.CharField(max_length=10)
    class Meta:
        db_table = 'mml_goods'
