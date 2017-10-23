:- use_module(library(clpfd)).

binoxxoInput(x).
binoxxoInput(o).

/*
    Rule 1
    No more than two x or o can be together
*/
/*
    Define all possible combinations between adjunct cells
*/
legalTriple(x, x, o).
legalTriple(o, o, x).
legalTriple(x, o, x).
legalTriple(o, x, o).
legalTriple(x, o, o).
legalTriple(o, x, x).

/*
    Create a border columns with ~
*/
appendBorderColumns([[Head | Tail]], [NewRow]) :-
    append([Head | Tail], ['~'], TempRow),
    append(['~'], TempRow, NewRow).

appendBorderColumns([[Head | Tail] | Tail2], [NewRow | Tail3]) :-
    append([Head | Tail], ['~'], TempRow),
    append(['~'], TempRow, NewRow),
    appendBorderColumns(Tail2, Tail3).

/*
    Create a row to be placed above and below the given grid
*/
createBorderRow([[_] | _], ['~']).
createBorderRow([[_ | Tail] | _], ['~' | Row]) :- createBorderRow([Tail], Row).

/*
    Make sure that the cell has legal adjenct cells
*/
checkCell([[E11, E12, E13], [E21, E22, E23], [E31, E32, E33]]) :-
    shipInput(E11), shipInput(E12), shipInput(E13),
    shipInput(E21), shipInput(E22), shipInput(E23),
    shipInput(E31), shipInput(E32), shipInput(E33),
    legalTriple(E11, E12,E13),
    legalTriple(E21, E22,E23),
    legalTriple(E31, E32,E33),
    legalTriple(E11, E21,E31),
    legalTriple(E12, E22,E32),
    legalTriple(E13, E23,E33).


/*
    Check all cells to make sure that they can be placed next to each other
*/
checkAllCells(_, [['~', E12, '~'], [E21, E22, '~'], ['~', '~', '~']]) :-
    checkCell([['~', E12, '~'], [E21, E22, '~'], ['~', '~', '~']]).

checkAllCells(_, [[_, _, '~'], [_, '~', '~'], ['~', '~', '~']]).

checkAllCells(Grid, [['~', E12, '~' | Tail1], [E21, E22, E23 | Tail2], ['~', '~', '~' | Tail3]]) :-
    checkCell([['~', E12, '~'], [E21, E22, E23], ['~', '~', '~']]),
    checkAllCells(Grid, [[E12, '~' | Tail1], [E22, E23 | Tail2], ['~', '~' | Tail3]]).
   
checkAllCells(Grid, [[_, E12, E13 | Tail1], [_, '~', E23 | Tail2], ['~', '~', '~' | Tail3]]) :-
    checkAllCells(Grid, [[E12, E13 | Tail1], ['~', E23 | Tail2], ['~', '~' | Tail3]]).

checkAllCells([_, SecondGridRow | OtherGridRows], [['~', E12, '~'], [E21, E22, '~'], ['~', E32, '~'] | _]) :-
    checkCell([['~', E12, '~'], [E21, E22, '~'], ['~', E32, '~']]),
    checkAllCells([SecondGridRow | OtherGridRows], [SecondGridRow | OtherGridRows]).

checkAllCells([_, SecondGridRow | OtherGridRows], [[_, _, '~'], [_, '~', '~'], [_, _, '~'] | _]) :-
    checkAllCells([SecondGridRow | OtherGridRows], [SecondGridRow | OtherGridRows]).
 
checkAllCells(Grid, [['~', E12, '~' | Tail1], [E21, E22, E23 | Tail2], ['~', E32, '~' | Tail3] | Tail]) :-
    checkCell([['~', E12, '~'], [E21, E22, E23], ['~', E32, '~']]),
    checkAllCells(Grid, [[E12, '~' | Tail1], [E22, E23 | Tail2], [E32, '~' | Tail3] | Tail]).

checkAllCells(Grid, [[_, E12, E13 | Tail1], [_, '~', E23 | Tail2], [_, E32, E33 | Tail3] | Tail]) :-
    checkAllCells(Grid, [[E12, E13 | Tail1], ['~', E23 | Tail2], [E32, E33 | Tail3] | Tail]).




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