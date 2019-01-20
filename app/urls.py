from django.conf.urls import url

from app import views

urlpatterns = [

    url(r'^$',views.index,name='index'),
    url(r'^register/$',views.register,name='register'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^login/$',views.login,name='login'),
    url(r'^details/(\d+)/$',views.details,name='details'),
    url(r'^cart/$',views.cart,name='cart'),

    url(r'^upfile/$',views.upfile,name='upfile'),
    url(r'^savefile/$',views.savefile,name='savefile'),



#     ajax请求
    url(r'^checkiphone/$',views.checkiphone,name='checkiphone'),

    url(r'^addgoods/$',views.addgoods,name='addgoods'),

    url(r'^mtpgoods/$',views.mtpgoods,name='mtpgoods'),




    url(r'^cartadd/$',views.cartadd,name='cartadd'),
    url(r'^cartmtp/$',views.cartmtp,name='cartmtp'),

    url(r'^amount/$',views.amount,name='amount'),

    url(r'^changecartstatus/$',views.changecartstatus,name='changecartstatus'),
    url(r'^changecartall/$',views.changecartall,name='changecartall'),


    url(r'^generateorder/$', views.generateorder, name='generateorder'),    # 下单
    url(r'^orderdetail/(.+)/$', views.orderdetail, name='orderdetail'),  # 订单详情


    url(r'^appnotify/$', views.appnotify, name='appnotify'),    # 支付完成后(服务器)
    url(r'^returnview/$', views.returnview, name='returnview'), # 买家支付完成后回到哪个页面(客户端)
    url(r'^pay/$', views.pay, name='pay'),  # 支付
]