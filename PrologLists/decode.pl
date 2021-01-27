/*
 */

decode([],[]).
decode([X|Xs],[X|Ys]):- \+ is_list(X), decode(Xs,Ys).
decode([[N,_]|Xs],Ys):- N is 0, decode(Xs,Ys).
decode([[N,C]|Xs],[C|Ys]):- N > 0, K is N - 1, decode([[K,C]|Xs],Ys).

