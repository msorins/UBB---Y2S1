%pb1...sa se numere cate cifre E exista intr-o lista
%nAC(L - list, E - the number, C, R)
%nAC flow (i, i, i, o)

nAC([], _, C, C).

nAC([H|T], E, C, Res) :-
	H =:= E,
	C2 is C + 1,
	nAC(T, E, C2, Res).


nAC([H|T], E, C, Res) :-
	H =\= E,
	nAC(T, E, C, Res).


%pb2...sa se inverseze cifrele unui numar
%inverse(Nr - numar, C, R - inverse)
%inverse flow(i, i, o)

inverse(Nr, C, R) :-
	Nr2 is div(Nr, 10),
	C2 is C * 10 + mod(Nr, 10),
	inverse(Nr2, C2, R).

inverse(0, C, C).

inverse_wrap(Nr, R) :-
	inverse(Nr, 0, R).

%pb3 .. sa se stearga toate palindroamele din sublistele unei liste

%dxelete palindrom:
%dxelete_pal(L - list, R - result)
%dxelete_pal flow(i, o)


delete_pal([], []).

delete_pal([HL|TL], R) :-
	inverse_wrap(HL, InvHL),
	HL =:= InvHL,
	delete_pal(TL, R).

delete_pal([HL|TL], [HL|TR]) :-
	inverse_wrap(HL, InvHL),
	HL =\= InvHL,
	delete_pal(TL, TR).

prelucrare([], []).

prelucrare([H|T], [H|TR]) :-
	number(H),
	prelucrare(T, TR).	

prelucrare([H|T], [HR|TR]) :-
	is_list(H),
	delete_pal(H, HR),
	prelucrare(T, TR).	
