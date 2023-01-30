:- module(repo, [
    connect_repo/0,
    findPersonas/1
]).
:- ensure_loaded( library(prosqlite) ).

connect_repo :- sqlite_connect('wai', c, as_predicates(true)).

findPersonas(Personas) :- findPersonas(Personas, 1).
findPersonas(Personas, ID) :-
    personas(ID, Nome, Sexo, CorCabelo, Etnia, CorOlhos, Acessorio)
    -> Next is ID+1,
    findPersonas(Tail, Next),
    Personas = [[ID, Nome, Sexo, CorCabelo, Etnia, CorOlhos, Acessorio] | Tail] ; Personas = [].
