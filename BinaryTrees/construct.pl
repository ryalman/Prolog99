
:-ensure_loaded(symmetric).

add(nil,N,t(N,nil,nil)):-!.
add(t(X,L,R),N,t(X,Ln,R)):- N < X, add(L,N,Ln),!.
add(t(X,L,R),N,t(X,L,Rn)):- add(R,N,Rn),!.

construct([],R,R).
construct([N|Ns],R,T):-
  add(R,N,Rn),
  construct(Ns,Rn,T).

construct(Ns,T):-construct(Ns,nil,T).

test_symmetric(Ns):-construct(Ns,T),symmetric(T).
