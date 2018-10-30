%% -*- Mode: Prolog -*-

%% Data
connected([0, 0], [1, 0]).
connected([0, 0], [0, 0]).
connected([1, 0], [1, 0]).
connected([0, 0], [0, 1]).
connected([0, 1], [0, 1]).
connected([1, 0], [2, 0]).
connected([2, 0], [2, 0]).

reachable(X, X, 0) :- connected(X, X).
reachable(X, Y, 1) :- connected(X, Y).

reachable(X, Z, Steps) :-
    reachable(X, Y, Steps1),
    reachable(Y, Z, Steps2),
    Steps is Steps1 + Steps2.

objective_reachable(X, Steps) :- (Y = [2, 0]), reachable(X, Y, Steps).