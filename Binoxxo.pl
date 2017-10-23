use_module(library(clpfd)).

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
binoxxo_rows(Rows),
transpose(Rows, Columns),
binoxxo_rows(Columns).

binoxxo_problem(1,
    [[A11, A21, A31, A41, x, A61, A71, o],
	[o, A22, A32, A42, A52, A62, A72, A82],
	[A13, x, o, A43, A53, A63, o, A83],
	[A14, A24, A34, x, x, A64, A74, A84],
	[x, A25, A35, o, A55, o, A75, A85],
	[A16, A26, A36, x, A56, A66, A76, o],
	[A17, A27, A37, A47, A57, A67, x, A87],
	[o, x, o, A48, A58, o, A78, A88]]
).

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
