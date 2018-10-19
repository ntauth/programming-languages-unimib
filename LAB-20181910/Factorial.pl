%% -*- Mode: Prolog -*-

natural(0).
natural(s(N)) :- natural(N).

successor(s(N), N).

sum(N, 0, N).
sum(N, s(M), S) :- sum(N, M, T), successor(S, T).

product(_, 0, 0).
product(N, 1, N).
product(N, s(M), P) :- product(N, M, Pp), sum(Pp, N, P).

factorial(s(0), 0).
factorial(F, s(N)) :- factorial(Fp, N), product(Fp, s(N), F).








