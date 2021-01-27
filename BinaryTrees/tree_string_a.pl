tree_to_string(t(V,nil,nil),V):-!.
tree_to_string(nil,''):-!.
tree_to_string(t(V,L,R),Ts):-
  tree_to_string(L,Ls),
  tree_to_string(R,Rs),
  atomic_list_concat([V,'(',Ls,',',Rs,')'],Ts).

string_to_tree(Str,Tr):-
  atom(Str),
  string_chars(Str,Chars),
  string_to_tree(Chars,Tr,_),!.

string_to_tree([],_,[]).
string_to_tree([','|Chs],nil,Chs).
string_to_tree([')'|Chs],nil,Chs).

string_to_tree(['('|Chs],Ts,Rst):- string_to_tree(Chs,Ts,Rst).

string_to_tree([V|Chs],Ts, Rest):- string_to_tree(V,Ts, Chs,Rest).

string_to_tree(V, t(V,nil,nil), [','|Chs],Chs).
string_to_tree(V, t(V,L,R),Chs,Rst):-
  string_to_tree(Chs,L,Rl),
  string_to_tree(Rl,R,Rst).

tree_string(Tree,String):- nonvar(Tree), tree_to_string(Tree,String),!.

tree_string(Tree,String):- nonvar(String), string_to_tree(String,Tree),!.
