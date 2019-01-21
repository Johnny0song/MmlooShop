import hashlib
import random
import time

import os
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from MmlooShop import settings
from app.alipay import alipay
from app.models import User, Carousel, Goods, Cart, Order, OrderGoods


def index(request):
    token = request.session.get('token')
    users = User.objects.filter(token=token)

    if users.count():
        user = users.first()
    else:
        user = None

    carouselmaps = Carousel.objects.all()

    # 商品详情
    goods_lists = Goods.objects.all()


    data ={
        'user': user,
         "carouselmaps": carouselmaps,
        'goods_lists':goods_lists
    }
    return render(request,'index.html',data)

def generate_token():
    token = str(time.time()) + str(random.random())
    md5=hashlib.md5()
    md5.update(token.encode('utf-8'))
    return md5.hexdigest()

def generate_password(password):
    sha1 = hashlib.sha1()
    sha1.update(str(password).encode('utf-8'))
    return sha1.hexdigest()



def register(request):
    if request.method =='GET':
        return render(request, 'register.html')
    elif request.method =='POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        phone = request.POST.get('phone')
        user = User()
        user.username = username
        user.password = generate_password(password)
        user.phone = phone

        user.token = generate_token()
        request.session['token'] =user.token

        user.save()
        response = redirect('mml:index')
        return response



def logout(request):
    response = redirect('mml:index')

    response.delete_cookie('sessionid')
    del request.session['token']


    return response

def login(request):
    if request.method =='GET':
        return render(request, 'login.html')
    elif request.method =='POST':
        # username = request.POST.get('username')
        phone = request.POST.get('phone')
        password = request.POST.get('password')
        password = generate_password(password)

        # 验证有没有这个用户
        user = User()
        users = User.objects.filter(phone=phone).filter(password=password)

        if users.count():
            user = users.first()
            # 重新发token
            user.token = generate_token()
            # print(user.token)
            request.session['token'] = user.token
            user.save()
            response = redirect('mml:index')
            return response
        else:

            user = None
            return redirect('mml:login')

    return render(request, 'login.html')


def details(request,goods_id):
    goods = Goods.objects.get(pk=goods_id)
    # 获取用户的购物车信息
    token = request.session.get('token')

    print(token)

    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user = user).filter(goods=goods)
        cart = carts.first()

        data ={
            'goods': goods,
            "cart": cart,
            'user': user,
        }

        return render(request, 'details.html',data)
    else:
        return render(request, 'details.html', context={'goods': goods,})


def cart(request):
    token = request.session.get('token')
    print(token)
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user)
        sum =0
        for cart in carts:
            # if cart.goods.isselect == 'true':
            if cart.isselect:
                sum += int(int(cart.goods.price)*int(cart.cartnum))
                return render(request, 'cart.html',context={'carts':carts,'sum':sum})
    else:
        return redirect('mml:login')






def upfile(request):

    return render(request,'upfile.html')



def savefile(request):
    if request.method =='POST':
        file = request.FILES['file']
        filepath = os.path.join(settings.MDEIA_ROOT,file.name)
        print(filepath)
        with open(filepath,'wb') as fp:
            for info in file.chunks():
                fp.write(info)
        return HttpResponse('文件上传成功')
    else:
        return HttpResponse('文件上传失败')


def checkiphone(request):
    phone = request.GET.get('phone')
    users = User.objects.filter(phone=phone)
    if users.exists():
        return JsonResponse({'msg':"手机号已经被占用!",'status':0})
    else:
        return JsonResponse({'msg':'手机号可以使用','status':1})

#
# email = request.GET.get('email')
#
#     users = User.objects.filter(email=email)
#     if users.exists():  # 占用
#         return JsonResponse({'msg': '账号被占用！', 'status':0})
#     else:   # 可用
#         return JsonResponse({'msg': '账号可以使用!', 'status':1})


def addgoods(request):
    # 根据cookie判断用户是否登录
    token = request.session.get('token')
    # print(request.GET.get('goodsid'))
    #返回客户端一个购物车
    if token :
        user = User.objects.get(token=token)
        goodsid = request.GET.get('goodsid')
        goods = Goods.objects.get(pk=goodsid)

        print(goodsid)
        # 第一次添加：添加一条记录
        # 后续操作：只需要修改数量
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists(): #存在就改变数量
            cart = carts.first()
            cart.cartnum = str(int(cart.cartnum) + 1)
            cart.save()

        else:   #添加一条记录
            cart = Cart()
            cart.user=user
            cart.goods=goods
            cart.cartnum=1
            cart.save()

        # cart = Cart.objects.get(user)
        return JsonResponse({'msg': '{}-添加成功'.format(goods.name),'status':1,'cartnum':cart.cartnum})
    else :
        return JsonResponse({'msg': '请登录','status':0})


def mtpgoods(request):
    # 根据cookie判断用户是否登录
    token = request.session.get('token')

    print(request.GET.get('goodsid'))
    # 返回客户端一个购物车
    if token:
        user = User.objects.get(token=token)
        goodsid = request.GET.get('goodsid')
        goods = Goods.objects.get(pk=goodsid)
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():  # 存在就改变数量
            cart = carts.first()
            if int(cart.cartnum)>1:
                cart.cartnum = str(int(cart.cartnum) - 1)
                cart.save()
                return JsonResponse({'msg': '{}-删除成功'.format(goods.name), 'status': 1, 'cartnum': cart.cartnum})

    else:
        return JsonResponse({'msg': '请登录', 'status': 0})



# 添加购物车
# def addcart(request):
#     # 根据cookie判断用户是否登录
#     token = request.session.get('token')
#     user =User.objects.get(token=token)
#
#     return render(request,'addcart.html')



#
#
def cartadd(request):
    index = request.GET.get('index')

    return JsonResponse({'msg': index, 'status': 0})


def cartmtp(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    goodsid = request.GET.get('goodsid')
    goods = Goods.objects.get(pk=goodsid)
    carts = Cart.objects.filter(user=user).filter(goods=goods)
    if carts.exists():  # 存在就改变数量
        cart = carts.first()
        if int(cart.cartnum) > 1:
            cart.cartnum = str(int(cart.cartnum) - 1)
            cart.save()
            return JsonResponse({'msg': '{}-删除成功'.format(goods.name), 'status': 1, 'cartnum': cart.cartnum})


    # return JsonResponse({'msg': goodsid, 'status': 0})



def cartdel(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    goodsid = request.GET.get('goodsid')
    goods = Goods.objects.get(pk=goodsid)
    carts = Cart.objects.filter(user=user).filter(goods=goods)
    if carts.exists():  # 存在就改变数量
        cart = carts.first()
        cart.cartnum = 0
        cart.save()
        return JsonResponse({'msg': '{}-数量为0'.format(goods.name), 'status': 1, 'cartnum': cart.cartnum})



def amount(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    # carts = Cart.objects.filter(user=user)
    goodsid = request.GET.get('goodsid')
    goods = Goods.objects.get(pk=goodsid)

    goodsSelect = request.GET.get('goodsSelect')



    goods.isselect = goodsSelect

    goods.save()
    # print(goods.isselect,goodsid)

    carts = Cart.objects.filter(user=user)
    sum = 0
    if carts.count()>0:
        for cart in carts:
            print(cart.goods.isselect,cart.goods.id,type(cart.goods.isselect))
            if cart.goods.isselect=='true':
                sum += int(int(cart.goods.price)*int(cart.cartnum))
        # print(sum)
    return JsonResponse({'msg': '{}-删除成功'.format(goods.name), 'status': 1,'isselect':goods.isselect,'sum':sum})


def changecartstatus(request):
    cartid = request.GET.get('cartid')

    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()

    data = {
        'msg': '状态修改成功',
        'status': 1,
        'isselect': cart.isselect
    }

    return JsonResponse(data)

def changecartall(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    # True/False
    isall = request.GET.get('isall')
    if isall == 'true':
        isall = True
    else:
        isall = False

    carts = Cart.objects.filter(user=user).update(isselect=isall)

    data = {
        'msg': '状态修改成功',
        'status': 1,
    }

    return JsonResponse(data)


def generate_identifire():
    tempstr = str(int(time.time())) + str(random.random())
    return tempstr

def generateorder(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    # 订单
    order = Order()
    order.user = user
    order.identifier = generate_identifire()
    order.save()

    # 订单商品
    carts = Cart.objects.filter(user=user).filter(isselect=True).exclude(cartnum=0)
    # 只有选中的商品，才是添加到订单中，从购物车中删除
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.cartnum
        orderGoods.save()

        # 从购物车中删除
        cart.delete()

    data = {
        'msg': '下单成功',
        'status': 1,
        'identifier': order.identifier
    }

    return JsonResponse(data)



def orderdetail(request, identifier):
    order = Order.objects.get(identifier=identifier)
    ordergoods_lists = order.ordergoods_set.all()
    for ordergoods in ordergoods_lists:
        print(ordergoods.goods.name)
    return render(request, 'orderdetail.html', context={'order': order})



def orderlist(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    orders = Order.objects.filter(user=user)

    for order in orders:
        print(order.identifier)
    return render(request,'orderlist.html',context={'orders':orders})


@csrf_exempt
def appnotify(request):
    # 获取订单号，并且修改订单状态
    if request.method == 'POST':
        from urllib.parse import parse_qs
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)
        post_dir = {}

        print(body_str)
        print(post_data)
        print(post_data.items())
        for key, value in post_data.items():
            post_dir[key] = value[0]

        out_trade_no = post_dir['out_trade_no']
        print(out_trade_no)

        # 更新状态
        Order.objects.filter(identifier=out_trade_no).update(status=1)

        return JsonResponse({'msg': 'success'})

def returnview(request):
    return redirect('mml:orderlist')


def pay(request):
    identifier = request.GET.get('identifier')
    order = Order.objects.get(identifier=identifier)

    sum = 0
    for orderGoods in order.ordergoods_set.all():
        sum += int(orderGoods.goods.price) * int(orderGoods.number)

    # 支付地址
    url = alipay.direct_pay(
        subject='iPhone - 2019款',  # 支付宝页面显示的标题
        out_trade_no=identifier,  # 米米乐订单编号
        total_amount=str(sum),  # 订单金额
        return_url='http://47.107.91.215/returnview/'
    )

    # 拼接上支付网关
    alipayurl = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)

    return JsonResponse({'alipayurl': alipayurl, 'status': 1})


