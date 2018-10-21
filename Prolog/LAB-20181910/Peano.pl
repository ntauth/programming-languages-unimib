%% -*- Mode: Prolog -*-

natural(0).
natural(s(N)) :- natural(N).

% n + m = (n + 1) + (m - 1) se m > 0
% n + 0 = n
successor(s(N), N).

sum(N, 0, N).
sum(N, s(M), S) :- sum(N, M, T), successor(S, T).
