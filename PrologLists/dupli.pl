/**/

dupli([],[]).
dupli([X|Xs],[X,X|Ys]):-dupli(Xs,Ys).
