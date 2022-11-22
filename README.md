# Who am I?

## Descrição do projeto
Cara a cara é um jogo onde o jogador deve adivinhar qual é o personagem do seu oponente com base em caracteristicas e personas. 
Aquele que acertar primeiro a persona do outro vence.

### Modo de jogo
É possível jogar-lo versus outro usuário ou versus a IA

### IA
construída com base em um algoritmo de decisão por eliminação

### Ferramentas
projeto deverá possuir uma versão construída em Haskell e outra em prolog


## Rodando o projeto
Para rodar o cara a cara, primeiro você deve ter o [ghc](https://www.haskell.org/ghc/download.html), o [cabal](https://www.haskell.org/cabal/) e o [sqlite3](https://www.sqlite.org/index.html) instalados.

Primeiro, vamos criar e popular o banco de dados:

```bash
sqlite3 wai.db < create-db.sql
```

Após criar o banco de dados, você pode executar o seguinte comando para rodar o jogo:

```bash
cabal build
cabal run whoami
```