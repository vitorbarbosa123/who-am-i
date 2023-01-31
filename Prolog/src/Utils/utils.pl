:- module(utils,[ 
    read_input/1,
    write_output/1,
    cls/0
]).

read_input(Atom) :-
    read_line_to_codes(user_input, X),
    string_to_atom(X, Atom).

write_output(Atom) :-
    write(Atom),
    halt.

cls :- write('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n').

