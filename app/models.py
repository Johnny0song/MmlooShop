from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=300)
    phone = models.CharField(max_length=50,unique=True)
    token = models.CharField(max_length=300)
    class Meta:
        db_table = 'mml_user'

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
    price = models.CharField(max_length=50)
    productnumber = models.CharField(max_length=50)
    trackid = models.CharField(max_length=10)
    isselect =models.CharField(max_length=10,default=True)
    class Meta:
        db_table = 'mml_goods'


class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)
    cartnum = models.CharField(max_length=50)
    isselect = models.BooleanField(default=True)
    class Meta:
        db_table = 'mml_cart'

# 订单 模型类
# 一个用户 对应 多个订单
class Order(models.Model):
    # 用户
    user = models.ForeignKey(User)
    # 状态
    # -2 退款
    # -1 过期
    # 0 未付款
    # 1 已付款，未发货
    # 2 已付款，已发货
    # 3 已签收，未评价
    # 4 已评价
    status = models.IntegerField(default=0)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 订单号
    identifier = models.CharField(max_length=256)

    class Meta:
        db_table = 'mml_order'



# 订单商品 模型类
# 一个订单 对应 多个商品
class OrderGoods(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    goods = models.ForeignKey(Goods)
    # 商品规格
    number = models.IntegerField()

    class Meta:
        db_table = 'mml_ordergoods'