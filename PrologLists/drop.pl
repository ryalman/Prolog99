/**/

drop(Xs,N,Ys):- drop_(Xs,N,N,Ys).

drop_([],_,_,[]).
drop_([_|Xs],N,1,Ys):- drop_(Xs,N,N,Ys).
drop_([X|Xs],N,K,[X|Ys]):- K > 1, L is K - 1, drop_(Xs,N,L,Ys).
