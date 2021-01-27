:- ensure_loaded(hbal_tree).

min_nodes(0,0,0,1):-!.
min_nodes(H,N,X,Y):-
  H1 is H - 1,
  min_nodes(H1,N1,X1,X),
  Y is X1 + X,
  N is N1 + X,!.

minNodes(H,N):-min_nodes(H,N,_,_),!.

maxNodes(H,N):- N is (2 ** H) - 1,!.


minHeight(0,0):-!.
minHeight(N,H):- N > 0, N1 is N // 2, minHeight(N1,H1), H is H1 + 1,!.

maxHeight(N,H):-
  minHeight(N,M),
  Mx is M + 1,
  maxHeight(N,M,Mx,H),!.

maxHeight(N,M,Mx,M):- 
  minNodes(Mx,Mn),
  Mn > N,!.

maxHeight(N,_,Mx,H):- Mx1 is Mx + 1,  maxHeight(N,Mx,Mx1,H),!.

length_tree(nil,0):-!.
length_tree(t(_,L,R),X):-
  length_tree(L,Ll),
  length_tree(R,Rl),
  X is Ll + Rl + 1,!.

hbal_tree_nodes(N,T):-
  minHeight(N,Min),
  maxHeight(N,Max),
  between(Min,Max,H),
  hbal_tree(H,T),
  length_tree(T,N).

count_of_trees(N,L):- bagof(T,hbal_tree_nodes(N,T),Ts),length(Ts,L),!.
