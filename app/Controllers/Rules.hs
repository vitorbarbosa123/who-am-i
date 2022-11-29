module Controllers.Rules where

import System.Random
import Control.Concurrent

-- Inicia um novo jogo
novoJogo:: String -> IO()
novoJogo x = do
    nome = x
    let pontuacaoJogador = 0
    let pontuacaoIA = 0
    jogo 1



-- Início de um jogo e seu "laço" de execução
jogo::Int -> IO() --Sempre vai receber 1 como argumento inicial
jogo rodada =
    if rodada <= 5 || pontuacaoIA < 3 || pontuacaoJogador < 3
        then do 
            partida
            jogo rodada+1 
        else if pontuacaoJogador > pontuacaoIA
            then
                putStrLn("Você venceu, parabéns!")
            else
                putStrLn("Melhor sorte na próxima vez.")



-- Inicia uma partida de WaI?; cada jogo contém um máximo de 5 partidas,
partida::IO()
partida =
    let listaPartidaIA = listaPersonagens
    let listaPartidaJogador = listaPersonagens
    let listasCaracteristicasPartida = listasCaracteristicasIA
    chancePalpite = 0
    let escolhaJogador <- getLine
    let idPersonagemJogador = read escolhaJogador :: Int
    let (idPersonagemIA, _) = randomR (1,16) gen :: (Int, StdGen)
    let escolhaIA = idPersonagemIA :: String
    menuJogador


--funções existentes no arquivo score.hs
-- Incrementa a pontuação do jogador em 1
incrementaPontuacaoJogador::() -> Integer
incrementaPontuacaoJogador =
    pontuacaoJogador = pontuacaoJogador+1

-- Incrementa a pontuação da IA em 1
incrementaPontuacaoIA::() -> Integer
incrementaPontuacaoIA = 
    pontuacaoIA = pontuacaoIA+1