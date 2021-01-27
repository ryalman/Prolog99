 
pack([],[]).
pack([X],[[X]]).
pack([X,X | Xs],[[X|Ws]|Ys]):- pack([X|Xs],[Ws|Ys]),!.
pack([X,Y | Xs],[[X]|Ys]):- X \= Y, pack([Y|Xs],Ys).
