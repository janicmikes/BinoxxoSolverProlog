/*
    Easy 6x6 example
    Expected execution time: 0.1 seconds
*/
example1 :-
binoxxo([
    [x,-,-,-,-,x],
    [-,-,-,-,-,-],
    [o,o,-,-,x,-],
    [-,-,-,-,-,-],
    [o,x,-,-,o,-],
    [-,-,o,o,-,-]]
).


/*
    Hard 6x6 example
    Expected execution time: 3.5 seconds
*/
example2 :-
binoxxo([
    [-,o,o,-,-,-],
    [-,-,-,-,-,x],
    [-,-,-,-,-,-],
    [o,o,-,-,x,-],
    [-,-,o,-,-,-],
    [x,-,-,-,x,-]]
).


/*
    Easy 8x8 example
    Expected execution time: 5 seconds
*/
example3 :-
binoxxo([
    [-,-,-,-,o,o,-,-],
    [o,-,-,-,-,o,o,-],
    [-,-,x,x,-,-,-,-],
    [-,-,-,o,-,-,x,-],
    [-,x,-,-,-,-,-,-],
    [-,-,-,o,o,-,-,-],
    [-,-,-,-,-,-,-,x],
    [o,-,-,-,-,-,-,-]]
).