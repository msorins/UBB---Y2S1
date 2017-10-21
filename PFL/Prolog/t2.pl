gcd(A, A, A) :-
	!.

gcd(A, B, Res) :-
	( A > B ->
		A2 is A - B,
		gcd(A2, B, Res)
		;
		B2 is B - A,
		gcd(A, B2, Res)
	).

lca(A, B, Res) :-
	gcd(A, B, R),
	Res is (A * B) / R.

lca_list([], Lca, Lca) :-
	!.

lca_list([Head|Tail], Lca, Res):-
	lca(Lca, Head, Y),
	lca_list(Tail, Y, Res). 

lca_list_wrap([Head|Tail], Res) :-
	Lca is Head,
	lca_list(Tail, Lca, Res).