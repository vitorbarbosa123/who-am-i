module Repo.PlayerxPlayer where

import System.Random
import Repo.Logic
import Repo.Usuarios
import Repo.Personas
import Main


novoJogoPlayerXPlayer :: IO ()
novoJogoPlayerXPlayer = do
    cls
    putStr "|================================================================|\n"
    putStr "|==========================| NOVO JOGO |=========================|\n"
    putStr "|================================================================|\n\n"

    print "Digite o nome do jogador 1"
    username1 <- getLine

    print "Digite o nome do jogador 2"
    username2 <- getLine

    if username1 == username2 then do
        putStr "ERRO: Nomes nao podem ser iguais. Pressione Enter para continuar...\n"
        getLine
        novoJogoPlayerXPlayer
    else do
        userField <- criaUsuarioSeNaoExistir username1
        let user1 = parseUserToStringArray (head userField)

        userField <- criaUsuarioSeNaoExistir username2
        let user2 = parseUserToStringArray (head userField)

        jogoPxP user1 user2

        main


jogoPxP :: [String] -> [String] -> IO()
jogoPxP user1 user2 = do
    personasField <- listPersonas
    let personas = map parsePersonaToStringArray personasField

    escolha <- escolhePersonagem user1 personas
    let index = (read escolha :: Int) -1
    let personaUser = personas!!index

    escolha <- escolhePersonagem user2 personas
    let index = (read escolha :: Int) -1
    let personaUser2 = personas!!index

    let possibilidadesUser = map parsePersonaToStringArray personasField
    let possibilidadesUser2 = map parsePersonaToStringArray personasField

    partidaPxP user1 user2 personaUser personaUser2 possibilidadesUser possibilidadesUser2

    main


partidaPxP :: [String] -> [String] -> [String] -> [String] -> [[String]] -> [[String]] -> IO()
partidaPxP jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente = do
    if userGanhou possibilidadesOponente then do
        vitoria oponente jogadorDaVez personaJogadorDaVez
    else do
        cls
        putStr "|===================================================================================|\n"
        printTable possibilidadesJogadorDaVez
        putStr "|===================================================================================|\n\n"

        palpite <- pegarPalpiteUser jogadorDaVez
        let newPossibilidades = verificarPalpite palpite personaOponente possibilidadesJogadorDaVez
        if length newPossibilidades == length possibilidadesJogadorDaVez then do
            putStr "OPCAO INVALIDA! Pressione Enter para tentar novamente...\n"
            getLine
            partida jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente
        else
            partida oponente jogadorDaVez personaOponente personaJogadorDaVez possibilidadesOponente newPossibilidades


vitoria :: [String] -> [String] -> [String] -> IO()
vitoria userGanhador oponente personaOponente = do
    somaPontosUsuario (head userGanhador) 1

    cls
    putStr "|=======================================================================================|\n"
    putStr "|======================================| VICTORY! |=====================================|\n"
    putStr "|=======================================================================================|\n\n"
    putStr ("PARABENS " ++ head userGanhador ++ "! VOCE GANHOU!\n")
    putStr ("O personagem de " ++ head oponente ++ " era: " ++ prepareTableLine personaOponente ++ "\n")
    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine
    putStr ""