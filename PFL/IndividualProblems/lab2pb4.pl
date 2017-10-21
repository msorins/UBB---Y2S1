

% pb 4a 
%  Write a predicate to determine the difference of two sets.

% count(in, in, out)
% count(List, NrCautat, Res)

% diff_set(In, In, Out)
% diff_set(ListA, ListB, Res)

count([], _, 0).

count([H|T], Nr, Res) :-
	count(T, Nr, ResPrev),
	H =:= Nr,
	Res is ResPrev + 1.

count([H|T], Nr, Res) :-
	count(T, Nr, ResPrev),
	H =\=  Nr,
	Res is ResPrev.	

diff_set([], _, []).	

diff_set([HA|TA], B, [HR|TR]) :-
	count(B, HA, CountHA),
	CountHA =:= 0,
	diff_set(TA, B, TR),
	HR is HA.

diff_set([HA|TA], B, R) :-
	count(B, HA, CountHA),
	CountHA =\= 0,
	diff_set(TA, B, R).


% pb 4b
% Write a predicate to add value 1 after every even element from a list.

% add_one_even(input, output)
% add_one_even(input list, output res)

add_one_even([], []).

add_one_even([H|T], [HR|TR]) :-
	Mod is H mod 2,
	Mod =:= 0,
	add_one_even(T, TR),
	HR is H + 1.

add_one_even([H|T], [HR|TR]) :-
	Mod is H mod 2,
	Mod =\= 0,
	add_one_even(T, TR),
	HR is H.
