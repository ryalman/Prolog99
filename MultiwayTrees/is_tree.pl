istree(nil):-!.
istree(t(_,[])):-!.
istree(t(_,TS)):- isforest(TS),!.

isforest([]):-!.
isforest([T|Ts]):- istree(T), isforest(Ts),!.
