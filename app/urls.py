from django.conf.urls import url

from app import views

urlpatterns = [

    url(r'^$',views.index,name='index'),
    url(r'^register/$',views.register,name='register'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^login/$',views.login,name='login'),
    url(r'^details/$',views.details,name='details'),
    url(r'^cart/$',views.cart,name='cart'),

    url(r'^upfile/$',views.upfile,name='upfile'),
    url(r'^savefile/$',views.savefile,name='savefile'),
]