preorder(T,S):-
  nonvar(S),
  preorder_(T,S).

inorder(T,S):-
  nonvar(S),
  inorder_(T,S).

% generate
preorder_(nil,'').
preorder_(t(V,Lv,Rv),S):-
  atom_chars(S,[V|Rest]),
  append(Left,Right,Rest),
  atomic_list_concat(Left,LeftStr),
  atomic_list_concat(Right,RightStr),
  preorder_(Lv,LeftStr),
  preorder_(Rv,RightStr).

inorder_(nil,'').
inorder_(t(V,Lv,Rv),S):-
  atom_chars(S,Chars),
  append(Left,Right,Chars),
  append([V],Rvs,Right),
  atomic_list_concat(Left,LeftStr),
  atomic_list_concat(Rvs,RightStr),
  inorder_(Lv,LeftStr),
  inorder_(Rv,RightStr).



