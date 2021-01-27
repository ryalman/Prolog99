/*
 */

:- [combination].

group3(X,G1,G2,G3):-
  combination(2,X,G1),
  delete_all(X,G1,X1),
  combination(3,X1,G2),
  delete_all(X1,G2,X2),
  combination(4,X2,G3).



group([],_,[]):- !.
group(_,[],[]):-!.
group(Xs,[N|Ns],[G|Gs]):-
  combination(N,Xs,G),
  subtract(Xs,G,Rs),
  group(Rs,Ns,Gs).
  
/*
 * bagof(Gs,group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs),Gss), length(Gss,X).
 * .......
 * X = 756
 */

