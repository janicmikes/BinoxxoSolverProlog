example0 :-
binoxxo([
    [o,o,x,x],
    [x,x,_,o],
    [o,x,o,x],
    [_,o,x,o]
]).
/*
    Easy 6x6 example
    Expected execution time: 0.1 seconds
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
    Expected execution time: 3.5 seconds
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
    Expected execution time: 5 seconds
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