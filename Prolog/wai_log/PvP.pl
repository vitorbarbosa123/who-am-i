% Inicia um novo jogo entre dois jogadores humanos

novoJogoPlayerXPlayer:-
cls,
write('|================================================================|\n'),
write('|==========================| NOVO JOGO |=========================|\n'),
write('|================================================================|\n\n'),

write('Digite o nome do Jogador 1: '),
read(Username1),

write('Digite o nome do Jogador 2: '),
read(Username2),

(Username1 = Username2 -> write('ERRO: Nomes nao podem ser iguais. Pressione Enter para continuar...\n'),
read(_),
novoJogoPlayerXPlayer;

User1 = read_line_to_string(Username1)
userField(criaUsuarioSeNaoExistir(User1)),

User2 = read_line_to_string(Username2),
userField(criaUsuarioSeNaoExistir(Username2)),

jogoPxP(User1,User2)),

menuPrincipal.

% Inicia um jogo PxP

jogoPxP(Username1,Username2):-
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

partidaPxP(User1,User2,PersonaP1,PersonaP2,PossibilidadesUser1,PossibilidadesUser2),

menuPrincipal.

% Inicia uma rodada de jogo PxP
partidaPxP(NomeJogador,NomeOponente,PersonaJogador,PersonaOponente,PossibilidadesJogador,PossibilidadesOponente):-
(userGanhou(PossibilidadesOponente) -> vitoria(NomeOponente,NomeJogador,PersonaJogador);

cls,
write('|===================================================================================|\n'),
printTable(PossibilidadesJogador),
write('|===================================================================================|\n\n'),
read(Palpite),
pegarPalpiteUser(NomeJogador),
NewPossibilidades = verificarPalpite(Palpite,PersonaOponente,PossibilidadesJogador),
(length(PossibilidadesJogador) is length(NewPossibilidades) -> write('OPCAO INVALIDA! Pressione Enter para tentar novamente...'),
read(_),
partidaPxP(NomeJogador,NomeOponente,PersonaJogador,PersonaOponente,PossibilidadesJogador,PossibilidadesOponente);
partidaPxP(NomeOponente,NomeJogador,PersonaOponente,PersonaJogador,PossibilidadesOponente,NewPossibilidades))
).

% Informa e registra o vencedor do jogo PxP
vitoria(Vencedor, Vencido, PersonaVencido):-
somaPontosUsuario(Vencedor),
cls,
write('|=======================================================================================|\n'),
write('|======================================| VICTORY! |=====================================|\n'),
write('PARABENS '),
write(Vencedor),
write(' ! VOCE GANHOU!\n'),
write('O personagem de '),
write(Vencido),
write(' era: '),
P = prepareTableLine(PersonaVencido),
write(P),
write('.\n'),
write('Pressione Enter para voltar ao menu principal...\n'),
read(_),
write('\n').