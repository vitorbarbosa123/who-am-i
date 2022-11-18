-- Imprime reticências na tela para humanizar a tomada de decisão da IA. Perguntar ao professor ou monitor se a definição do método 
-- pode utilizar um valor concreto ao invés de um tipo

esperaIA::Integer -> () -- Sempre iniciar com 0
esperaIA inicio,totalReticencias = 
    if inicio < 3
        then do threadDelay 300000 -- Aprox. 0.3 segundos
                threadDelay 300000 putStr(". ") 
                threadDelay 300000 putStr(". ")
                threadDelay 300000 putStrLn(".")
                threadDelay 300000
                esperaIA inicio+1 totalReticencias
        else putStrLn("!")