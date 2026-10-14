from django.urls import path
from . import views

urlpatterns = [
    path('', views.home),
    path('alunos/', views.lista_alunos),
    path('alunos/<str:nome>/', views.detalhe_aluno),
]