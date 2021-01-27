/*
 */
split(Xs,0,[],Xs).
split([X|Xs],N,[X|L1],L2):- K is N - 1, split(Xs,K,L1,L2).
