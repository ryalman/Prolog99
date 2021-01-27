/*
 */


slice([X|_],1,1,[X]).
slice([X|Xs],1,T,[X|Ys]):- T > 1, K is T - 1, slice(Xs,1,K,Ys).
slice([_|Xs],S,T,Ys):- 
  S > 1, 
  S1 is S - 1,
  T > 1,
  T1 is T - 1,
  slice(Xs, S1, T1, Ys).
