/*
 * No need for declerative statements. Pls look encode.pl for the explanation.
 */
:- consult(pack).

encode_modified(Xs,Ys):- pack(Xs,Zs), encode_(Zs,Ys).

encode_([],[]).
encode_([[X]|Xs],[X|Ys]):- encode_(Xs,Ys).
encode_([X|Xs],[Y|Ys]):- 
  length(X,L), 
  X = [F|_], 
  Y = [L,F], 
  encode_(Xs,Ys).  
