% Anzahl Vorkommen in einer Liste prüfen
occurrences(_, [], 0).

occurrences(Item, [Item | Tail], Nof) :-
occurrences(Item, Tail, NofSub), Nof is NofSub + 1.

occurrences(Item, [Head | Tail], Nof) :-
occurrences(Item, Tail, Nof), Item \= Head.

% Gleichheit der Häufigkeit von x und o prüfen
symbol_equality(List) :-
occurrences(o, List, Nof), occurrences(x, List, Nof).

symbol_equality(List) :-
occurrences(x, List, Nof), occurrences(o, List, Nof).

% Chain prüft ob es eine Kette von mindestens Counter Elementen
% gleichartiger Elemente hat
valid_triple(x, x, o).
valid_triple(x, o, x).
valid_triple(o, o, x).
valid_triple(o, x, o).
valid_triple(x, o, o).
valid_triple(o, x, x).

neighbour_check([A, B, C]) :- valid_triple(A, B, C).

neighbour_check([Head1, Head2, Head3 | Tail]) :-
valid_triple(Head1, Head2, Head3),
neighbour_check([Head2, Head3 | Tail]).

% Binoxxo
binoxxo_rows([]).

binoxxo_rows([Row | OtherRows]) :-
symbol_equality(Row),
neighbour_check(Row),
binoxxo_rows(OtherRows).

binoxxo(Rows, Columns) :-
binoxxo_rows(Rows),
binoxxo_rows(Columns).

:- use_module(library(clpfd)).

binoxxoInput(x).
binoxxoInput(o).

/*
    Rule 1
    No more than two x or o can be together
*/
/*
    Define all possible horizontal combinations between adjunct cells
*/
legalHorizontalCombination(x, x, o).
legalHorizontalCombination(o, o, x).
legalHorizontalCombination(x, o, x).
legalHorizontalCombination(o, x, o).
legalHorizontalCombination(x, o, o).
legalHorizontalCombination(o, x, x).


/*
    Define all possible vertical combinations between adjunct cells
*/
legalVerticalCombination(x, x, o).
legalVerticalCombination(o, o, x).
legalVerticalCombination(x, o, x).
legalVerticalCombination(o, x, o).
legalVerticalCombination(x, o, o).
legalVerticalCombination(o, x, x).


/*
    Rule 2
    Each row and column has equally as much x as o's
*/
count_occurrences(List, Occ):-
    findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ).

/*
    Rule 3
    Each row is unique and each column is unique
*/



/*
    Output the grid
*/
printGrid([[Head]]) :- write(Head), nl.
printGrid([[Head | Tail]]) :- write(Head), write(' '), printGrid([Tail]).
printGrid([[Head] | Tail]) :- write(Head), nl, printGrid(Tail).
printGrid([[Head | Tail] | Tail2]) :- write(Head), write(' '), printGrid([Tail | Tail2]).
/*
    Entry point of the program
*/
binoxxo(Grid) :-
    %append(TempGrid1, [BorderRow], TempGrid2),
    %append([BorderRow], TempGrid2, NewGrid),
    %checkColumnChecksums(Grid, ColumnChecksums),
    %checkRowChecksums(Grid, RowChecksums),
    %checkAllCells(NewGrid, NewGrid),
    %checkShips(NewGrid, Ships),
    printGrid(Grid), !.
