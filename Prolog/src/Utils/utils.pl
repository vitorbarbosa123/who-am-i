:- module(utils,[ 
    read_input/1,
    write_output/1,
    formatTable/2,
    formatScore/2,
    cls/0
]).

:- use_module('./../Interfaces/headers.pl').

read_input(Atom) :-
    read_line_to_codes(user_input, X),
    string_to_atom(X, Atom).

write_output(Atom) :-
    write(Atom),
    halt.

formatTable(List, Index):-
    nth0(Index, List, Head, Result),
    format("|~t~a~t~8||~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~n", Head),
    I is Index+1,
    (
        I =< 15 -> formatTable(List, I);
        line

    ).

formatScore(List, Index):-
    nth0(Index, List,Head),
    format("|~t~a~t~4||~t~a~t~4+|~n", Head),
    I is Index + 1,
    length(List, L1),
    (
        I < L1 - 1 -> formatScore(List, I);
        write('|==============|\n\n')
    ).

cls :- write('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n').