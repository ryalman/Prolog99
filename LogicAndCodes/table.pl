
and(A,B):- A, B.

or(A,_):-A.
or(_,B):-B,!.

nand(A,B):- \+ and(A,B).

nor(A,B):- \+ or(A,B).

xor(A,B):- \+ A, B.
xor(A,B):- A, \+ B.

equ(A,B):- \+ xor(A,B).

impl(A,B):- or(\+ A,B).

bind(true).
bind(fail).

table(A,B,E):-
  bind(A),
  bind(B),
  write_row(A,B,E),fail.

write_row(A,B,_):- writef("%t\t%t\t",[A,B]).
write_row(_,_,E):- E,!, writef("%t\n",[true]).
write_row(_,_,_):- writef("%t\n",[fail]).

:-op(500,xfy,and).
:-op(500,xfy,or).
:-op(500,fx,nand).
:-op(500,fx,nor).
:-op(1200,xfy,equ).
:-op(500,xfy,xor).
:-op(500,xfy,impl).
:-op(499,fx,not).

table(Vs,E):-
  bind_table(Vs),
  write_row(Vs,E),fail.

bind_table([]).
bind_table([V|Vs]):-
  bind(V),
  bind_table(Vs).

write_row([],E):-
  E,
  writef("%t\n",[true]).

write_row([R|Rs],E):-
  writef("%t\t",[R]),
  write_row(Rs,E).
