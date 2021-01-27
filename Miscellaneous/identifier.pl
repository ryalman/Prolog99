
identifier(Str):- atom_chars(Str,[C|Cs]), letter(C), idf(Cs).

idf([]).
idf([C|Cs]):- letter(C), idf(Cs).
idf([C|Cs]):- dash(C), idf(Cs).
idf([C|Cs]):- digit(C), idf(Cs).

letter(C):-atom(C), \+ digit(C),\+ dash(C).
digit(C):- is_digit(C).
dash('_').
