:-ensure_loaded(cbal_tree).
:-ensure_loaded(symmetric).


sym_cbal_trees(N,Ts):- setof(X,sym_balanced(N,X),Ts).

sym_balanced(N,X):- cbal_tree(N,X), symmetric(X).

how_many_sym(N,L):-
  sym_cbal_trees(N,Ts), length(Ts,L).
