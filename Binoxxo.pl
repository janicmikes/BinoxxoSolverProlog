binoxxoInput(x).
binoxxoInput(o).

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