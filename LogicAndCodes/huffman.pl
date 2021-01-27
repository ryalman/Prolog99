/*
 */

by_fr(<,fr(_,X1),fr(_,X2)):- X1 =< X2,!.
by_fr(>,fr(_,X1),fr(_,X2)):- X1 > X2,!.

combine(n(F1,C1,L1,R1),n(F2,C2,L2,R2),n(F,nil,n(F1,C1,L1,R1),n(F2,C2,L2,R2))):-
  F is F1 + F2.

leaves([],[]).
leaves([fr(C,X)|Frs],[n(X,C,nil,nil)|Ls]):- leaves(Frs,Ls).

huff_tree([],[R],R):-!.
huff_tree([n(F1,C1,nil,nil),n(F2,C2,nil,nil)|Ns],[],R):-
  combine(n(F1,C1,nil,nil),n(F2,C2,nil,nil),Y),
  huff_tree(Ns,[Y],R),!.

huff_tree([n(F1,C1,L1,R1),n(F2,C2,L2,R2)|Ns],[n(F3,C3,L3,R3)|Ys],R):-
  F3 > F2,
  combine(n(F1,C1,L1,R1),n(F2,C2,L2,R2),Y),
  append([n(F3,C3,L3,R3)|Ys],[Y],Yss),
  huff_tree(Ns,Yss,R),!.

huff_tree([n(F1,C1,L1,R1)|Ns],[n(F2,C2,L2,R2),n(F3,C3,L3,R3)|Ys],R):-
  F1 > F3,
  combine(n(F2,C2,L2,R2),n(F3,C3,L3,R3),Y),
  append(Ys,[Y],Yss),
  huff_tree([n(F1,C1,L1,R1)|Ns],Yss,R),!.

huff_tree([n(F1,C1,L1,R1),n(F2,C2,L2,R2)|Ns],
[n(F3,C3,L3,R3),n(F4,C4,L4,R4)|Ys],R):-
  F4 > F1,
  F2 > F3,
  F3 > F1,
  combine(n(F1,C1,L1,R1),n(F3,C3,L3,R3),Y),
  append([n(F4,C4,L4,R4)|Ys],[Y],Yss),
  huff_tree([n(F2,C2,L2,R2)|Ns],Yss,R),!.


huff_tree([n(F1,C1,L1,R1),n(F2,C2,L2,R2)|Ns], [n(F3,C3,L3,R3),n(F4,C4,L4,R4)|Ys],R):-
  F4 > F1,
  F2 > F3,
  F1 >= F3,
  combine(n(F3,C3,L3,R3),n(F1,C1,L1,R1),Y),
  append([n(F4,C4,L4,R4)|Ys],[Y],Yss),
  huff_tree([n(F2,C2,L2,R2)|Ns],Yss,R),!.

huff_tree([n(F1,C1,L1,R1)],[n(F2,C2,L2,R2)],R):-
  F1 =< F2,
  combine(n(F1,C1,L1,R1),n(F2,C2,L2,R2),Y),
  huff_tree([],[Y],R),!.

huff_tree([N1],[N2],R):-
  cobmine(N2,N1,Y),
  huff_tree([],[Y],R),!.

huff_tree([],(N1,N2|Ys),R):-
  combine(N1,N2,Y),
  append(Ys,[Y],Yss),
  huff_tree([],Yss,R),!.

huff_tree([N1,N2|Ns],[],R):-
  combine(N1,N2,Y),
  huff_tree(Ns,[Y],R),!.

encode(n(_,C,nil,nil),Bits,[hc(C,Bits)]):-!.
encode(n(_,nil,L,R),Bits,Ys):-
  atom_concat(Bits,'0',Bits0),
  atom_concat(Bits,'1',Bits1),
  encode(L,Bits0,Yl),
  encode(R,Bits1,Yr),
  append(Yl,Yr,Ys),!.

huffman(Frs,Hs):-
  predsort(by_fr,Frs,Ns),
  leaves(Ns,Ls),
  huff_tree(Ls,[],R),
  encode(R,'',Es),
  sort(Es,Hs).
