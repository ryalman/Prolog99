
isomorphic(graph(Vs,Evs),graph(Ts,Ets),Is):- 
  length(Vs,L), length(Ts,L),
  isomorphic(Vs,Evs,Ts,Ets,Is).

isomorphic(Vs,Evs,Ts,Ets,Is):-
  permutation(Ts,Tsp),
  replace(Vs,Tsp,Evs,Evr,Is),
  unify(Evr,Evru),
  unify(Ets,Etsu),
  subset(Etsu,Evru).

replace([],[],Evs,Evr,[]):-extract(Evs,Evr),!.
replace([V|Vs],[T|Ts],Evs,Evr,[V-T | Is]):-
  swap(V,T,Evs,Evt),
  replace(Vs,Ts,Evt,Evr,Is).

swap(_,_,[],[]):-!.
swap(V,T,[e(V,X) | Es],[[e(V,X),e(T,nil)] | Ys]):- swap(V,T,Es,Ys),!.
swap(V,T,[e(X,V) | Es],[[e(X,V),e(nil,T)] | Ys]):- swap(V,T,Es,Ys),!.
swap(V,T,[[e(V,X),e(nil,Y)] | Es],[[e(V,X),e(T,Y)] | Ys]):- swap(V,T,Es,Ys),!.
swap(V,T,[[e(X,V),e(Y,nil)] | Es],[[e(X,V),e(Y,T)] | Ys]):- swap(V,T,Es,Ys),!.
swap(V,T,[E|Es],[E|Ys]):-swap(V,T,Es,Ys).

extract([],[]):-!.
extract([[_,S] | Es],[S|Ss]):- extract(Es,Ss),!.

unify([],[]):-!.
unify([e(X,Y) | Es],[e(X,Y) | Ys]):- compare((>),Y,X), unify(Es,Ys),!.
unify([e(X,Y) | Es],[e(Y,X) | Ys]):- unify(Es,Ys).
