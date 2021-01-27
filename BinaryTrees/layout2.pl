
layout_with_offset(nil,nil,_,Xv,_,Xv).
layout_with_offset(t(V,L,R),t(V,Xv,Y,Pl,Pr),Y,Xv,D,Off):-
  Dn is D // 2,
  Yn is Y + 1,
  layout_with_offset(L,Pl,Yn,Xl,Dn,Off),
  Xv is Xl + Dn,
  Xr is Xv + Dn,
  layout_with_parent(R,Pr,Yn,Xr,Dn).

layout_with_parent(nil,nil,_,_,_).
layout_with_parent(t(V,L,R),t(V,Xv,Y,Pl,Pr),Y,Xv,D):-
  Dn is D // 2,
  Xl is Xv - Dn,
  Xr is Xv + Dn,
  Yn is Y + 1,
  layout_with_parent(L,Pl,Yn,Xl,Dn),
  layout_with_parent(R,Pr,Yn,Xr,Dn).

max_distance(nil,0).
max_distance(t(_,L,R),D):-
  max_distance(L,Dl),
  max_distance(R,Dr),
  D is max(1,2 * max(Dl,Dr)).

layout_binary_tree(T,Pt):- max_distance(T,D), layout_with_offset(T,Pt,1,_,D,0).
