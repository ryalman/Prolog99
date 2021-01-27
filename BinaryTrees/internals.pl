
internals(nil,[]):-!.
internals(t(_,nil,nil),[]):-!.
internals(t(X,L,R),Is):-
  internals(L,Li),
  internals(R,Ri),
  append(Li,[X|Ri],Is),!.
