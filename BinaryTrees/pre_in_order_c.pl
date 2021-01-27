
:-[pre_in_order_b].

pre_in_tree(Pre,In,T):-
  preorder(T,Pre),
  inorder(T,In).
