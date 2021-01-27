
equation(Xs,[Exp,"=",Target]):-
  select(Target,Xs,Rest),
  enumerate(Rest,[Exp,Target]).


enumerate([X],[X,X]):-!.
enumerate(Xs,Exp):-
  grouping(Xs,G1,G2),
  enumerate(G1,Exp1),
  enumerate(G2,Exp2),
  merge_exp(Exp1,Exp2,Exp).

grouping(Xs,G1,G2):-
  length(Xs,Xsl),
  Glm is Xsl - 1,
  between(1,Glm,G1l),
  G2l is Xsl - G1l,
  length(G1,G1l),
  length(G2,G2l),
  append(G1,G2,Xs).

merge_exp([Exp1,V1],[Exp2,V2],[[Exp1,"+",Exp2],Y]):- Y is V1 + V2.
merge_exp([Exp1,V1],[Exp2,V2],[[Exp1,"-",Exp2],Y]):- Y is V1 - V2.
merge_exp([Exp1,V1],[Exp2,V2],[[Exp1,"*",Exp2],Y]):- Y is V1 * V2.
merge_exp([Exp1,V1],[Exp2,V2],[[Exp1,"/",Exp2],Y]):- 
  \+ V2 is 0,
  0 is mod(V1,V2),
  Y is V1 // V2,!.
