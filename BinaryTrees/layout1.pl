
layout_binary_tree(T,PT):-layout(T,PT,0,_,1).

layout(nil,nil,_,0,_).
layout(t(V,L,R),t(V,Xv,Yv,Pl,Pr),Of,T,Yv):-
  Yn is Yv + 1,
  layout(L,Pl,Of,Tl,Yn),
  Xv is Tl + Of + 1,
  layout(R,Pr,Xv,Tr,Yn),
  T is Tl + Tr + 1.
