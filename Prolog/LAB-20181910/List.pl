%% -*- Mode: Prolog -*-

list_head(X, [X | _]).

list_nth(X, 0, [X | _]).
list_nth(X, N, [_ | T]) :- N1 is N-1, list_nth(X, N1, T).

list_contains([X | _], X).
list_contains([_ | T], Y) :- list_contains(T, Y).

list_append(L, [], L).
list_append([H | T1], [H | T2], L) :- list_append(T1, T2, L).

list_sorted([]).
list_sorted([_]).
list_sorted([X, Y | T]) :- X =< Y, list_sorted([Y | T]).

list_last([X], X).
list_last([_ | T], Y) :- list_last(T, Y).

list_remove_all([], [], _).
list_remove_all(L, [X | T], X) :- list_remove_all(L, T, X).
list_remove_all([X | T1], [X | T2], E) :- X \== E, list_remove_all(T1, T2, E).

list_sum([], [], []).
list_sum([Z | T1], [X | T2], [Y | T3]) :- Z is X + Y, list_sum(T1, T2, T3).

list_total_sum(0, []).
list_total_sum(S, [X | Xs]) :- list_total_sum(R, Xs), S is X + R.

list_tail([], []).
list_tail(T, [_ | T]).

list_duplicate([], []).
list_duplicate([X, X | T1], [X | T2]) :- list_duplicate(T1, T2).
