
layout_binary_tree(T,Pt):- 
  layout(T,Pd,_),
  coords(Pd,Po,0,1),
  offset(Po,1,Min),
  Off is 1 + (Min * (-1)),
  fix(Po,Off,Pt).

layout(V,nil,nil,t(V,nil,nil,1),1):-!.

layout(V,L,nil,t(V,Pl,nil,D),D):-layout(L,Pl,D),!.

layout(V,nil,R,t(V,nil,Pr,D),D):-layout(R,Pr,D),!.

layout(V,t(Vl,Ll,Rl),t(Vr,Lr,Rr),t(V,Pl,Pr,D),D):-
  layout(t(Vl,Ll,Rl),Pl,Dl),
  layout(t(Vr,Lr,Rr),Pr,Dr),
  distance(Rl,Lr,Dr,Dl,D).

layout(nil,nil,1):-!.

layout(t(V,L,R),Pt,D):- layout(V,L,R,Pt,D).

distance(nil,_,Dr,Dl,D):- D is max(Dl,Dr),!.
distance(_,nil,Dr,Dl,D):- D is max(Dl,Dr),!.
distance(_,_,Dl,Dr,D):- D is 2 * max(Dl,Dr),!.

coords(nil,nil,_,_):-!.
coords(t(V,L,R,D),t(V,X,Y,Pl,Pr),X,Y):-
  Yn is Y + 1,
  Xl is X - D,
  Xr is X + D,
  coords(L,Pl,Xl,Yn),
  coords(R,Pr,Xr,Yn).

offset(nil,Off,Off).
offset(t(_,Xv,_,L,R),Min,Off):-
  Minl is min(Xv,Min),
  offset(L,Minl,Offl),
  offset(R,Offl,Off).

fix(nil,_,nil):-!.
fix(t(V,Xv,Yv,L,R),Off,t(V,Xvn,Yv,Pl,Pr)):-
  Xvn is Xv + Off,
  fix(L,Off,Pl),
  fix(R,Off,Pr).
