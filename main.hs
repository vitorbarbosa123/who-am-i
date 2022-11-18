import System.Random
import Control.Concurrent

novoJogo::IO()
novoJogo = do
    putStr("Nome do jogador: ")
    nome <- getLine
    let pontuacaoJogador = 0
    let pontuacaoIA = 0
    jogo 1



-- Inicia uma partida de WaI?; cada jogo contém um máximo de 5 partidas,
partida::IO()
partida = do
    let listaPartidaIA = listaPersonagens
    let listaPartidaJogador = listaPersonagens
    let listasCaracteristicasPartida = listasCaracteristicasIA
    chancePalpite = 0
    let escolhaJogador <- getLine
    let idPersonagemJogador = read escolhaJogador :: Int
    let (idPersonagemIA, _) = randomR (1,16) gen :: (Int, StdGen)
    let escolhaIA = idPersonagemIA :: String
    menuJogador


alteraListaCaracteristicas:: Boolean -> String -> Integer -> ()
alteraListaCaracteristicas operador caracteristica indice= do
    if operador == True
        then
            let listasCaracteristicasPartida !! 0 = [caracteristica]
        else
            removePorIndice indice listasCaracteristicasPartida