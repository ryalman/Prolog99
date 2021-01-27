
preorder(nil,'').

preorder(t(V,Lv,Rv),S):-
  preorder(Lv,Lvs),
  preorder(Rv,Rvs),
  atom_concat(V,Lvs,Ls),
  atom_concat(Ls,Rvs,S).

inorder(nil,'').

inorder(t(V,Lv,Rv),S):-
  inorder(Lv,Lvs),
  inorder(Rv,Rvs),
  atom_concat(Lvs,V,LVS),
  atom_concat(LVS,Rvs,S).
