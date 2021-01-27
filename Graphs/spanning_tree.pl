s_tree(graph(Vs,Es),Tree):-
  a_node(Vs,R),
  s_tree(R,Es,Tree).

s_tree(R,Es,Tree):-s_tree(R,Es,Tree,[],_).

s_tree(R,Es,t(R,Ns),Vst,VstAll):-
  children(R,Es,Chs,[R|Vst]),
  sub_trees(Chs,Es,St,[R|Vst],VstAll),
  sort(St,Ns).

children(_,[],[],_):-!.

children(R,[e(R,X) | Es],[X|Xs],Vst):-
  \+ member(X,Vst),
  children(R,Es,Xs,Vst),!.

children(R,[e(R,X) | Es], Xs,Vst):-
  member(X,Vst),
  children(R,Es,Xs,Vst),!.

children(R,[e(X,R) | Es],[X|Xs],Vst):-
  \+ member(X,Vst),
  children(R,Es,Xs,Vst),!.

children(R,[e(X,R) | Es], Xs,Vst):-
  member(X,Vst),
  children(R,Es,Xs,Vst),!.

children(R,[_|Es], Xs,Vst):-
  children(R,Es,Xs,Vst),!.

sub_trees([],_,[],Vst,Vst).

sub_trees([C|Chs],Es,Ns,Vst,VstAll):-
  member(C,Vst),
  sub_trees(Chs,Es,Ns,Vst,VstAll).

sub_trees(Chs,Es,[N|Ns],Vst,VstAll):-
  a_child(Chs,Ch,Rest),
  s_tree(Ch,Es,N,Vst,Vstc),
  sub_trees(Rest,Es,Ns,Vstc,VstAll).

a_node(Vs,R):- append(_,[R|_],Vs).
a_child(Chs,C,Rest):-
  append(Head,[C|Tail],Chs),
  append(Head,Tail,Rest).


is_tree(graph(Vs,Es)):-
  findall(T,s_tree(graph(Vs,Es),T),Ts),
  sort(Ts,Tss),
  length(Tss,L),
  length(Vs,Vsl),
  L is Vsl.

is_connected(graph(Vs,Es)):- 
  s_tree(graph(Vs,Es),T),!,
  nodes(T,Ns),
  length(Vs,VL),
  Ns = VL.


nodes(t(_,Ns),N):-
  nodes(Ns,Nns),
  N is Nns + 1,!.

nodes([],0):-!.

nodes([N|Ns],Nc):-
  nodes(Ns,Nnc),
  nodes(N,X),
  Nc is X + Nnc,!.

