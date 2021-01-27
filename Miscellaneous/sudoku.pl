
:-use_module(library(clpfd)).

sudoku(Rows):-
  length(Rows,9),
  maplist(same_length(Rows),Rows),
  maplist(in_range, Rows),
  maplist(all_distinct,Rows),
  transpose(Rows,Cols),
  maplist(all_distinct,Cols),
  regions(Rows,Rs),
  maplist(all_distinct,Rs),
  maplist(label,Rows),
  maplist(portray_clause,Rows).

regions([],[]):-!.
regions([[],[],[] | Rs],Rgs):- regions(Rs,Rgs),!.
regions([[X1,X2,X3 |R1],
         [X4,X5,X6 |R2],
         [X7,X8,X9 |R3] |Rs],
         [[X1,X2,X3,X4,X5,X6,X7,X8,X9] | Rgs]):-
  regions([R1,R2,R3 | Rs], Rgs),!.

in_range(Row):- Row ins 1..9,!.
