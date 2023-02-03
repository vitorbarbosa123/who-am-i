
:- module(errorHandler, [error/1]).

/*
    Clausulas para tratar erros de entrada.
*/
error(0):- write("Opção inválida!"),!.

error(1):- write("Nomes nao podem ser iguais. Digite . para continuar...\n"),!.

error(2):- write("OPCAO INVALIDA! Pressione . para tentar novamente...\n'"),!.

error(3):- write("Opção inválida!"),!.

error(4):- write("ERRO: É necessário digitar um nome de usuário, aperte ENTER para continuar \n"),!.