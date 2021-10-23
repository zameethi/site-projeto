from django.urls import path
from .views import mudar_perfil, registro, logar, sair

urlpatterns = [
    path('register/', registro, name='registro'),
    path('login/', logar, name='login'),
    path('logout/', sair, name='logout'),
    path('perfil/', mudar_perfil, name='perfil'),
]
