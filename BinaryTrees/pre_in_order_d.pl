
pre_in_tree(Ins,Pres,T):-
  atom_chars(Ins,In),
  atom_chars(Pres,Pre),
  pre_in_tree_dl(In-[],Pre-[],T).


pre_in_tree_dl(ILR-ILR,PLR-PLR,nil).
pre_in_tree_dl(ILR-IRest,[V|PLR]-PRest,t(V,Lv,Rv)):-
  pre_in_tree_dl(ILR-[V|IRight],PLR-PRight,Lv),
  pre_in_tree_dl(IRight-IRest,PRight-PRest,Rv).

