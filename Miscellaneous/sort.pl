/*
 */

partition(_,_,[],[],[]).
partition(By,P,[X|Xs],[X|Left],Right):- 
  call(By,X,P),
  partition(By,P,Xs,Left,Right).

partition(By,P,[X|Xs],Left,[X|Right]):- 
  partition(By,P,Xs,Left,Right).

quick_sort(_,[],[]):-!.
quick_sort(By,[X|Xs],Ys):-
  partition(By,X,Xs,Left,Right),
  quick_sort(By,Left, Ls),
  quick_sort(By,Right,Rs),
  append(Ls,[X],Lsx),
  append(Lsx,Rs,Ys),!.

by_length(X,Y):- length(X,XL), length(Y,YL), XL < YL.
lsort(X,Y):- quick_sort(by_length,X,Y).

/*
 * For lfsort part of the question, I will first sort the sublists by length 
 * using the quick_sort above.
 * Then I can group them together into further sublists because I know that 
 * sublists with the same length will be side by side.
 * After that I only need to sort them by length again and then unfold the
 * sublists.
 */

lfsort(Xs,Ys):-
  quick_sort(by_length,Xs,Zs),
  pack_length(Zs,Zs1),
  quick_sort(by_length,Zs1,Zs2),
  pack_length(Ys,Zs2).

pack_length([],[]).
pack_length([X],[[X]]).
pack_length([X0,X1|Xs],[[X0|Y]|Ys]):-
  length(X0,L),
  length(X1,L),
  pack_length([X1|Xs],[Y|Ys]),!.

pack_length([X0,X1|Xs],[[X0]|Ys]):-pack_length([X1|Xs],Ys),!.
