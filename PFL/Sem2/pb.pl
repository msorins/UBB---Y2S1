%1
%multiply( L-listin, K - number, RL - listout)

multiply([], _, []) .

multiply([H|T], K, [HR|TR]) :-
	HR is H * K,
	multiply(T, K, TR).


%2
%mycount (L - list in, E - nr, R - nr of apparitions)
%mycount flow model: (i, i, o)

mycount([], _, 0).

mycount([H|T],E,R):-
	H =:= E,
	mycount(T,E,R2),
	R is R2 + 1.

mycount([H|T], E, R) :-
	H =\= E,
	mycount(T, E, R).	

%3
%add(L-listin, E-number, RL-list out)
%add flow model: (i, i, o)


add([],E,[E]).
add([H|T],E,[HR|TR]):-
	HR is H,
	add(T, E, TR).
 
%4
%remove(L-listin, C-copylistin, RL-list out) 
%remove flow model (i, i, o), (i, i, i)

remove([], _, []).

remove([H|T], CL, RL) :-
	mycount(CL, H, 1),
	remove(T, CL, RL).

remove([H|T], CL, [RH|RT]) :-
	mycount(CL, H, X),
	X =\= 1,
	remove(T, CL, RT),
	RH is H,

main_remove(L, RL) :-
	remove(L, L, RL).	