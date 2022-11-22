--interface principal do "Who am i?"

import System.Exit -- existente na documentacao de haskell, utilizada no menu 4 para encerrar o programa.

-- Menu principal que irá interagir com o usuário
-- O mesmo precisa selecionar opções entre 1 a 4, sendo a opção 1 de iniciar um novo jogo.
-- status em 18/11/2022: funcional, nenhuma alteração necessaria.
menuPrincipal :: IO()
menuPrincipal = do
    putStr ("\n==============================================\n")
    putStr ("Bem vindo ao 'Who am i?'!\n\n")
    putStr ("[1] Novo jogo\n")
    putStr ("[2] Como Jogar\n")
    putStr ("[3] Ranking\n")
    putStr ("[4] Sair\n\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaMP <- getLine

    if opcaoEscolhidaMP == "1" then do 
        menuNovoJogo
        else if 
            opcaoEscolhidaMP == "2" then 
                menuComoJogar
        else if 
            opcaoEscolhidaMP == "3" then 
                menuRanking
        else if 
            opcaoEscolhidaMP == "4" then 
                sairPrograma
        else do 
            putStr ("Opção invalida\n")
            menuPrincipal --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 1, novo jogo
-- Função mais importante, irá popular o savefile de usuários já cadastrados e
-- irá iniciar novo jogo, nas regras de negócio
-- status em 18/11/2022: implementar com a chamada da função novoJogo, do main.hs.
menuNovoJogo :: IO()
menuNovoJogo = do
    putStr ("\n==============================================\n")
    putStr ("[1] Comecar novo jogo\n")
    putStr ("[2] Voltar ao menu principal\n\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaNJ <- getLine

    if opcaoEscolhidaNJ == "1" then do
        putStr("Insira seu nome de usuário: ")
        nome <- getLine -- verificar se, já existe o usuário. Se existir, a pontuacao da partida será somada, do contrário, novo usuário precisa ser criado
        putStr("novoJogo") -- chamada a funcao do main.hs, iniciando novo jogo e suas respectivas partidas
        else if opcaoEscolhidaNJ == "2" then
            menuPrincipal
        else do
            putStr ("Opção Invalida \n")
            menuNovoJogo --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 2, como jogar
-- Imprime apenas orientações da regra geral de negócio.
-- status em 18/11/2022: funcional, nenhuma alteração necessaria.
menuComoJogar :: IO()
menuComoJogar = do
    putStr ("\n==============================================\n")
    putStr ("Who am i? eh um jogo de turnos, você escolhe um personagem e o Bot ira receber outro personagem aleatoriamente. Onde a lista de personagens eh a mesma para ambos.\n\n")
    putStr ("O objetivo do jogo eh adivinhar o personagem do adversario, a cada rodada voce pode:\n")
    putStr (". Eliminar uma caracteristica\n")
    putStr (". Tentar chutar o personagem do Bot.\n\n")
    putStr ("Para vencer, eh necessario adivinhar o personagem primeiro do que o Bot.\n\n")
    putStr ("Informacoes importantes:\n")
    putStr ("Voce e o bot podem escolher o mesmo personagem.\n")
    putStr ("Se voce escolher chutar e errar, voce perde a rodada.\n\n")


    putStr ("[1] Retornar ao menu principal\n")
    putStr("Digite uma opcao: ")
    opcaoEscolhidaCJ <- getLine

    if opcaoEscolhidaCJ == "1" then do
        menuPrincipal
        else do
            putStr ("Opcao invalida! \n")
            menuComoJogar --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 3, ranking de jogadores
-- imprime o save file ordenado, dos usuários cadastrados. -> USUARIO, Vitorias: X
-- status em 18/11/2022: falta implementar a função que armazena permanentemente os usuarios
menuRanking :: IO()
menuRanking = do
    putStr ("\n==============================================\n")
    putStr ("Imprime aqui ranking dos top 10 jogadores cadastrados.\n\n") --Falta implementar
    
    putStr ("[1] Retornar ao menu Principal\n")
    putStr("Digite uma opcao: ")
    opcaoEscolhidaMR <- getLine

    if opcaoEscolhidaMR == "1" then do 
        menuPrincipal
        else do
            putStr ("Opção invalida \n")
            menuRanking --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 4 Sair do programa
-- encerra a execucao do programa na opção 1, retorna ao menu principal na posicao 2
-- status em 18/11/2022: funcional, nenhuma alteração necessaria.
sairPrograma :: IO()
sairPrograma = do
    putStr ("\n==============================================\n")
    putStr ("Tem certeza que deseja sair?\n")
    putStr ("[1] Sim\n")
    putStr ("[2] Não\n\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaSP <- getLine

    if opcaoEscolhidaSP == "1" then do 
        exitWith(ExitSuccess) -- encerra o programa
        else if opcaoEscolhidaSP == "2" then
            menuPrincipal
        else do
            putStr ("Opção invalida \n")
            sairPrograma --para que o programa não termine, e retorne ao mesmo menu.