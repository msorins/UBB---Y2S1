%Write a predicate to compute the union of two sets.
union_two_sets(A, []) :-
	write(A), nl.

union_two_sets(A, [HEAD|TAIL]) :-
	append(A, [HEAD], C),
	length([TAIL], Nr),
	Nr > 0,
	union_two_sets(C, TAIL).


%Write a predicate to determine the set of all the pairs of elements in a list.
set_of_all_pairs([], [HeadB2 | TailB2], [HeadB2 | TailB2], Res) :-
	write(Res).

set_of_all_pairs([HeadA|TailA], [], [HeadB2| TailB2], Res) :-
	HeadB = HeadB2,
	TailB = TailB2,
	set_of_all_pairs(TailA, [HeadB|TailB], [HeadB2|TailB2], Res).

set_of_all_pairs([HeadA|TailA], [HeadB|TailB], [HeadB2|TailB2], Res) :-
	CrtL = [HeadA|[HeadB]],
	CrtL2 = [HeadB|[HeadA]],
	append(Res, [CrtL], Res2),
	append(Res2, [CrtL2], Res3),


	set_of_all_pairs([HeadA|TailA], TailB, [HeadB2| TailB2], Res3).

set_of_all_pairs_wrap([HeadA|TailA], [HeadB|TailB]) :-
	set_of_all_pairs([HeadA|TailA], [HeadB|TailB], [HeadB|TailB], R).