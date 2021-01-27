
tree(Str,Tree):-
  nonvar(Str),
  atom_chars(Str,Chars),
  tree(Tree,Chars,[],_),!.

tree(Str,Tree):-
  nonvar(Tree),
  tree_str(Tree,Chars,['^']),
  atomic_list_concat(Chars,Str),!.

tree(t(V,Fs),[V|Vs],Ps,Rest):-
  forest(Fs,Vs,[V|Ps],Rest).

forest([],[],_,[]):-!.
forest([],['^'|Vs],_,Vs):-!.
forest([T|Ts],Ns,Ps,Rest):-
  tree(T,Ns,Ps,Rem),
  forest(Ts,Rem,Ps,Rest),!.

tree_str(t(V,Fs),[V|Vs],Ds):-
  forest_str(Fs,Vs,Ds),!.

forest_str([],Ds,Ds):-!.
forest_str([T|Ts],Vs,Ds):-
  tree_str(T,Tv,['^']),
  forest_str(Ts,Vss,Ds),
  append(Tv,Vss,Vs),!.
