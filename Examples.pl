/*
    Easy 4x4 example
*/
example0 :-
binoxxo([
    [o,_,_,_],
    [x,_,_,o],
    [_,x,_,x],
    [x,_,_,o]
]).

/*
    Easy 6x6 example
*/
example1 :-
binoxxo([
    [x,_,_,_,_,x],
    [_,_,_,_,_,_],
    [o,o,_,_,x,_],
    [_,_,_,_,_,_],
    [o,x,_,_,o,_],
    [_,_,o,o,_,_]]
).

/*
    Hard 6x6 example
*/
example2 :-
binoxxo([
    [_,o,o,_,_,_],
    [_,_,_,_,_,x],
    [_,_,_,_,_,_],
    [o,o,_,_,x,_],
    [_,_,o,_,_,_],
    [x,_,_,_,x,_]]
).

/*
    Easy 8x8 example
*/
example3 :-
binoxxo([
    [_,_,_,_,o,o,_,_],
    [o,_,_,_,_,o,o,_],
    [_,_,x,x,_,_,_,_],
    [_,_,_,o,_,_,x,_],
    [_,x,_,_,_,_,_,_],
    [_,_,_,o,o,_,_,_],
    [_,_,_,_,_,_,_,x],
    [o,_,_,_,_,_,_,_]]
).
