module Main where

import System.Random
import Repo.Usuarios
import Repo.Personas

novoJogo :: IO ()
novoJogo = do
    print "Digite um nome de usuario(user1)"
    username <- getLine
    userField <- criaUsuarioSeNaoExistir username
    let user1 = parseUserToStringArray (userField!!0)

    print "Digite um nome de usuario(user2)"
    username <- getLine
    userField <- criaUsuarioSeNaoExistir username
    let user2 = parseUserToStringArray (userField!!0)

    jogo user1 user2

    main

escolhePersonagem :: [String] -> [[String]] -> IO String
escolhePersonagem user personas = do
    print ("Escolha um personagem " ++ user!!0 ++ ":")
    printTable personas

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
    print ("Qual caracteristica voce deseja escolher " ++ user!!0 ++ "?")
    print "sexo | cor_cabelo | etnia | cor_olhos | acessorio"
    caracteristica <- getLine

    if(caracteristica == "sexo") then do
        print "Qual o sexo?"
        getLine
    else if(caracteristica == "cor_cabelo") then do
        print "Qual a cor do cabelo?"
        getLine
    else if(caracteristica == "etnia") then do
        print "Qual a etnia?"
        getLine
    else if(caracteristica == "cor_olhos") then do
        print "Qual a cor dos olhos?"
        getLine
    else if(caracteristica == "acessorio") then do
        print "Qual o acessorio?"
        getLine
    else 
        pegarPalpiteUser user

vitoria :: [String] -> [String] -> [String] -> IO()
vitoria userGanhador oponente personaOponente = do
    somaPontosUsuario (userGanhador!!0) 1
    print ("parabens " ++ userGanhador!!0 ++ "! voce ganhou!")
    print ("O personagem de " ++ oponente!!0 ++ " era: " ++ (prepareTableLine personaOponente))

userGanhou :: [[String]] -> Bool
userGanhou listaPossibilidades = (length listaPossibilidades) <= 1

partida :: [String] -> [String] -> [String] -> [String] -> [[String]] -> [[String]] -> IO()
partida jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente = do
    if(userGanhou possibilidadesJogadorDaVez) then do
        vitoria jogadorDaVez oponente personaOponente
    else if(userGanhou possibilidadesOponente) then do
        vitoria oponente jogadorDaVez personaJogadorDaVez
    else do
        printTable possibilidadesJogadorDaVez
        palpite <- pegarPalpiteUser jogadorDaVez
        let newPossibilidades = verificarPalpite palpite personaOponente possibilidadesJogadorDaVez
        partida oponente jogadorDaVez personaOponente personaJogadorDaVez possibilidadesOponente newPossibilidades

verificarPalpite :: String -> [String] -> [[String]] -> [[String]]
verificarPalpite palpite persona possibilidades = do
    if(elem palpite persona) then
        [personagem | personagem <- possibilidades, elem palpite personagem]
    else
        [personagem | personagem <- possibilidades, not (elem palpite personagem)]

showPlacar :: IO ()
showPlacar = do
    usersFields <- listaUsuarios
    let users = map parseUserToStringArray usersFields
    print "---------------------------"
    print "   nome    |   pontuacao   "
    print "---------------------------"
    printTable users
    print "---------------------------"
    main

printTable :: [[String]] -> IO()
printTable table = mapM_ print (map prepareTableLine table)

prepareTableLine :: [String] -> String
prepareTableLine (head:[]) = head
prepareTableLine (head:users) = ("   " ++ head ++ "  |  " ++ (prepareTableLine users))

pegaEscolhaInicial :: IO String
pegaEscolhaInicial = do
    print "Bem vindo ao `Who Am I?`!"
    print "O que voce deseja fazer?"
    print "(1) Iniciar novo jogo"
    print "(2) Listar pontuacoes"
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
