
:-[path].

cycle(G,A,P):-path(G,A,A,P),length(P,L),L > 1.

