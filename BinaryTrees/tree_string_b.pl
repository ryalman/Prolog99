diff([_|X],X):-!.

tree_string(T,S):-
  nonvar(T),
  tree_dlist(T,diff(St,[])),
  atomic_list_concat(St,S),!.

tree_string(T,S):-string_chars(S,Chrs),tree_dlist(T,diff(Chrs,[])),!.

tree_dlist(t(V,nil,nil),diff([V | Rest],Rest)).

tree_dlist(t(V,Lv,nil),diff([V,'(' | LeftRight],Rest)):-
  tree_dlist(Lv,diff(LeftRight,[',',')' | Rest])),!.

tree_dlist(t(V,nil,Rv),diff([V,'(',','| LeftRight],Rest)):-
  tree_dlist(Rv,diff(LeftRight,[')' | Rest])),!.

tree_dlist(t(V,Lv,Rv),diff([V,'(' | LeftRight],Rest)):-
  tree_dlist(Lv,diff(LeftRight,[',' | Right])),
  tree_dlist(Rv,diff(Right,[')' | Rest])),!.
