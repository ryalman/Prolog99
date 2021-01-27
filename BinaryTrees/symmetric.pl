
mirror(nil,nil).
mirror(t(_,L1,R1),t(_,L2,R2)):-mirror(L1,R2), mirror(R1,L2).

symmetric(nil).
symmetric(t(_,L,R)):-mirror(L,R).
