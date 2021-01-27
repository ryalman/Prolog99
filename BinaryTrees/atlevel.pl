
atlevel(nil,_,[]).
atlevel(t(X,_,_),1,[X]):-!.
atlevel(t(_,L,R),N,Ls):- 
  N > 1,
  Nn is N - 1,
  atlevel(L,Nn,Nls),
  atlevel(R,Nn,Nrs),
  append(Nls,Nrs,Ls).
