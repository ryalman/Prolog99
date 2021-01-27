/*
 */

remove_at(_,[],_,[]).
remove_at(X,[X|Xs],1,Xs).
remove_at(Y,[X|Xs],N,[X|Ys]):- N > 1, K is N - 1, remove_at(Y,Xs,K,Ys).
