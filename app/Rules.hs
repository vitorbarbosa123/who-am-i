module Rules where

import System.Random -- ToDO = verificar o motivo de random, não ser compilado
import Personas
--import Menu


-- Inicia um novo jogo
novoJogo:: String -> IO()
novoJogo x = do
    let nome = x -- ainda nao utilizado
    jogo 1



-- Início de um jogo e seu "laço" de execução
jogo:: Int -> IO() --Sempre vai receber 1 como argumento inicial
jogo rodada = 
    let pIa = 0
    let pJogador = 0
    if rodada <= 5 || pIa < 3 || pJogador < 3
        then do 
            partida "inciar"
            jogo (rodada+1)
        else if pJogador > pIa
            then do
                putStrLn("Você venceu, parabéns!")
                --incrementer no banco a vitória
            else do
                putStrLn("Melhor sorte na próxima vez.")



-- Inicia uma partida de WaI?; cada jogo contém um máximo de 5 partidas,
partida:: String -> (Int, Int)
partida = do
    printTable listaPersonagens
    putStr ("Escolha um personagem: entre [1] ate [16] ")
    personagemJogador <- getLine
    menuJogador personagemJogador
    
    -- ganhador
    -- se jogador == ganhador, incrementa pJogador
    -- else incrementa pIa

    --let listaPartidaIA = listaPersonagens
    --let listaPartidaJogador = listaPersonagens
    --let listasCaracteristicasPartida = listasCaracteristicasIA
    --escolhaJogador <- getLine
    --let idPersonagemJogador = read escolhaJogador :: Int
    --let idPersonagemIA = 3 
    --let (idPersonagemIA, _) = randomR (1,16) gen :: (Int, StdGen)
    --let escolhaIA = idPersonagemIA :: String



--funções existentes no arquivo score.hs
-- Incrementa a pontuação do jogador em 1
incrementaPontuacaoJogador:: Int -> Int
incrementaPotuacaoJogador x = do
    pJogador = x+1

 
-- Incrementa a pontuação da IA em 1
incrementaPontuacaoIa:: Int -> Int 
incrementaPotuacaoIa x = x+1
