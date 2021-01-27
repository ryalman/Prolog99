path(graph(Vs,Es),A,B,P):-
  member(A,Vs),
  member(B,Vs),
  path(Es,A,B,P).

path(_,A,A,[A]).
path(Es,A,B,[A|Ps]):-
  edges(Es,A,X,Rest),
  path(Rest,X,B,Ps).

edges(Es,A,X,Rest):- 
  append(Head,[e(A,X) | Tail],Es),
  append(Head,Tail,Rest).

edges(Es,A,X,Rest):-
  append(Head,[e(X,A) | Tail],Es),
  append(Head,Tail,Rest).
