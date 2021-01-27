/*
 */
[remove_at].


rnd_select(_,0,[]).
rnd_select(X,N,[Y|Ys]):- 
  length(X,U), 
  random_between(1,U,I), 
  remove_at(Y,X,I,R),
  N1 is N - 1,
  rnd_select(R,N1,Ys).
