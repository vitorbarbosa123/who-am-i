module Main where

import System.Random
import Repo.Usuarios
import Repo.Personas

novoJogo :: IO ()
novoJogo = do
    print "Digite um nome de usuario"
    username <- getLine
    userField <- criaUsuarioSeNaoExistir username
    let user = parseUserToStringArray (userField!!0)

    jogo user

    main

jogo :: [String] -> IO()
jogo user = do
    personasField <- listPersonas
    let personas = map parsePersonaToStringArray personasField

    print "Escolha um personagem: "
    printTable personas

    escolha <- getLine
    let index = (read escolha :: Int) -1
    let personaUsuario = personas!!index

    indexIA <- randomIO :: IO Int
    let index = indexIA `mod` (length personas)
    let personaIA = personas!!index

    let possibilidadesUser = map parsePersonaToStringArray personasField
    let possibilidadesIA = map parsePersonaToStringArray personasField

    partida user personaUsuario personaIA possibilidadesUser possibilidadesIA "user"

    main

partida :: [String] -> [String] -> [String] -> [[String]] -> [[String]] -> String -> IO()
partida user personaUsuario personaIA possibilidadesUser possibilidadesIA jogadorDaVez = do
    if((length possibilidadesUser) == 1) then do
        somaPontosUsuario (user!!0) 1
        print "parabens! voce ganhou!"
    else if((length possibilidadesIA) == 1) then
        print "sinto muito... voce perdeu."
    else
        if(jogadorDaVez == "user") then
            printTable possibilidadesUser
            palpite <- pegarPalpiteUser
            newPossibilidades <- verificarPalpite palpite personaIA possibilidadesUser
            partida user personaUsuario personaIA newPossibilidades possibilidadesIA "ia"
        else
            palpite <- pegarPalpiteIA
            newPossibilidades <- verificarPalpite palpite personaUsuario possibilidadesIA
            partida user personaUsuario personaIA possibilidadesUser newPossibilidades "user"

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
