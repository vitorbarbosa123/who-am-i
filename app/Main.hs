module Main where

import Repo.Usuarios
import Repo.Personas
import Repo.Logic
import Repo.PlayerxBot
import Repo.PlayerxPlayer


main :: IO ()
main = do
    escolha <- pegaEscolhaInicial
    if escolha == "1" then
        menunovoJogoGeral
    else if escolha == "2" then
        showPlacar
    else if escolha == "3" then
        menuComoJogar
    else do
        putStr ("Opcao inválida!\n")
        main


pegaEscolhaInicial :: IO String
pegaEscolhaInicial = do
    cls
    putStr "\n=========================\n"
    putStr "Bem vindo ao `Who Am I?`!\n"
    putStr "=========================\n"
    putStr "O que voce deseja fazer?\n"
    putStr "(1) Iniciar novo jogo\n"
    putStr "(2) Listar pontuacoes\n"
    putStr "(3) Como Jogar\n"
    getLine


menunovoJogoGeral :: IO()
menunovoJogoGeral = do
    putStr "\n=========================\n"
    putStr "[1] Player VS BOT \n"
    putStr "[2] Player VS Player \n"
    putStr "[3] Retornar ao menu principal\n"
    putStr "Selecione uma opcao: \n"
    escolhaJG <- getLine
    
    if escolhaJG == "1" then
        novoJogoPlayerXBot
        else if escolhaJG == "2" then
            novoJogoPlayerXPlayer
        else if escolhaJG == "3" then
            pegaEscolhaInicial
        else do
            putStr ("Opcao inválida!\n")
            menunovoJogoGeral


--Imprime o placar de pontuacao, dos usuarios do banco
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

    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine

    main


-- Imprime apenas orientacoes da regra geral de negocio. -- ToDo: Ajustar as regras de acordo com o projeto atual!
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
        pegaEscolhaInicial
        else do
            putStr ("Opcao invalida! \n")
            menuComoJogar --para que o programa não termine, e retorne ao mesmo menu.


--Função para limpar o terminal.
cls :: IO()
cls = putStr "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\"