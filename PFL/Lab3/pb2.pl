merge([], [], []).

merge([HA|TA], [], [HR|TR]) :-
	merge(TA, [], TR),
	HR is HA.

merge([],[HB|TB], [HR|TR]) :-
	merge([], TB, TR),
	HR is HB.

merge([HA|TA], [HB|TB], [HR|TR]) :-
	HA =< HB,
	merge(TA, [HB|TB], TR),
	HR is HA. 

merge([HA|TA], [HB|TB], [HR|TR]) :-
	HB < HA,
	merge([HA|TA], TB, TR),
	HR is HB. 	

% ==========================

count_elems([], 0).

count_elems([HA|TA], R) :-
	count_elems(TA, R2),
	R is R2 + 1. 

% ==========================

first_half([], _, _, []).

first_half([HA|TA], N, CRT, [HR|TR]) :-
	StopPos is div(N, 2),
	CRT =< StopPos,
	CRTNext is CRT + 1,
	first_half(TA, N, CRTNext, TR),
	HR is HA.

first_half([HA|TA], N, CRT, R) :-
	StopPos is div(N, 2),
	CRT > StopPos,
	CRTNext is CRT + 1,
	first_half(TA, N, CRTNext, R).

first_half_wrap(A, R) :-
	count_elems(A, N),
	first_half(A, N, 1, R).

% ==========================

second_half([], _, _, []).

second_half([HA|TA], N, CRT, [HR|TR]) :-
	StopPos is div(N, 2),
	CRT > StopPos,
	CRTNext is CRT + 1,
	second_half(TA, N, CRTNext, TR),
	HR is HA.

second_half([HA|TA], N, CRT, R) :-
	StopPos is div(N, 2),
	CRT =< StopPos,
	CRTNext is CRT + 1,
	second_half(TA, N, CRTNext, R).	

second_half_wrap(A, R) :-
	count_elems(A, N),
	second_half(A, N, 1, R).	


% ==========================

merge_sort([], []).

merge_sort([HA|TA], [Res]) :-
	length([HA|TA], SizeA),
	SizeA =:= 1,
	Res is [HA].

merge_sort(A, Res) :-
	length(A, SizeA),
	SizeA > 1,
	first_half_wrap(A, First),
	second_half_wrap(A, Second),
	merge_sort(First, FirstSorted),
	merge_sort(Second, SecondSorted),
	merge(FirstSorted, SecondSorted, Res).

% ==========================

sort_all_subl([], []).

sort_all_subl([HA|TA], [HR|TR]) :-
	is_list(HA),
	sort_all_subl(TA, TR),
	merge_sort(HA, HR).

sort_all_subl([HA|TA], [HR|TR]) :-
	sort_all_subl(TA, TR),
	HR is HA.


% TEST

merge_sort_test() :-
	merge_sort([1], [1]),
	merge_sort([1, 2, 3], [1, 2, 3]),
	merge_sort([3, 2, 1], [1, 2, 3]),
	merge_sort([5,7,2,1,101,2,4], [1, 2, 2, 4, 5, 7, 101]).

sort_all_subl_test() :-
	sort_all_subl( [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7],
				   [1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7] ),

	sort_all_subl( [5, 4, 3, 2], [5, 4, 3, 2]),
	sort_all_subl( [], []),
	sort_all_subl([9, [6,5,4,3], 9, [6,5,4,3]],
				  [9, [3,4,5,6], 9, [3,4,5,6]]).
