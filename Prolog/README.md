## Who-I-am - Prolog

### Instalações
Deve ser instalado o [sqlite3](https://www.sqlite.org/index.html) na máquina para popular o banco.

Deve ser instalado o [SWI-Prolog](https://www.swi-prolog.org/Download.html).

### Popular banco

Entre na pasta /Data e gere o banco com um dos comandos abaixo: 

Para linux/IOS:
```bash
sqlite3 wai.sqlite < create-db.sql
```

Para Windows:
```bash
sqlite3 wai.sqlite -init create-db.sql
```
Depois mova o banco gerado para a pasta principal do projeto

Após criar o banco de dados, você pode executar o seguinte comando para rodar o jogo:

### Rodando Projeto

```bash
swipl -s main.pl
```
### Prolog
