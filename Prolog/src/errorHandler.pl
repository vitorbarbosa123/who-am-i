
:- module(errorHandler, [error/1]).

error(0):- write("Opção inválida!"),!.

error(1):- write("Nomes nao podem ser iguais. Digite . para continuar...\n"),!.

error(2):- write("Opção inválida!"),!.

error(3):- write("Opção inválida!"),!.