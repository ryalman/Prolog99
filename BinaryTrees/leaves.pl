
leaves(nil,[]):-!.
leaves(t(X,nil,nil),[X]).
leaves(t(_,L,R),Leaves):-
  leaves(L,Ll),
  leaves(R,Rl),
  append(Ll,Rl,Leaves),!.
