![image](https://user-images.githubusercontent.com/51303068/205130546-228228d4-d76c-4d89-b64d-49836daba82a.png)

# Who am I?

## Descrição do projeto
Cara a cara é um jogo onde o jogador deve adivinhar qual é o personagem do seu oponente com base em caracteristicas e personas. 
Aquele que acertar primeiro a persona do outro, vence.

### Modo de jogo
É possível jogar 
- Jogador x Jogador
- Jogador x Máquina

### IA
Construída com base em um algoritmo de decisão por eliminação

### Versões
```bash
Versão em haskell = Done!
```
```bash
Versão em Prolog = Loading...
```

## Rodando o projeto
Independente da versão, deve ser instalado o [sqlite3](https://www.sqlite.org/index.html) na máquina para popular o banco.

### Haskell
Deve ser instalado também o [ghc](https://www.haskell.org/ghc/download.html) e o [cabal](https://www.haskell.org/cabal/).

### Prolog
Deve ser instalado o [SWI-Prolog](https://www.swi-prolog.org/Download.html).
 

### Popular banco

Para linux/IOS:
```bash
sqlite3 wai.db < create-db.sql
```

Para Windows:
```bash
sqlite3 wai.db -init create-db.sql
```

Após criar o banco de dados, você pode executar o seguinte comando para rodar o jogo:

#### Haskell

```bash
cabal build
cabal run whoami
```

#### Prolog
