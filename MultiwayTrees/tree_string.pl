
tree(t(V,Ts),S):-
  atom_concat('^',Rs,S),

tree(t(V,TS),S):-
  atom_concat(V,Vs,S),
  tree(Ts,Vs).
