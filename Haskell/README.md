## Who-I-am - Haskell

### Instalações
Deve ser instalado o [sqlite3](https://www.sqlite.org/index.html) na máquina para popular o banco.

Deve ser instalado também o [ghc](https://www.haskell.org/ghc/download.html) e o [cabal](https://www.haskell.org/cabal/).

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

### Rodando Projeto

```bash
cabal build
cabal run whoami
```