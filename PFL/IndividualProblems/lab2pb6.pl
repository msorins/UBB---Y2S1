% 6a
% Write a predicate to test if a list is a set
% count(in, in, out)
% count(List, NrCautat, Res)

% is_set(in, out)
% is_set(ListIn, ResOut)

count([], _, 0).

count([H|T], Nr, Res) :-
	count(T, Nr, ResPrev),
	H =:= Nr,
	Res is ResPrev + 1.

count([H|T], Nr, Res) :-
	count(T, Nr, ResPrev),
	H =\=  Nr,
	Res is ResPrev.	


is_set([], 1).

is_set([H|T], Res) :-
	is_set(T, ResPrev),
	ResPrev =:= 1,
	count(T, H, CountH),
	CountH =:= 0,
	Res is 1.	


is_set([H|T], Res) :-
	is_set(T, ResPrev),
	ResPrev =:= 0,
	Res is 0.	

is_set([H|T], Res) :-
	is_set(T, ResPrev),
	ResPrev =:= 1,
	count(T, H, CountH),
	CountH =\= 0,
	Res is 0.	


% b
% Write a predicate to remove the first three occurrences of an element in a list. If the element occurs less
% than three times, all occurrences will be removed.	

remove_first_three([], _, []).

remove_first_three([H|T], Rem, R) :-
	count(Rem, H, CountH),
	CountH < 3,
	remove_first_three(T, [H|Rem], R).

remove_first_three([H|T], Rem, [HR|TR]) :-
	count(Rem, H, CountH),
	CountH >= 3,
	remove_first_three(T, [H|Rem], TR),
	HR is H.