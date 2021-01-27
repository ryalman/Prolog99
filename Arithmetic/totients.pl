
:- ensure_loaded(totient_phi).
:- ensure_loaded(phi).

:- writeln("With totient_phi").
:- time(_ is totient_phi(10090)).
:- writeln("With phi").
:- time(_ is phi(10090)).
