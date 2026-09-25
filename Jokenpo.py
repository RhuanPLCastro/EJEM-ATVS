import random


def jogo(player, maquina):
  print("Computador:", maquina)

  if player == maquina:
    print("Empate")
  elif player == "Pedra" and maquina == "Tesoura":
    print("Ganhou")
  elif player == "Papel" and maquina == "Pedra":
    print("Ganhou")
  elif player == "Tesoura" and maquina == "Papel":
    print("Ganhou")
  else:
    print("Perdeu")


opcoes = ["Pedra", "Papel", "Tesoura"]
maquina = random.choice(opcoes)

opcao = int(input("1-Pedra, 2-Papel, 3-Tesoura: "))
player = opcoes[opcao - 1]

jogo(player, maquina)