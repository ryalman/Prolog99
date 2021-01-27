
:-[depth_first].

connected(graph(Vs,Es),Cs):- connected(Vs,Es,[],Cs),!.

connected([],_,_,[]):-!.
connected([V|Vs],Es,Vst,[Ns|Nss]):-
  \+ member(V,Vst),
  depth_first(V,Es,Ns,[]),
  append(Vst,Ns,Avst),
  connected(Vs,Es,Avst,Nss),!.

connected([_|Vs],Es,Vst,Ns):- connected(Vs,Es,Vst,Ns),!.


