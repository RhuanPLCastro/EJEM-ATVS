from django.shortcuts import render
from django.http import Http404
from django.http import HttpResponse

ALUNOS = [
    {"nome": "Vildania", "curso": "Moda", "descricao": "Adora roupas com cores basicas."},
    {"nome": "Guilherme", "curso": "Engenharia da Computação", "descricao": "Aprendendo C."},
    {"nome": "Maria", "curso": "Arquitetura e Urbanismo", "descricao": "Gosta de projetos circulares."},
]

def home(request):
    return render(request, 'alunos/home.html')

def lista_alunos(request):
    return render(request, 'alunos/lista.html', {'alunos': ALUNOS})

def detalhe_aluno(request, nome):
    for aluno in ALUNOS:
        if aluno['nome'] == nome:
            return render(request, 'alunos/detalhe.html', {'aluno': aluno})
    raise Http404("Aluno não encontrado")