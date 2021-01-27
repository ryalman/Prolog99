
degree(graph(Vs,Es), V, D):- 
  member(V,Vs),
  edges(V,Es,Ves),
  sort(Ves,SVes),
  length(SVes,D),!.

edges(_,[],[]):-!.
edges(V,[e(X,V) | Es],[e(V,X) | Rs]):- edges(V,Es,Rs),!.
edges(V,[e(V,X) | Es],[e(V,X) | Rs]):- edges(V,Es,Rs),!.
edges(V,[_ | Es], Rs) :- edges(V,Es,Rs),!.

sort_degree(Graph,Ns):- 
  node_degree(Graph,VDs),
  predsort(by_degree,VDs,SVD),
  extract_nodes(SVD,Ns),!.

node_degree(graph([],_),[]):-!.
node_degree(graph([V|Vs],Es),[nd(V,D) | Ds]):-
  degree(graph([V|Vs],Es),V,D),
  node_degree(graph(Vs,Es),Ds),!.

by_degree(<,nd(_,D1),nd(_,D2)):- D1 > D2,!.
by_degree(>,nd(_,D1),nd(_,D2)):- D1 =< D2,!.

extract_nodes([],[]):-!.
extract_nodes([nd(N,_) | Ns],[N | Rs]):- extract_nodes(Ns,Rs),!.

w_powel(graph(Vs,Es),CL):-
  sort_degree(graph(Vs,Es),Ns),
  colors(Ns,Vs,Vs,Es,1,[],[],CL),!.

colors([],_,_,_,_,_,_,[]):-!.
colors([N | Ns],[],Avs,Es,C,Clrd,_,[(N,C) | Cs]):-
  \+ member(N,Clrd),
  Cn is C + 1,
  colors(Ns,Avs,Avs,Es,Cn,Clrd,[],Cs),!.

colors([_ | Ns],[],Avs,Es,C,Clrd,_,Cs):- 
  Cn is C + 1,
  colors(Ns,Avs,Avs,Es,Cn,Clrd,[],Cs),!.

colors([N|Ns],[V|Vs],Avs,Es,C,Clrd,Vst,[(V,C) | Cs]):-
  \+ neighbor(V,N,Es),
  \+ member(V,Clrd),
  \+ neighbor(V,Vst,Es),
  colors([N|Ns],Vs,Avs,Es,C,[V|Clrd],[V|Vst],Cs),!.

colors(Ns,[_|Vs],Avs,Es,C,Clrd,Vst,Cs):- colors(Ns,Vs,Avs,Es,C,Clrd,Vst,Cs),!.


neighbor(V,[N|_],Es):-neighbor(V,N,Es),!.
neighbor(V,[_|Ns],Es):-neighbor(V,Ns,Es),!.
neighbor(V,N,[e(V,N) |_]):-!.
neighbor(V,N,[e(N,V) |_]):-!.
neighbor(V,N,[_|Es]):-neighbor(V,N,Es),!.
