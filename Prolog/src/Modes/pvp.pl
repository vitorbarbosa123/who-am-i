:- module(pvp, [
  novoJogoPlayerXPlayer/0,
  jogoPxP/2,
  partidaPxP/6,
  vitoria/3
]).

:- use_module('./../Interfaces/menus.pl').
:- use_module('./../Interfaces/headers.pl').

:- use_module('./../Utils/utils.pl').
:- use_module('./../Utils/errorHandler.pl').

:- use_module('./../Data/repository.pl').

% Inicia um novo jogo entre dois jogadores humanos

novoJogoPlayerXPlayer:-
  connect_repo,
  headers:newGameHeader,
  write('Digite o nome do Jogador 1: '),
  read(Username1),

  write('Digite o nome do Jogador 2: '),
  read(Username2),

/*
  TODO: criar validação de comparação das duas variáveis
  Username1 =:= Username2 -> errorHandler:error(1),
  read(_),
  novoJogoPlayerXPlayer;
  
  obs: o tratamento de erro já funciona
*/
  findOrCreateUser(Username1, User1),
  findOrCreateUser(Username2, User2),

  jogoPxP(User1,User2).

jogoPxP(User1,User2):-
  listPersonas(personasField),
  Personas = map(parsePersonaToStringArray,personasField),

  get(EscolhaP1),
  IndiceP1 is (EscolhaP1-1),
  PersonaP1 = nth0(IndiceP1,Personas),

  get(EscolhaP2),
  IndiceP2 is (EscolhaP2-1),
  PersonaP2 = nth0(IndiceP2,Personas),

  PossibilidadesUser1 = map(parsePersonaToStringArray,personasField),
  PossibilidadesUser2 = map(parsePersonaToStringArray,personasField),

  partidaPxP(User1,User2,PersonaP1,PersonaP2,PossibilidadesUser1,PossibilidadesUser2).



% Inicia uma rodada de jogo PxP
partidaPxP(NomeJogador,NomeOponente,PersonaJogador,PersonaOponente,PossibilidadesJogador,PossibilidadesOponente):-
  (userGanhou(PossibilidadesOponente), vitoria(NomeOponente,NomeJogador,PersonaJogador);

  utils:cls,
  headers:line,
  printTable(PossibilidadesJogador),
  headers:line,
  read(Palpite),
  pegarPalpiteUser(NomeJogador),
  NewPossibilidades = verificarPalpite(Palpite,PersonaOponente,PossibilidadesJogador),
  (length(PossibilidadesJogador) is length(NewPossibilidades), errorHandler:error(1),
  read(_),
  partidaPxP(NomeJogador,NomeOponente,PersonaJogador,PersonaOponente,PossibilidadesJogador,PossibilidadesOponente);
  partidaPxP(NomeOponente,NomeJogador,PersonaOponente,PersonaJogador,PossibilidadesOponente,NewPossibilidades))
  ).

% Informa e registra o vencedor do jogo PxP
vitoria(Vencedor, Vencido, PersonaVencido):-
  incrementUserScore(Vencedor),
  utils:cls,
  menus:victoryGameHeader,
  write('PARABENS '),
  write(Vencedor),
  write(' ! VOCE GANHOU!\n'),
  write('O personagem de '),
  write(Vencido),
  write(' era: '),
  P = prepareTableLine(PersonaVencido),
  write(P),
  write('.\n'),
  write('Pressione . para voltar ao menu principal...\n'),
  read(_),
  write('\n').