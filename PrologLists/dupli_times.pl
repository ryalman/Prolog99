/*
 */

dupli([],_,[]).
dupli(Xs,N,Ys):- dupli_(Xs,N,N,Ys).

dupli_([],_,_,[]).
dupli_([_|Xs],N,0,Ys):- dupli_(Xs,N,N,Ys).
dupli_([X|Xs],N,K,[X|Ys]):- K > 0, L is K - 1, dupli_([X|Xs],N,L,Ys).
