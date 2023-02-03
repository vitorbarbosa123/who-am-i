/* <module> utils
*  Módulo contento alguns algoritmos reutilizados em formatações pela aplicação
*/
:- module(utils,[ 
    formatTable/2,
    formatScore/2,
    formatFilterTable/2,
    cls/0
]).

:- use_module('./../Interfaces/headers.pl').


/*
* Aplica formatação específica para a tabela de personagens
* @param List, lista de personagens
* @param indice inicial para printar personagens
*/
formatTable(List, Index):-
    nth0(Index, List, Head),
    format("|~t~a~t~8||~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~n", Head),
    I is Index+1,
    (
        I =< 15 -> formatTable(List, I);
        line

    ).

/*
* Aplica formatação específica para a tabela de pontuação
* @param List, lista de jogadores
* @param indice inicial para printar jogadores
*/
formatScore(List, Index):-
    nth0(Index, List,Head),
    format("|~t~a~t~4||~t~a~t~4+|~n", Head),
    I is Index + 1,
    length(List, L1),
    (
        I < L1 - 1 -> formatScore(List, I);
        write('|==============|\n\n')
    ).

/*
* Aplica formatação específica para a tabela de personagens após filtragem
* @param List, lista de personagens filtrados
* @param indice inicial para printar personagens
*/
formatFilterTable(List, Index):-
    nth0(Index, List, Head),
    format("|~t~a~t~8||~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~t~a~t~8+|~n", Head),
    I is Index+1,
    length(List, L1),
    (
        I < L1 -> formatFilterTable(List, I);
        line

    ).

/*
 * Realiza limpeza no terminal  
 */
cls :- write('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n').