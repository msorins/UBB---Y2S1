% suma(L-list, C-collector, R-output)
% flow suma(I, I, O)

suma([], C, C).

suma([H|T], C, R) :-
	C2 is C + H,
	suma(T, C2, R).


% ==========================

produs([], C, C).

produs([H|T], C, R) :-
	C2 is C * H,
	produs(T, C2, R).


% ==========================

%inserare (L-list, E-element, R-resulted list)
%inserare(i, i, o)

inserare([], E, [E]).

inserare([H|T], E, [E, H | T]).

inserare([H|T], E, [H | RT]) :-
	inserare(T, E, RT).

main_inserare(L, E, R) :-
	findall(RI , inserare(L, E, RI), R).

% ==========================

%perm(L: list, R-list rez)
%perm(i, o)

perm([], []).
perm([H|T], RP) :-
	perm(T, TR),
	inserare(TR, H, RP).


% ==========================

%combinari(L - lista, K - nr elem, L - resulted list);
%combinari flow(i, i, o)

combinari(_, 0, []).

combinari([H|T], K, [H|TR]) :-
	K > 0,
	K1 is K - 1,
	combinari(T, K1, TR).

combinari([H|T], K, L) :-
	K > 0,
	combinari(T, K, L).	



% ===========================

aranjamente(L, K, RL) :-
	combinari(L, K, RC),
	perm(RC, RL).


% ==========================

%oneSolution(L-list, S-suma, P-produs, R-rezultat) :-

oneSolution(L, S, P, R) :-
	aranjamente(L, K, RA),
	suma(RA, 0, S),
	produs(RA, 1, P),
	R is RA.

allSolution(L, S, P, RAL, K) :-
	findall(RI, oneSolution(L, S, P, RI, K), RAL),
	write(R).



 
 












