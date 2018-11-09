%% -*- Mode: Prolog -*-

remove_chars(S, Ch, Sr) :-
    string_codes(S, Cs),
    char_code(Ch, Chc),
    delete(Cs, Chc, Csr),
    string_codes(Sr, Csr).
