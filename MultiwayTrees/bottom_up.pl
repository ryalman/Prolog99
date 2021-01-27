
bottom_up(t(V,Ts),Seq):-
  bottom_up(Ts,TSeq),
  append(TSeq,[V],Seq).

bottom_up([],[]).
bottom_up([T|Ts],Seq):-
  bottom_up(T,TSeq),
  bottom_up(Ts,TSSeq),
  append(TSeq,TSSeq,Seq).
  
