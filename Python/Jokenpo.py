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

while True:
  opcao = int(input("0-Sair, 1-Pedra, 2-Papel, 3-Tesoura: "))

  if opcao == 0:
    break

  maquina = random.choice(opcoes)
  player = opcoes[opcao - 1]

  jogo(player, maquina)
  print()