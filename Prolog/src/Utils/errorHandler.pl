/* <module> errorHandler
*  Módulo responsável por exibição de mensagens de erro na tratativa de erros da aplicação
*/
:- module(errorHandler, [error/1]).


/*
* Imprime a mensagem de erro respectiva com base no código de erro fornecido
  @param X, código de erro em output
*/
error(0):- write("Opção inválida!"),!.

error(1):- write("Nomes nao podem ser iguais. Digite . para continuar...\n"),!.

error(2):- write("OPCAO INVALIDA! Pressione . para tentar novamente...\n'"),!.

error(3):- write("Opção inválida!"),!.

error(4):- write("ERRO: É necessário digitar um nome de usuário, aperte ENTER para continuar \n"),!.