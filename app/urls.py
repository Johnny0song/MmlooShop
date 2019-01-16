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

    url(r'^mtpgoods/$',views.mtpgoods,name='mtpgoods')


]