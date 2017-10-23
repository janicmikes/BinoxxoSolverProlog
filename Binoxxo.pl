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


% Beispielrätsel
%binoxxo([[A, o, x, o], [o , x, B, x], [x, o, x, C], [D, x, o, x]],
%[[A, o, x, D], [o, x, o, x], [x, B, x, o], [o, x, C, x]]).

%binoxxo(
%    [[x, x, o, o], [E, o, F, o], [o, A, o, C], [o, B, x, D]],
%    [[x, E, o, o], [x, o, A, B], [o, F, o, x], [o, o, C, D]]
)
