:- use_module('./src/Interface.pl').
:- use_module('./src/Model.pl').
:- use_module('./src/Utils.pl').
:- use_module('./src/Repository.pl').

main :-
    connect_repo,
    findUsuarios(X),
    write_output(X).
