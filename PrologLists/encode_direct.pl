/*
 */

encode_direct([],[]).
encode_direct([X|Xs],[Y|Ys]):-
  count_(X,Xs,Rs,Y),
  encode_direct(Rs,Ps),
  fix_(Ps,Ys).

count_(X,[],_,[1,X]).
count_(X,[Y|Xs],[Y|Xs],[1,X]):-X \= Y.
count_(X,[X|Xs],[X|Xs],[N,X]):- count_(X,Xs,Xs,[K,X]), N is K + 1.

fix_([],[]).
fix_([[1,X]|Xs],[X|Xs]).
fix_(Xs,Xs).
