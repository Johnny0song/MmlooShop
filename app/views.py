import hashlib
import random
import time

import os
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect


# Create your views here.
from MmlooShop import settings
from app.models import User, Carousel, Goods


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
        username = request.POST.get('username')
        password = request.POST.get('password')
        password = generate_password(password)
        # 验证有没有这个用户
        user = User()
        users = User.objects.filter(username=username).filter(password=password)

        if users.count():
            user = users.first()
            # 重新发token
            user.token = generate_token()
            print(user.token)
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
    return render(request, 'details.html',context={'goods':goods })

def cart(request):
    return render(request, 'cart.html')


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