count_leaves(nil,0):-!.
count_leaves(t(_,nil,nil),1):-!.
count_leaves(t(_,L,R),Ls):-
  count_leaves(L,Ll),
  count_leaves(R,Rl),
  Ls is Ll + Rl,!.
