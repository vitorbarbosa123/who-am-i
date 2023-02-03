:- module(helpers, [
    verificarPalpite/5
  ]).
/*
* 
    @param Palpite, palpite de caracteristica realizado pelo Jogador
    @param PersonaBot, personagem que o bot selecionou que deve ser acertado
    @param PalpitesCertos, lista inicialmente vazia que deve conter todos os 
    personagens que possuem a caracteristica chutada pelo Jogador
    @param Result, lista filtrada com as pessoas com a caracteristica ou não

    VerificaPalpite tem utilização em duplo sentido:
    1º Caso o usuário chute uma caracteristica que existe dentro do personagem
    escolhido pelo bot, a lista filtrada excluirá todos os personagens que NÃO
    TEM aquela caracteristica

    2º Caso o usuário chute uma caracteristica que não existe dentro do personagem
    escolhido pelo bot, a lista filtrada excluirá todos os personagens que POSSUEM
    aquela caracteristica
*/
verificarPalpite([], _, _, Aux, Result):- Result = Aux.

verificarPalpite([H|T], Palpite, PersonaBot, PalpitesCertos, Result):-
          member(Palpite, PersonaBot),
          (member(Palpite, H),
          append(PalpitesCertos, [H], Aux),
          verificarPalpite(T, Palpite, PersonaBot, Aux, Result),!;
          verificarPalpite(T, Palpite, PersonaBot, PalpitesCertos, Result)).
      
verificarPalpite([H|T], Palpite, PersonaBot, PalpitesCertos, Result):-
          member(Palpite, H),
          verificarPalpite(T, Palpite, PersonaBot, PalpitesCertos, Result),!;
          append(PalpitesCertos, [H], Aux),
          verificarPalpite(T, Palpite, PersonaBot, Aux, Result).