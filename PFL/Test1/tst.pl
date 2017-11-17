findMax([], 0).

findMax([HL | TL], R) :-
	findMax(TL, R2),
	HL >= R2,
	R is HL.

findMax([HL | TL], R) :-
	findMax(TL, R2),
	HL < R2,
	R is R2.	



rplace([], _, _, []).

rplace([HL | TL], X, Y, [HR | TR]) :-
	HL =\= X,
	HR is HL,
	rplace(TL, X, Y, TR).

rplace([HL | TL], X, Y, [HR | TR]) :-
	HL =:= X,
	HR is Y,
	rplace(TL, X, Y, TR).	

main(L, Y, R) :-
	findMax(L, MaxVal),
	rplace(L, MaxVal, Y, R).


testsmain() :-
	main([3, 6, 2, 4, 6, 1], 11, [3, 11, 2, 4, 11, 1]),
	main([5, 4, 3, 2, 1], 11, [11, 4, 3, 2, 1]),
	main([5, 5, 5, 5, 5], 11, [11, 11, 11, 11, 11]),
	main([1, 2, 3, 2, 1, 2, 3, 2, 3, 1], 11, [1, 2, 11, 2, 1, 2, 11, 2, 11, 1]).
