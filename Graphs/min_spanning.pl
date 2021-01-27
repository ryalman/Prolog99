
m_tree(graph(Vs,Es),Tree,Sum):-
  a_node(Vs,R),
  m_tree(R,Es,Tree,Sum,[],_).

m_tree(V,Es,t(V,Vs),Sum,VstIn,VstOut):-
  children(V,Es,[V|VstIn],UChs),
  predsort(by_label,UChs,SChs),
  m_tree(SChs,Vs,Es,Sum,[V|VstIn],VstOut),!.

m_tree([],[],_,0,Vst,Vst):-!.

m_tree([e(_,X,_)|Es],Ts,Ns,Sum,VstIn,VstOut):-
  member(X,VstIn),
  m_tree(Es,Ts,Ns,Sum,VstIn,VstOut),!.
  
m_tree([e(_,X,L)|Es],[T|Ts],Ns,Sum,VstIn,VstOut):-
  m_tree(X,Ns,T,LSum,VstIn,TVst),
  m_tree(Es,Ts,Ns,NSum,TVst,VstOut),
  Sum is LSum + NSum + L,!.

children(_,[],_,[]):-!.

children(R,[e(R,X,L) | Es],Vst, [e(R,X,L) | Xs]):-
  \+ member(X,Vst),
  children(R,Es,Vst,Xs),!.

children(R,[e(X,R,L) | Es],Vst,[e(R,X,L)|Xs]):-
  \+ member(X,Vst),
  children(R,Es,Vst,Xs),!.

children(R,[_|Es],Vst,Xs):- children(R,Es,Vst,Xs),!.

by_label(<,e(_,_,L1),e(_,_,L2)):- L1 < L2.
by_label(>,e(_,_,L1),e(_,_,L2)):- L1 >= L2.

a_node(Ns,N):- append(_,[N|_],Ns).
