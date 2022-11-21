-- Início de um jogo e seu "laço" de execução

jogo::Int -> IO() --Sempre vai receber 1 como argumento inicial
jogo rodada =
    if rodada <= 5 || pontuacaoIA < 3 || pontuacaoJogador < 3
        then do 
            partida
            jogo rodada+1 
        else if pontuacaoJogador > pontuacaoIA
            then
                --Atualiza o HashMap da leaderboard com o nome do jogador
            else
                putStrLn("Melhor sorte na próxima vez.")

-- Remove um elemento de uma lista de acordo com o índice fornecido
removePorIndice :: Integer -> [a] -> [a]
removePorIndice = \n -> \list ->
    case n of 
        0 -> tail list
        otherwise -> head list: removePorIndice (n-1) (tail list)
