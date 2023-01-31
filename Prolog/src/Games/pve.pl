% Inicia um jogo de WaI
jogoPxB(NomeJogador,V):-
personasField(listPersonas),
personas = map(parsePersonaToStringArray,personasField),

get(EscolhaJogador),
IndiceJogador is (EscolhaJogador-1),
PersonaJogador = nth0(IndiceJogador,personas),

N is random_between(0,15,R),
PersonaBot = nth0(N,personas),

PossibilidadesUser = map(parsePersonaToStringArray,personasField),
PossibilidadesBot = map(parsePersonaToStringArray,personasField),

partidaPxB(NomeJogador,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot)

menuPrincipal.

% Inicia uma partida de WaI
partidaPxB(NomeJogador,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot,V):-
write('|===================================================================================|\n'),
printTable(PossibilidadesUser),
write('|===================================================================================|\n\n'),

read(PalpiteJogador),
newPossibilidadesJogador = verificarPalpite(PalpiteJogador,PersonaBot,PossibilidadesUser),

((length(PossibilidadesUser) is length(newPossibilidadesJogador)) -> write('OPCAO INVALIDA! Pressione Enter para tentar novamente...\n'),
read(_),
partidaPxB(NomeJogador,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot);

(userGanhou(newPossibilidadesJogador) = True -> vitoriaJogador(NomeJogador,PersonaBot);
PalpiteIA = pegarPalpiteIA(PossibilidadesBot),
newPossibilidadesBot = verificarPalpite(PalpiteIA,PersonaJogador,PossibilidadesBot),
write('|===================================================================================|\n'),
write('O Bot chutou a seguinte caracteristica: \n'),
write('.'),
sleep(0.1),
write('.'),
sleep(0.1),
write('.'),
sleep(0.1),
write(PalpiteIA),
sleep(0.3),
((userGanhou(newPossibilidadesBot) -> vitoriaBot(PersonaBot));
cls,
partidaPxB(NomeJogador,PersonaJogador,PersonaBot,newPossibilidadesJogador,newPossibilidadesBot)
))).


% Anuncia a vitória do jogador
vitoriaJogador(NomeJogador,PersonaBot):-
somaPontosUsuario(NomeJogador)
cls,
write('|=======================================================================================|\n'),
write('|======================================| VICTORY! |=====================================|\n'),
write('|=======================================================================================|\n\n'),
write('Você venceu!\n'),
write('O personagem do bot era: '),
write(PersonaBot),
write('\n'),
write('Pressione Enter para voltar ao menu principal...\n'),
read(_),
menuPrincipal.

% Anuncia a vitória do bot
vitoriaBot(PersonaBot):-
cls,
write('|=======================================================================================|\n'),
write('|======================================| DEFEAT ! |=====================================|\n'),
write('|=======================================================================================|\n\n'),
write('Você perdeu!\n'),
write('O personagem do bot era: '),
write(PersonaBot),
write('\n'),
write('Pressione Enter para voltar ao menu principal...\n'),
read(_),
menuPrincipal.

% Limpa o terminal
cls :- write('\33\[2J').