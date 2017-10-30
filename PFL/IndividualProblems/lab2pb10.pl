nr_up_peak([H1, H2, H3|T], R) :-
	H1 < H2,
	H2 > H3,
	nr_up_peak([H2, H3 | T], R2),
	R is R2 + 1.

nr_up_peak([H|T], R) :-
	nr_up_peak(T, R).

nr_up_peak([], 0).


% ==================================

nr_down_peak([H|T], R) :-
	nr_down_peak(T, R).	
	
nr_down_peak([H1, H2, H3|T], R) :-
	H1 > H2,
	H2 < H3,
	nr_down_peak([H2, H3 | T], R2),
	R is R2 + 1.


nr_down_peak([], 0).


% ==================================a

nr_eq_peak([H1, H2 | T], R) :-
	H1 =\= H2,
	nr_eq_peak([H2 | T], R).	

nr_eq_peak([H1, H2 | T], R) :-
	H1 =:= H2,
	nr_eq_peak([H2 | T], R2),
	R is R2 + 1.

nr_eq_peak(L, R) :-
	length(L, Leng),
	Leng =:= 1,
	R is 0.


% ==================================

solve(L, R) :-
	nr_up_peak(L, NUP),
	nr_down_peak(L, NDP),
	nr_eq_peak(L, NEP),
	write(NUP), write(' '), write(NDP), write(' '), write(NEP), nl,
	NUP =:= 1,
	NDP =:= 0,
	NEP =:= 0,
	R is 1.

solve(L, R) :-
	R is 0.