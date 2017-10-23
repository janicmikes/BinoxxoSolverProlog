% All-Unique
all_unique([]).
all_unique([E|Es]) :-
   maplist(dif(E), Es),
   all_unique(Es).

% Matrix transpose function
transpose([], []).
transpose([F|Fs], Ts) :-
    transpose(F, [F|Fs], Ts).

transpose([], _, []).
transpose([_|Rs], Ms, [Ts|Tss]) :-
        lists_firsts_rests(Ms, Ts, Ms1),
        transpose(Rs, Ms1, Tss).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
        lists_firsts_rests(Rest, Fs, Oss).

% Anzahl Vorkommen in einer Liste prüfen
occurrences(_, [], 0).

occurrences(Item, [Item | Tail], Nof) :-
occurrences(Item, Tail, NofSub), Nof is NofSub + 1.

occurrences(Item, [_ | Tail], Nof) :-
occurrences(Item, Tail, Nof).

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

binoxxo(Rows) :-
all_unique(Rows),
binoxxo_rows(Rows),
transpose(Rows, Columns),
all_unique(Columns),
binoxxo_rows(Columns),
maplist(writeln, Rows).

