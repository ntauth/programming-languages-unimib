%% -*- Mode: Prolog -*-

/**
 * Useful predicates & meta-predicates:
 * listing(predicate_id/arity): print the impl of predicate_id/arity
 * univ, =.. : can be used to convert a list whose first item is a non-numeric atom, into a term, and vice-versa.
 */

/**
 * List Manipulation
 * 
 * List length: length([List], Length).
 * Append: append([List], Element, Result).
 * Reverse: reverse([List], Result).
 * Split: listsplit([List], Splitter, Result).
 * Membership: member(Element, [List]).
 */

%% list_length (naive impl)
list_length_naive([], 0).
list_length_naive([_ | Xs], Len) :- list_length(Xs, Len1), Len is Len1 + 1.

%% list length (TRO impl)
% 0 - Calling Rule
list_length(List, Out) :-
	list_length(List, 0 , Out).

% 1 - Terminating condition
list_length([], Count, Count).

% 2 - Recursive rule
list_length([_ | T], Count, Out) :-
	Count1 is Count + 1,
	list_length(T, Count1, Out). % <= Tail call!

%% reverse (TRO impl)
% 0 - Calling Rule
list_reverse(Xs, Ys) :- list_revappend(Xs, [], Ys).

% 1 - Terminating condition
list_revappend([], Xs, Xs).

% 2 - Recursive rule
list_revappend([X | Xs], Ys, Zs) :- list_revappend(Xs, [X | Ys], Zs).