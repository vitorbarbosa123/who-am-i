module Rules where

--import System.Random -- ToDO = verificar o motivo de random, não ser compilado
--import Control.Concurrent -- utlizado em esperaIA
import Personas
--import Menu

-- Inicia um novo jogo
novoJogo:: String -> IO()
novoJogo x = do
    let nome = x
    jogo 1 0 0



-- Início de um jogo e seu "laço" de execução
jogo:: Int -> Int -> Int -> IO() --Sempre vai receber 1 como argumento inicial, a pontuacao do jogador e a pontuacao da IA.
jogo rodada pJogador pIa = 
    if rodada <= 5 || pIa < 3 || pJogador < 3
        then do 
            --partida
            jogo (rodada+1) pJogador pIa
        else if pJogador > pIa
            then
                putStrLn("Você venceu, parabéns!")
            else
                putStrLn("Melhor sorte na próxima vez.")



-- Inicia uma partida de WaI?; cada jogo contém um máximo de 5 partidas,
--partida::IO()
--partida = do

    --let listaPartidaIA = listaPersonagens
    --let listaPartidaJogador = listaPersonagens
    --let listasCaracteristicasPartida = listasCaracteristicasIA
    --escolhaJogador <- getLine
    --let idPersonagemJogador = read escolhaJogador :: Int
    --let idPersonagemIA = 3
    --let (idPersonagemIA, _) = randomR (1,16) gen :: (Int, StdGen)
    --let escolhaIA = idPersonagemIA :: String
    --menuJogador



--funções existentes no arquivo score.hs
-- Incrementa a pontuação do jogador em 1
incrementaPontuacaoJogador:: Int -> Int -> Int -> IO()
incrementaPontuacaoJogador x y z = jogo x (y+1) z
 
-- Incrementa a pontuação da IA em 1
incrementaPontuacaoIa:: Int -> Int -> Int -> IO()
incrementaPontuacaoIa x y z = jogo x y (z+1)
