%% -*- Mode: Prolog -*-

% Facts
lavora_per(giuseppe_simone, andrea_dipre).
lavora_per(sara_tommasi, andrea_dipre).
lavora_per(pasquale_prattico, andrea_dipre).
lavora_per(trucebaldazzi, vendetta_vera).

% Rules
collega(X, Y) :- lavora_per(X, Z), lavora_per(Y, Z), X \= Y.
