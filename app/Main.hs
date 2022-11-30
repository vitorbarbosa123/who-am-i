module Main where

import System.Random
import Repo.Usuarios
import Repo.Personas

cls :: IO()
cls = putStr "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

novoJogo :: IO ()
novoJogo = do
    cls
    putStr "|================================================================|\n"
    putStr "|==========================| NOVO JOGO |=========================|\n"
    putStr "|================================================================|\n\n"

    print "Digite o nome do jogador 1"
    username1 <- getLine

    print "Digite o nome do jogador 2"
    username2 <- getLine

    if(username1 == username2) then do
        putStr "ERRO: Nomes nao podem ser iguais. Pressione Enter para continuar...\n"
        getLine
        novoJogo
    else do
        userField <- criaUsuarioSeNaoExistir username1
        let user1 = parseUserToStringArray (userField!!0)

        userField <- criaUsuarioSeNaoExistir username2
        let user2 = parseUserToStringArray (userField!!0)

        jogo user1 user2

        main
    

escolhePersonagem :: [String] -> [[String]] -> IO String
escolhePersonagem user personas = do
    cls
    putStr "|===================================================================================|\n"
    putStr "|=============================| ESCOLHA SEU PERSONAGEM |============================|\n"
    putStr "|===================================================================================|\n"
    printTable personas
    putStr "\n"
    putStr ("Escolha um personagem, " ++ user!!0 ++ ":\n")

    getLine

jogo :: [String] -> [String] -> IO()
jogo user1 user2 = do
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

    partida user1 user2 personaUser personaUser2 possibilidadesUser possibilidadesUser2

    main

pegarPalpiteUser :: [String] -> IO String
pegarPalpiteUser user = do
    putStr ("Qual caracteristica voce deseja escolher " ++ user!!0 ++ "?\n")
    putStr "[0] sexo | [1] cor do cabelo | [2] etnia | [3] cor dos olhos | [4] acessorio\n"
    caracteristica <- getLine

    if(caracteristica == "0") then do
        putStr "Qual o sexo?\n"
        getLine
    else if(caracteristica == "1") then do
        putStr "Qual a cor do cabelo?\n"
        getLine
    else if(caracteristica == "2") then do
        putStr "Qual a etnia?\n"
        getLine
    else if(caracteristica == "3") then do
        putStr "Qual a cor dos olhos?\n"
        getLine
    else if(caracteristica == "4") then do
        putStr "Qual o acessorio?\n"
        getLine
    else do
        putStr "OPCAO INVALIDA!\n"
        pegarPalpiteUser user

vitoria :: [String] -> [String] -> [String] -> IO()
vitoria userGanhador oponente personaOponente = do
    somaPontosUsuario (userGanhador!!0) 1

    cls
    putStr "|=======================================================================================|\n"
    putStr "|======================================| VICTORY! |=====================================|\n"
    putStr "|=======================================================================================|\n\n"
    putStr ("PARABENS " ++ userGanhador!!0 ++ "! VOCE GANHOU!\n")
    putStr ("O personagem de " ++ oponente!!0 ++ " era: " ++ (prepareTableLine personaOponente) ++ "\n")
    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine
    putStr ""

userGanhou :: [[String]] -> Bool
userGanhou listaPossibilidades = (length listaPossibilidades) <= 1

partida :: [String] -> [String] -> [String] -> [String] -> [[String]] -> [[String]] -> IO()
partida jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente = do
    if(userGanhou possibilidadesOponente) then do
        vitoria oponente jogadorDaVez personaJogadorDaVez
    else do
        cls
        putStr "|===================================================================================|\n"
        printTable possibilidadesJogadorDaVez
        putStr "|===================================================================================|\n\n"

        palpite <- pegarPalpiteUser jogadorDaVez
        let newPossibilidades = verificarPalpite palpite personaOponente possibilidadesJogadorDaVez
        if((length newPossibilidades) == (length possibilidadesJogadorDaVez)) then do
            putStr "OPCAO INVALIDA! Pressione Enter para tentar novamente...\n"
            getLine
            partida jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente
        else
            partida oponente jogadorDaVez personaOponente personaJogadorDaVez possibilidadesOponente newPossibilidades

verificarPalpite :: String -> [String] -> [[String]] -> [[String]]
verificarPalpite palpite persona possibilidades = do
    if(elem palpite persona) then
        [personagem | personagem <- possibilidades, elem palpite personagem]
    else
        [personagem | personagem <- possibilidades, not (elem palpite personagem)]

showPlacar :: IO ()
showPlacar = do
    cls
    usersFields <- listaUsuarios
    let users = map parseUserToStringArray usersFields
    putStr "|==================================|\n"
    putStr "     nome       |    pontuacao      \n"
    putStr "|==================================|\n"
    printTable users
    putStr "|==================================|\n\n"

    putStr "Pressione Enter para voltar ao menu principal..."
    getLine

    main

printTable :: [[String]] -> IO()
printTable table = mapM_ putStr (map prepareTableLine table)

prepareTableLine :: [String] -> String
prepareTableLine (head:[]) = head ++ "\n"
prepareTableLine (head:users) = ("   " ++ head ++ "  |  " ++ (prepareTableLine users))

pegaEscolhaInicial :: IO String
pegaEscolhaInicial = do
    cls
    putStr "=========================\n"
    putStr "Bem vindo ao `Who Am I?`!\n"
    putStr "=========================\n"
    putStr "O que voce deseja fazer?\n"
    putStr "(1) Iniciar novo jogo\n"
    putStr "(2) Listar pontuacoes\n"
    getLine

main :: IO ()
main = do
    escolha <- pegaEscolhaInicial
    if(escolha == "1") then
        novoJogo
    else if(escolha == "2") then
        showPlacar
    else
        main
