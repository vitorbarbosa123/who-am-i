import System.Random
import Control.Concurrent

main = do

    -- Personagens utilizados no jogo, na forma de listas. Cada lista possui, além de um número identificador (índice 0) e nome (índice 1) únicos para cada entidade, um conjunto único de características
    -- físicas intrínsecas (em ordem: sexo (índice 2), cor dos cabelos (índice 3), etnia (índice 4), cor dos olhos (índice 5), acessório  (índice 6)),
    -- totalizando sete itens por pessoa

    let p1 = [1,"Luiza","Feminino","Preto","Branca","Pretos","Óculos"]
    let p2 = [2,"Renato","Masculino","Preto","Negra","Verdes","Chapéu"]
    let p3 = [3,"Carolina","Feminino","Castanho","Parda","Castanhos","Brinco"]
    let p4 = [4,"Antonio","Masculino","Castanho","Indígena","Azuis","Piercing"]
    let p5 = [5,"Débora","Feminino","Louro","Negra","Verdes","Chapéu"]
    let p6 = [6,"Paulo","Masculino","Louro","Indígena","Pretos","Óculos"]
    let p7 = [7,"Tatiana","Feminino","Ruivo","Indígena","Azuis","Piercing"]
    let p8 = [8,"Clóvis","Masculino","Ruivo","Branca","Castanhos","Brinco"]
    let p9 = [9,"Fátima","Feminino","Preto","Parda","Castanhos","Piercing"]
    let p10 = [10,"Diego","Masculino","Preto","Indígena","Azuis","Brinco"]
    let p11 = [11,"Cecília","Feminino","Castanho","Branca","Verdes","Óculos"]
    let p12 = [12,"Felipe","Masculino","Castanho","Negra","Pretos","Chapéu"]
    let p13 = [13,"Alessandra","Feminino","Louro","Branca","Azuis","Brinco"]
    let p14 = [14,"João","Masculino","Louro","Parda","Castanhos","Piercing"]
    let p15 = [15,"Andréia","Feminino","Ruivo","Negra","Pretos","Chapéu"]
    let p16 = [16,"Adriano","Masculino","Ruivo","Parda","Verdes","Óculos"]

    -- Uma lista contendo as características, em ordem alfabética: sexo (feminino/masculino), cor do cabelo (castanho,louro,preto,ruivo), etnia (branca,indígena,negra,parda),
    -- cor dos olhos (azuis,castanhos,pretos,verdes), acessório (brinco,chapéu,Piercing,óculos). O jogador humano tem que confiar na própria memória
    let listasCaracteristicasIA =[["Feminino","Masculino"],["Castanho","Louro","Preto","Ruivo"],["Branca","Indígena","Negra","Parda"],["Azuis","Castanhos","Pretos","Verdes"],["Brinco","Chapéu","Óculos","Piercing"]]

    -- Listas com conteúdos idênticos, para determinar quais personagens ainda não foram eliminados. À medida que os participantes eliminam candidatos
    let listaPersonagensIA = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16]
    let listaPersonagensJogador[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16]

    -- Início de um jogo e seu "laço" de execução
    putStr("Nome do jogador: ")
    nome <- getLine
    let pontuacaoJogador = 0
    let pontuacaoIA = 0
    jogo::Integer -> () --Sempre vai receber 1 como argumento inicial
    jogo rodada =
        if rodada < 6 || pontuacaoIA < 3 || pontuacaoJogador < 3
            then do 
                --Código para iniciar uma partida
                jogo rodada+1 
            else if pontuacaoJogador > pontuacaoIA
                then --Atualiza o HashMap da leaderboard com o nome do jogador
                else putStrLn("Perdeu preiboi")

    -- Itera sobre uma lista de personagens, eliminando personagens
    iteraListaPersonagens::[] -> Integer -> String -> () --Argumentos: lista de personagens a ser iterada, iterador/condição de parada, categoria, característica
    iteraListaPersonagens lista, iterador, caracteristica = 
        if iterador < lista length
            then if caracteristica `elem` lista !! iterador
                then removePersonagem lista iterador
                else iteraListaPersonagens lista iterador+1 --case/switch de acordo com a característica escolhida usando os métodos específicos
            else alteraListaCaracteristicas categoria-1 caracteristica-1
        

    -- Remove um personagem da lista de uma partida
    removePersonagem::[] -> Integer -> ()
    removePersonagem listaPersonagens indice =
        removeNth indice listaPersonagens

    -- Remove um elemento de uma lista
    removeNth :: Int -> [] a -> [] a
    removeNth = \n -> \list ->
      case n of 
          0 -> tail list
          otherwise -> head list: removeNth (n-1) (tail list)

    --
    alteraListaCaracteristicas::String -> ()

    --
    partida::Integer -> ()
    partida asdf =
        chancePalpite = 0
        escolhaJogador <- getLine
        let idPersonagemJogador = read escolhaJogador :: Int
        let idPersonagemIA = randomRIO(1,16)
        putStrLn("Eu quero...\n[1] descobrir quem você é!\n[2] dar meu palpite!")

    --
    esperaIA::Integer -> () -- Int randomizada, entre 3-6?
    esperaIA totalReticencias = 
        if totalReticencias < 6
            then threadDelay 150000
                threadDelay 300000 putStr(". ") -- Aprox. 0.3 segundos
                threadDelay 300000 putStr(". ")
                threadDelay 300000 putStrLn(".")
                threadDelay 150000
                esperaIA totalReticencias+1
            else putStrLn("!")
    
    --
    exibePersonagem::[] -> ()
    exibePersonagem lista = 
        putStrLn("["++lista !! 0 ++"] "++ lista !! 1 ++ ": Sexo " ++ lista !! 2 ++ ", Cabelo " ++ lista !! 3 ++ ", Etnia "++ lista !! 4 ++ ", Olhos "++ lista !! 5 ++ ", e usa "++ lista !! 6)


        

-- Textos para os menus
putStrLn("[1] Sexo\n[2] Cor do cabelo\n[3] Etnia\n[4] Cor dos olhos\n[5] Acessório\n[6] Quero escolher outra categoria.") -- Menu de Categorias

putStrLn("[1] Feminino\n[2] Masculino\n[3] Quero escolher outra categoria.") -- Sexo
putStrLn("Meu sexo é " )
putStrLn("Eu não pertenço ao sexo ")

putStrLn("[1] Castanho\n[2] Louro\n[3] Preto\n[4] Ruivo\n[5] Quero escolher outra categoria.") -- Cor do cabelo
putStrLn("Meu cabelo é ")
putStrLn("Meu cabelo não é")

putStrLn("[1] Branca\n[2] Indígena\n[3] Negra\n[4] Parda\n[5] Quero escolher outra categoria.") -- Etnia
putStrLn("Minha etnia é ")
putStrLn("Minha etnia não é ")

putStrLn("[1] Azuis\n[2] Castanhos\n[3] Pretos\n[4] Verdes\n[5] Quero escolher outra categoria.") -- Cor dos olhos
putStrLn("Meus olhos são ")
putStrLn("Meus olhos não são ")

putStrLn("[1] Brinco\n[2] Chapéu\n[3] Piercing\n[4] Óculos\n[5] Quero escolher outra categoria.") -- Acessório
putStrLn("Sim, eu uso ")
putStrLn("Não, eu não uso ")

putStrLn("[1] Eu acho que você é...\n[2] Não quero me arriscar agora...") -- Menu de palpite
