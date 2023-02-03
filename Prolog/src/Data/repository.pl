/** <module> repository
 * Módulo responsável pela comunicação com o banco, realizando consultas ou cadastro
 */
:- module(repository, [
    connect_repo/0,
    findPersonas/1,
    findUsuarios/1,
    findOrCreateUser/2,
    incrementUserScore/1
]).
:- ensure_loaded( library(prosqlite) ).

/*
* Inicia conexão com o banco
**/
connect_repo :- sqlite_connect('wai', c, as_predicates(true)).

/** Realiza uma consulta pelos personsagens no banco
 */
findPersonas(Personas) :- 
    findPersonas(Personas, 1).

findPersonas(Personas, ID) :-
    personas(ID, Nome, Sexo, CorCabelo, Etnia, CorOlhos, Acessorio)
    -> Next is ID+1,
    findPersonas(Tail, Next),
    Personas = [[ID, Nome, Sexo, CorCabelo, Etnia, CorOlhos, Acessorio] | Tail] ; Personas = [].

/** Realiza uma consulta pelos jogadores já cadastrados banco
 */
findUsuarios(Usuarios) :- 
    findUsuarios(Usuarios, 1).

findUsuarios(Usuarios, ID) :-
    usuarios(ID, Nome, Pontuacao)
    -> Next is ID+1,
    findUsuarios(Tail, Next),
    Usuarios = [[Nome, Pontuacao] | Tail] ; Usuarios = [].

/** Realiza uma consulta por um usuário no banco,
 * caso exista retorna o usuário, caso não,
 * cadastra o mesmo no banco
 * @param Name, nome do usuário captado por um read
 * @param User, nome cadastrado no banco
 */
findOrCreateUser(Name, User) :- 
    usuarios(_, Name, Pontuacao)
    -> User = [Name, Pontuacao];
    sqlite_format_query(c, 'INSERT INTO usuarios(nome, pontos) VALUES ("~w", 0);'-Name, _),
    usuarios(_, Name, Pontuacao),
    User = [Name, Pontuacao].

/* incrementa a pontuação em um usuário específico
*/
incrementUserScore(Name) :-
    usuarios(_, Name, _) ->
    sqlite_format_query(c, 'UPDATE usuarios SET pontos=pontos+1 WHERE nome="~w";'-Name, _).
