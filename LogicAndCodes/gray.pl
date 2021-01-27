/*
 */

:- table gray/2.

gray(1,[[0],[1]]):-!.
gray(N,C):-
  N1 is N - 1,
  gray(N1,C1),
  reflect(C1,R1),
  push(0,C1,C0),
  push(1,R1,R2),
  append(C0,R2,C),!.

reflect([],[]).
reflect([C|Cs],[R|Rs]):-
  switch_bits(C,R),
  reflect(Cs,Rs).

switch_bits([],[]).
switch_bits([0|Cs],[1|Rs]):-
  switch_bits(Cs,Rs).
switch_bits([1|Cs],[0|Rs]):-
  switch_bits(Cs,Rs).

push(_,[],[]).
push(N,[C|Cs],[[N|C]|Rs]):-
  push(N,Cs,Rs).
