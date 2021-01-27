
nnodes(nil,0).
nnodes(t(_,Ts),N):-nnodes(Ts,K), N is K + 1.

nnodes([],0).
nnodes([T|Ts],K):-nnodes(T,Tk), nnodes(Ts,Tsk),K is Tk + Tsk.
