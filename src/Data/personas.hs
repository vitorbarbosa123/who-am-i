-- Personagens utilizados no jogo, na forma de listas. Cada lista possui, além de um número identificador (índice 0) e nome (índice 1) únicos para cada entidade, um conjunto de características
-- físicas intrínsecas (em ordem: sexo (índice 2), cor dos cabelos (índice 3), etnia (índice 4), cor dos olhos (índice 5), acessório  (índice 6)), totalizando sete itens por pessoa

let p1 = ["1","Luiza","Feminino","Preto","Branca","Pretos","Óculos"]
let p2 = ["2","Renato","Masculino","Preto","Negra","Verdes","Chapéu"]
let p3 = ["3","Carolina","Feminino","Castanho","Parda","Castanhos","Brinco"]
let p4 = ["4","Antonio","Masculino","Castanho","Indígena","Azuis","Piercing"]
let p5 = ["5","Débora","Feminino","Louro","Negra","Verdes","Chapéu"]
let p6 = ["6","Paulo","Masculino","Louro","Indígena","Pretos","Óculos"]
let p7 = ["7","Tatiana","Feminino","Ruivo","Indígena","Azuis","Piercing"]
let p8 = ["8","Clóvis","Masculino","Ruivo","Branca","Castanhos","Brinco"]
let p9 = ["9","Fátima","Feminino","Preto","Parda","Castanhos","Piercing"]
let p10 = ["10","Diego","Masculino","Preto","Indígena","Azuis","Brinco"]
let p11 = ["11","Cecília","Feminino","Castanho","Branca","Verdes","Óculos"]
let p12 = ["12","Felipe","Masculino","Castanho","Negra","Pretos","Chapéu"]
let p13 = ["13","Alessandra","Feminino","Louro","Branca","Azuis","Brinco"]
let p14 = ["14","João","Masculino","Louro","Parda","Castanhos","Piercing"]
let p15 = ["15","Andréia","Feminino","Ruivo","Negra","Pretos","Chapéu"]
let p16 = ["16","Adriano","Masculino","Ruivo","Parda","Verdes","Óculos"]

-- Uma lista contendo as características, em ordem alfabética: sexo (feminino/masculino), cor do cabelo (castanho,louro,preto,ruivo), etnia (branca,indígena,negra,parda),
-- cor dos olhos (azuis,castanhos,pretos,verdes), acessório (brinco,chapéu,Piercing,óculos). O jogador humano tem que confiar na própria memórias
let listasCaracteristicasIA =[["Feminino","Masculino"],["Castanho","Louro","Preto","Ruivo"],["Branca","Indígena","Negra","Parda"],["Azuis","Castanhos","Pretos","Verdes"],["Brinco","Chapéu","Óculos","Piercing"]]

-- Lista contendo todos os personagens. Jogador e IA recebem uma cópia idêntica ao início de cada partida
let listaPersonagens = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16]
