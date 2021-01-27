
depth_first(graph(Vs,Es),S,Ns):- member(S,Vs), depth_first(S,Es,Ns,[]),!.

depth_first(S,_,[],Vst):- atom(S), member(S,Vst),!.

depth_first(S,Es,[S | Ns],Vst):-
  atom(S),
  neighbors(S,Es,Vs,Vst),
  depth_first(Vs,Es,Ns,[S|Vst]),!.

depth_first([],_,[],_):-!.
depth_first([V|Vs],Es,Ns,Vst):-
  depth_first(V,Es,VNs,Vst),
  append(Vst,VNs,Avst),
  depth_first(Vs,Es,VSNs,Avst),
  append(VNs,VSNs,Ns),!.

neighbors(_,[],[],_):-!.

neighbors(S,[e(S,X) | Es],[X|Ns],Vst):- neighbors(S,Es,Ns,Vst),!.

neighbors(S,[e(X,S) | Es],[X|Ns],Vst):- 
  \+ member(X,Vst), 
  neighbors(S,Es,Ns,Vst),!.

neighbors(S,[_|Es],Ns,Vst):- neighbors(S,Es,Ns,Vst),!.
