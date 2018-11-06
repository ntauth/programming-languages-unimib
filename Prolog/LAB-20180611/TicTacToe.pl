%% -*- Mode: Prolog -*-

%% Prints game board
print_board([C | Cs]) :- print_board([C | Cs], 1).
print_board([], _).
print_board([C | Cs], Idx) :-
    (Idx mod 3) =:= 0,
    !,
    write(C),
    write(' '),
    nl,
    print_board(Cs, 1).
print_board([C | Cs], Idx) :-
    write(C),
    write(' '),
    Idx1 is Idx + 1,
    print_board(Cs, Idx1).

%% Finds free cells
find_free_cells([], []).
find_free_cells([x | Ps], PFs) :- find_free_cells(Ps, PFs).
find_free_cells([o | Ps], PFs) :- find_free_cells(Ps, PFs).
find_free_cells([P | Psa], [P | Psb]) :- find_free_cells(Psa, Psb).

%% Replace
replace_cell(Idx, B, E, Br) :-
    nth0(Idx, B, _, R),
    nth0(Idx, Br, E, R).

%% Player move
player_move(B, P, Br) :-
    print_board(B),
    write('> Next move [X. Y.]: '),
    read(X), read(Y),
    X >= 1, X =< 3,
    Y >= 1, Y =< 3,
    Pos is (X - 1) + 3 * (Y - 1),
    Pos1 is Pos + 1,
    find_free_cells(B, FPs),
    member(Pos1, FPs),
    replace_cell(Pos, B, P, Br).

player_move(B, x, Br) :- player_move(B, x, Br), player_move(Br, o, _).

player_move(B, P, Br) :-
    \+ find_free_cells(B, _),
    !,
    write('!> Cell already occupied.'),
    player_move(B, P, Br).

%player_move(B, P, Br) :-
%    write('!> Cell already occupied.'),
%    player_move(B, P, Br).

%% Win condition patterns
win(X, [X, X, X, _, _, _, _, _, _]).
win(X, [_, _, _, X, X, X, _, _, _]).
win(X, [X, _, _, _, X, _, _, _, X]).
win(X, [_, _, X, _, X, _, X, _, _]).
win(X, [X, _, _, X, _, _, X, _, _]).
win(X, [_, X, _, _, X, _, _, X, _]).
win(X, [_, _, X, _, _, X, _, _, X]).

%% Check win condition
check_win(x, B) :-
    win(x, B),
    writeln('> Player X won!').
check_win(o, B) :-
    win(o, B),
    writeln('> Player O won!').

%% Game turn
turn(B, x) :- player_move(B, x, Br), \+ check_win(x, Br), turn(Br, o).
turn(B, o) :- player_move(B, o, Br), \+ check_win(o, Br), turn(Br, x).

%% Game entry point
start(x) :- turn([1, 2, 3, 4, 5, 6, 7, 8, 9], x).
start(o) :- turn([1, 2, 3, 4, 5, 6, 7, 8, 9], o).