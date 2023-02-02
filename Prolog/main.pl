:- use_module('./src/Interfaces/menus.pl').
:- use_module('./src/Model/model.pl').
:- use_module('./src/Utils/utils.pl').
:- use_module('./src/Data/repository.pl').

main :-
    connect_repo,
    mainMenu,
    findUsuarios(X),
    write_output(X).
