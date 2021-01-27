
tree_dotstring(T,S):-
  nonvar(S),
  atom_chars(S,Chars),
  tree_dotstring_dl(T,Chars-[]),!.

tree_dotstring(T,S):-
  nonvar(T),
  tree_dotstring_dl(T,Chars-[]),
  atomic_list_concat(Chars,S),!.

tree_dotstring_dl(nil,['.'|Rest]-Rest):-!.
tree_dotstring_dl(t(V,Lv,Rv),[V|LR]-Rest):-
  tree_dotstring_dl(Lv,LR-Right),
  tree_dotstring_dl(Rv,Right-Rest),!.
