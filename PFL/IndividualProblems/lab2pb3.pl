%mycount (L - list in, E - nr, R - nr of apparitions)
%mycount flow model: (i, i, o)

% Practic nu merge asa deoarece trebuie sa il redefinesc pe R
mycount([], _, R, R).

mycount([H|T], Nr, Count, R) :-
	H =:= Nr,
	Count2 is  Count + 1,
	R2 is Count + 1,
	mycount(T, Nr, Count2, R).


mycount([H|T], Nr, Count, R) :-
	H =\= Nr,
	mycount(T, Nr, Count, R).
	


% Pb 3 a
% Remove all duplicates
% remove(L - list in, L2 - copy lyst in)
count([], _, 0).

count([H|T], Nr, R) :-
	H =:= Nr,
	count(T, Nr, R2),
	R is R2 + 1.

count([H|T], Nr, R) :-
	H =\= Nr,
	count(T, Nr, R).


remove([], _, []).

remove([H|T], L2, [HR|TR]) :-
	count(L2, H, X),
	X=:=1,
	remove(T, L2, TR),
	HR is H.

remove([H|T], L2, R) :-
	count(L2, H, X),
	X>=2,
	remove(T, L2, R).	


% Pb 3b

maximum([], _, 0).

maximum([H|T], L2, Res) :-
	maximum(T, L2, Res2),
	H > Res2,
	Res is H.

maximum([H|T], L2, Res) :-
	maximum(T, L2, Res2),
	H =< Res2,
	Res is Res2.

maximum_main(L1, R):-
	maximum(L1, L1, R).


remove_maximums([], _, []).

remove_maximums([H|T], L2, [HR|TR]) :-
	maximum_main(L2, Max),
	Max =\= H,
	remove_maximums(T, L2, TR),
	HR is H.

remove_maximums([H|T], L2, R) :-
	maximum_main(L2, Max),
	Max =:= H,
	remove_maximums(T, L2, R).

remove_maximums_main(L1, R) :-
	remove_maximums(L1, L1, R).	
