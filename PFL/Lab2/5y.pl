 %Write a predicate to compute the union of two sets.
union_two_sets(R, [], R) :-
	!.

union_two_sets(A, [HEAD|TAIL], R) :-
	append(A, [HEAD], C),
	length([TAIL], Nr),
	Nr > 0,
	union_two_sets(C, TAIL, R).

countEl([], _, 0).

countEl([H|T], Nr, R) :-
	H =:= Nr,
	countEl(T, Nr, R2),
	R is R2 + 1.

countEl([H|T], Nr, R) :-
	H =\= Nr,
	countEl(T, Nr, R).


removeEl([], []).

removeEl([H|T], [HR|TR]) :-
	countEl([H|T], H, X),
	X=:=1,
	removeEl(T, TR),
	HR is H.

removeEl([H|T], R) :-
	countEl([H|T], H, X),
	X>=2,
	removeEl(T, R).		

union_two_sets_wrap(A, B, R) :-
	union_two_sets(A, B, R2),
	removeEl(R2, R).

union_two_sets_tests() :-
	union_two_sets_wrap([1], [1], [1]),
	union_two_sets_wrap([1], [2], [1,2]),
	union_two_sets_wrap([1, 2 , 3, 4, 5], [2], [1, 3, 4, 5, 2]),
	union_two_sets_wrap([1,4,5,2], [1,5], [4,2,1,5]),
	union_two_sets_wrap([], [], []),
	union_two_sets_wrap([], [1], [1]),
	write('OK').



%Write a predicate to determine the set of all the pairs of elements in a list.
set_of_all_pairs([], [HeadB2 | TailB2], [HeadB2 | TailB2], R, R) :-
	!.

set_of_all_pairs([HeadA|TailA], [], [HeadB2| TailB2], Res, R) :-
	HeadB = HeadB2,
	TailB = TailB2,
	set_of_all_pairs(TailA, [HeadB|TailB], [HeadB2|TailB2], Res, R).

set_of_all_pairs([HeadA|TailA], [HeadB|TailB], [HeadB2|TailB2], Res, R) :-
	CrtL = [HeadA|[HeadB]],
	CrtL2 = [HeadB|[HeadA]],
	append(Res, [CrtL], Res2),
	append(Res2, [CrtL2], Res3),
	
	set_of_all_pairs([HeadA|TailA], TailB, [HeadB2| TailB2], Res3, R).


eq_lists([], [], 1).

eq_lists([HA|TA], [HB|TB], R) :-
 	eq_lists(TA, TB, R2),
 	R2 =:= 0,
 	R is 0.

eq_lists([HA|TA], [HB|TB], R) :-
 	eq_lists(TA, TB, R2),
 	R2 =:= 1,
 	HA =\= HB,
 	R is 0.

eq_lists([HA|TA], [HB|TB], R) :-
 	eq_lists(TA, TB, R2),
 	R2 =:= 1,
 	HA =:= HB,
 	R is 1.


countLists([], _, 0).

countLists([H|T], Nr, R) :-
	eq_lists(H, Nr, Is),
	Is =:= 1,
	countLists(T, Nr, R2),
	R is R2 + 1.

countLists([H|T], Nr, R) :-
	eq_lists(H, Nr, Is),
	Is =\= 1,
	countLists(T, Nr, R).


removeLists([], []).

removeLists([H|T], [H|TR]) :-
	countLists([H|T], H, X),
	X=:=1,
	removeLists(T, TR).

removeLists([H|T], R) :-
	countLists([H|T], H, X),
	X>=2,
	removeLists(T, R).		

set_of_all_pairs_wrap([HeadA|TailA], [HeadB|TailB], R) :-
	set_of_all_pairs([HeadA|TailA], [HeadB|TailB], [HeadB|TailB], Res, R2),
	removeLists(R2, R).


set_of_all_pairs_test() :-
	set_of_all_pairs_wrap([1], [1], [[1, 1]]),
	set_of_all_pairs_wrap([1], [1, 2], [[1, 1], [1, 2], [2, 1]] ),
	write('OK').



