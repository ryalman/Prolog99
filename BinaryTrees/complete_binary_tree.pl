
complete_binary_tree(N,T):- cbt(N,1,T).

cbt(N,L,nil):- L > N,!.
cbt(N,L,t(L,Tl,Tr)):-
  Ll is 2 * L,
  Rl is Ll + 1,
  cbt(N,Ll,Tl),
  cbt(N,Rl,Tr).
