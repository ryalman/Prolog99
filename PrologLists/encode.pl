/*
 * A run length encoded list is a list of pairs [l,c] where l is the length of
 * the sublist in the packed version of the given list.
 */

:- consult(pack).

encode(Xs,Ys):- pack(Xs,Zs), encode_(Zs,Ys).

encode_([],[]).
encode_([X|Xs],[Y|Ys]):- 
  length(X,L), 
  X = [F|_], 
  Y = [L,F], 
  encode_(Xs,Ys).  
