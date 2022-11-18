menuJogador::IO()
menuJogador = do
    putStrLn("Eu quero...\n[1] descobrir quem você é!\n[2] dar meu palpite!")
    escolhaJogador <- getLine
    if escolhaJogador == "1"
        then
            menuCategorias
        else if escolhaJogador == "2"
            then
                menuPalpite
            else do
                putStrLn("Opção inválida!")
                menuJogador

-- Menu de categorias
menuCategorias::IO()
menuCategorias = do
    putStrLn("Escolha uma categoria:")
    putStrLn("[1] Sexo\n[2] Cor do cabelo\n[3] Etnia\n[4] Cor dos olhos\n[5] Acessório\n[6] Mudei de idéia")
    escolhaCategoria <- getLine
        | escolhaCategoria <= "1" = menuSexo
        | escolhaCategoria <= "2" = menuCabelo
        | escolhaCategoria <= "3" = menuEtnia
        | escolhaCategoria <= "4" = menuOlhos
        | escolhaCategoria <= "5" = menuAcessorios
        | escolhaCategoria <= "6" = menuJogador
        | otherwise do
            putStrLn("Opção inválida!")
            menuJogador

-- Menu da categoria sexo
menuSexo::IO()
menuSexo = do
    putStrLn("[1] Feminino\n[2] Masculino\n[3] Quero escolher outra categoria.")
    escolhaSexo <- getLine
        | escolhaSexo <= "1" = verificacaoPersonagem "Masculino" (idPersonagemIA-1)
            if True 
                then do
                    putStrLn("Meu sexo é masculino")
                    alteraListaCaracteristicas True "Masculino" 0
                    removePersonagens listaPartidaJogador 0 "Masculino"
                else do
                    putStrLn("Eu não pertenço ao sexo masculino")
                    alteraListaCaracteristicas False "Masculino" 0
                    removePersonagens listaPartidaJogador 0 "Masculino"
        | escolhaSexo <= "2" = verificacaoPersonagem "Feminino" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meu sexo é feminino")
                    alteraListaCaracteristicas True "Feminino" 0
                    removePersonagens listaPartidaJogador 0 "Feminino"
                else do
                    putStrLn("Eu não pertenço ao sexo feminino")
                    alteraListaCaracteristicas False "Feminino" 0
                    removePersonagens listaPartidaJogador 0 "Feminino"
        | escolhaSexo <= "3" = menuCategorias
        | otherwise do
            putStrLn("Opção inválida!")
            menuSexo

-- Menu da categoria cabelo
menuCabelo::IO()
menuCabelo = do
    putStrLn("[1] Castanho\n[2] Louro\n[3] Preto\n[4] Ruivo\n[5] Quero escolher outra categoria.")
    escolhaCabelo <- getLine
        | escolhaCabelo <= "1" = verificacaoPersonagem "Castanho" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meu cabelo é castanho.")
                    alteraListaCaracteristicas True "Castanho" 1
                    removePersonagens listaPartidaJogador 0 "Castanho"
                else do
                    putStrLn("Meu cabelo não é castanho.")
                    alteraListaCaracteristicas False "Castanho" 1
                    removePersonagens listaPartidaJogador 0 "Castanho"
        | escolhaCabelo <= "2" = verificacaoPersonagem "Louro" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meu cabelo é louro.")
                    alteraListaCaracteristicas True "Louro" 1
                    removePersonagens listaPartidaJogador 0 "Louro"
                else do
                    putStrLn("Meu cabelo não é louro.")
                    alteraListaCaracteristicas False "Louro" 1
                    removePersonagens listaPartidaJogador 0 "Louro"
        | escolhaCabelo <= "3" = verificacaoPersonagem "Preto" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meu cabelo é preto.")
                    alteraListaCaracteristicas True "Preto" 1
                    removePersonagens listaPartidaJogador 0 "Preto"
                else do
                    putStrLn("Meu cabelo não é preto.")
                    alteraListaCaracteristicas False "Preto" 1
                    removePersonagens listaPartidaJogador 0 "Preto"
        | escolhaCabelo <= "4" = verificacaoPersonagem "Ruivo" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meu cabelo é ruivo.")
                    alteraListaCaracteristicas True "Ruivo" 1
                    removePersonagens listaPartidaJogador 0 "Ruivo"
                else do
                    putStrLn("Meu cabelo não é ruivo.")
                    alteraListaCaracteristicas False "Ruivo" 1
                    removePersonagens listaPartidaJogador 0 "Ruivo"
        | escolhaCabelo <= "5" = menuCategorias
        | otherwise do putStrLn("Opção inválida!") menuCabelo

-- Menu da categoria etnia
menuEtnia::IO()
menuEtnia = do
    putStrLn("[1] Branca\n[2] Indígena\n[3] Negra\n[4] Parda\n[5] Quero escolher outra categoria.")
    escolhaEtnia <- getLine
        | escolhaEtnia <= "1" = verificacaoPersonagem "Branca" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Minha etnia é branca.")
                    alteraListaCaracteristicas True "Branca" 2
                    removePersonagens listaPartidaJogador 0 "Branca"
                else do
                    putStrLn("Minha etnia não é branca.")
                    alteraListaCaracteristicas False "Branca" 2
                    removePersonagens listaPartidaJogador 0 "Branca"
        | escolhaEtnia <= "2" = verificacaoPersonagem "Indígena" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Minha etnia é indígena.")
                    alteraListaCaracteristicas True "Indígena" 2
                    removePersonagens listaPartidaJogador 0 "Indígena"
                else do
                    putStrLn("Minha etnia não é indígena")
                    alteraListaCaracteristicas False "Indígena" 2
                    removePersonagens listaPartidaJogador 0 "Indígena"
        | escolhaEtnia <= "3" = verificacaoPersonagem "Negra" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Minha etnia é negra.")
                    alteraListaCaracteristicas True "Negra" 2
                    removePersonagens listaPartidaJogador 0 "Negra"
                else do
                    putStrLn("Minha etnia não é negra.")
                    alteraListaCaracteristicas False "Negra" 2
                    removePersonagens listaPartidaJogador 0 "Negra"
        | escolhaEtnia <= "4" = verificacaoPersonagem "Parda" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Minha etnia é parda.")
                    alteraListaCaracteristicas True "Parda" 2
                    removePersonagens listaPartidaJogador 0 "Parda"
                else do
                    putStrLn("Minha etnia não é parda.")
                    alteraListaCaracteristicas False "Parda" 2
                    removePersonagens listaPartidaJogador 0 "Parda"
        | escolhaEtnia <= "5" = menuCategorias
        | otherwise do
            putStrLn("Opção inválida!")
            menuEtnia

-- Menu da categoria cor dos olhos
menuOlhos::IO()
menuOlhos = do
    putStrLn("[1] Azuis\n[2] Castanhos\n[3] Pretos\n[4] Verdes\n[5] Quero escolher outra categoria.")
    escolhaOlhos <- getLine
        | escolhaOlhos <= "1" = verificacaoPersonagem "Azuis" (idPersonagemIA-1)
        if True
                then do
                    putStrLn("Meus olhos são azuis.")
                    alteraListaCaracteristicas True "Azuis" 3
                    removePersonagens listaPartidaJogador 0 "Azuis"
                else do
                    putStrLn("Meus olhos não são azuis.")
                    -alteraListaCaracteristicas False "Azuis" 3
                    removePersonagens listaPartidaJogador 0 "Azuis"
        | escolhaOlhos <= "2" = verificacaoPersonagem "Castanhos" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meus olhos são castanhos.")
                    alteraListaCaracteristicas True "Castanhos" 3
                    removePersonagens listaPartidaJogador 0 "Castanhos"
                else do
                    putStrLn("Meus olhos não são castanhos.")
                    alteraListaCaracteristicas False "Castanhos" 3
                    removePersonagens listaPartidaJogador 0 "Castanhos"
        | escolhaOlhos <= "3" = verificacaoPersonagem "Pretos" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meus olhos são pretos.")
                    alteraListaCaracteristicas True "Pretos" 3
                    removePersonagens listaPartidaJogador 0 "Pretos"
                else do
                    putStrLn("Meus olhos não são pretos.")
                    alteraListaCaracteristicas False "Pretos" 3
                    removePersonagens listaPartidaJogador 0 "Pretos"
        | escolhaOlhos <= "4" = verificacaoPersonagem "Verdes" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Meus olhos são verdes.")
                    alteraListaCaracteristicas True "Verdes" 3
                    removePersonagens listaPartidaJogador 0 "Verdes"
                else do
                    putStrLn("Meus olhos não são verdes.")
                    alteraListaCaracteristicas False "Verdes" 3
                    removePersonagens listaPartidaJogador 0 "Verdes"
        | escolhaOlhos <= "5" = menuCategorias
        | otherwise do
            putStrLn("Opção inválida!")
            menuOlhos

-- Menu da categoria acessorio
menuAcessorios::IO()
menuAcessorios = do
    putStrLn("[1] Brinco\n[2] Chapéu\n[3] Piercing\n[4] Óculos\n[5] Quero escolher outra categoria.")
    escolhaAcessorios <- getLine
        | escolhaAcessorio <= "1" = verificacaoPersonagem "Brinco" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Eu uso brinco.")
                    alteraListaCaracteristicas True "Brinco" 4
                    removePersonagens listaPartidaJogador 0 "Brinco"
                else do
                    putStrLn("Eu não uso brinco.")
                    alteraListaCaracteristicas False "Brinco" 4
                    removePersonagens listaPartidaJogador 0 "Brinco"
        | escolhaAcessorio <= "2" = verificacaoPersonagem "Chapéu" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Eu uso chapéu.")
                    alteraListaCaracteristicas True "Chapéu" 4
                    removePersonagens listaPartidaJogador 0 "Chapéu"
                else do
                    putStrLn("Eu não uso chapéu.")
                    alteraListaCaracteristicas False "Chapéu" 4
                    removePersonagens listaPartidaJogador 0 "Chapéu"
        | escolhaAcessorio <= "3" = verificacaoPersonagem "Piercing" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Eu uso piercing.")
                    alteraListaCaracteristicas True "Piercing" 4
                    removePersonagens listaPartidaJogador 0 "Piercing"
                else do
                    putStrLn("Eu não uso piercing.")
                    alteraListaCaracteristicas False "Piercing" 4
                    removePersonagens listaPartidaJogador 0 "Piercing"
        | escolhaAcessorio <= "4" = verificacaoPersonagem "Óculos" (idPersonagemIA-1)
            if True
                then do
                    putStrLn("Eu uso óculos.")
                    alteraListaCaracteristicas True "Óculos" 4
                    removePersonagens listaPartidaJogador 0 "Óculos"
                else do
                    putStrLn("Eu não uso óculos.")
                    alteraListaCaracteristicas False "Óculos" 4
                    removePersonagens listaPartidaJogador 0 "Óculos"
        | escolhaAcessorio <= "5" = menuCategorias
        | otherwise do
            putStrLn("Opção inválida!")
            menuAcessorios

-- Menu de palpites
menuPalpite:: IO()
menuPalpite = do
    putStrLn("[1] Eu acho que você é...\n[2] Não quero me arriscar agora...")
    escolhaJogador <- getLine
    if escolhaJogador == "1"
        then do 
            palpiteJogador <- getLine
            if palpiteJogador == escolhaIA
                then incrementaPontuacaoJogador
                else incrementaPontuacaoIA
        else if escolhaJogador == "2"
            then menuJogador
            else do
                putStrLn("Opção inválida!")
                menuPalpite


-- Exibe uma representação textual de um personagem
exibePersonagem::[] -> Integer -> ()
exibePersonagem lista, indice = 
    putStr("[")
    print(lista !! 0)
    putStr("] ")
    print(lista !! 1)
    putStr(": sexo ")
    print(lista !! 2)
    putStr(", cabelo ")
    print(lista !! 3)
    putStr(", etnia ")
    print(lista !! 4)
    putStr(", olhos ")
    print(lista !! 5)
    putStr(", e usa ")
    print(lista !! 6)
    putStrLn(".")

-- Exibe representações textuais de todos os personagens em uma lista. O argumento lenLista é apenas uma condição de parada para as chamadas recursivas
exibePersonagens::[] -> Integer -> ()
exibePersonagens lista, lenLista = 
    if lenLista < lista length
        then do exibePersonagem lista lenLista
                exibePersonagens lenLista+1
        else putStrLn("---")
