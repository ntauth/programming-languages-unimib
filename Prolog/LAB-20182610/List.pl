%% -*- Mode: Prolog -*-

%% Find the minimum of a list
list_min([H], H).
list_min([H | T], H) :- list_min(T, X), X >= H.
list_min([H | T], X) :- list_min(T, X), X < H.

%% Remove a single occurence of an element in a list
list_remove([], _, []).
list_remove([H | T], H, T).
list_remove([H | T], NH, [H | T1]) :- NH \= H, list_remove(T, NH, T1).

%% Selection Sort
list_selesort([], []).
list_selesort(L, [H | T]) :-
    list_min(L, H),
    list_remove(L, H, L1),
    list_selesort(L1, T).

%% Merge Sort
%% Merge Helper
merge([], L, L).
merge(L, [], L).
merge([Ha | Ta], [Hb | Tb], Ma) :-
    Ha =< Hb,
    merge(Ta, [Hb | Tb], Mb),
    Ma = [Ha | Mb].
merge([Ha | Ta], [Hb | Tb], Ma) :-
    Hb < Ha,
    merge(Tb, [Ha | Ta], Mb),
    Ma = [Hb | Mb].		       

list_length(L, Len) :- list_length_(L, 0, Len).
list_length_([], Len, Len).
list_length_([_ | T], Acc, Len) :- Acc1 is Acc + 1, list_length_(T, Acc1, Len).

list_sublist(L, Beg, End, Sl) :- list_sublist_(L, Beg, End, 0, Sl).
list_sublist_([], _, _, _, []).
list_sublist_([_ | T], Beg, End, Ctr, Sl) :-
    Ctr < Beg,
    CtrInc is Ctr + 1,
    list_sublist_(T, Beg, End, CtrInc, Sl).
list_sublist_(_, _, End, Ctr, []) :-
    Ctr > End.
list_sublist_([H | Ta], Beg, End, Ctr, [H | Tb]) :-
    CtrInc is Ctr + 1,
    list_sublist_(Ta, Beg, End, CtrInc, Tb).
    
list_split(L, Pivot, [Sla, Slb]) :-
    list_length(L, Len),
    Pivot < Len,	       
    Beg is Pivot + 1,
    End is Len - 1,
    list_sublist(L, 0, Pivot, Sla),
    list_sublist(L, Beg, End, Slb).

%% Mergesort Call
list_mergesort([], []).
list_mergesort(L, M) :-
    list_length(L, Len),
    LenDec is Len - 1,
    Mid is LenDec // 2,
    list_split(L, Mid, [La, Lb]),
    list_mergesort(La, Ma),
    list_mergesort(Lb, Mb),
    merge(Ma, Mb, M).
