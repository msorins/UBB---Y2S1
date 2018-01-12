% Pt o valoare N data, sa se genereze permutari cu numerele N, N+1 ... 2*N - 1
% Conditie: diferenta dintre fiecare 2 numere consecutive sa fie <= 2

%     gen(N, CrtN, R)
% flow gen(i, i, o)

gen(N, CrtN, [Res]) :-
  CrtN =:= 2 * N - 1,
  Val is 2 * N - 1,
  Res is Val.

gen(N, CrtN, [CrtN | TR]) :-
  CrtN < 2 * N - 1,
  NewCrtN is CrtN + 1,
  gen(N, NewCrtN, TR).

genMain(N, R) :-
  gen(N, N, R).


% ==================

%      delete(List, ElementDeleted, Rest)
% flow delete(i, o, o)

delete([HL | TL], HL, TL).

delete([HL| TL], E, [HL | TRes]) :-
  delete(TL, E, TRes).

% ==================

%      perm(List, Res)
% flow perm(i, o)

perm([], []).

perm(L, [ElementDeleted | TRes]):-
  delete(L, ElementDeleted, Rest),
  perm(Rest, TRes).

cperm(L, ResAll) :-
  findall(ResAux, perm(L, ResAux), ResAll).

% ==================

%      isValid(L, Ant, R)
% flow isValid(i, i, o)

isValid([], _, 1).

isValid([HL | _], Ant, 0) :-
  abs(HL - Ant) > 2.

isValid([HL | TL], Ant, Res) :-
  abs(HL - Ant) =< 2,
  isValid(TL, HL, Res).

isValidMain([HL | TL], R) :-
  isValid([HL | TL], HL, R).

% ==================

%      filter(L, Res)
% flow filter(i, o)

filter([], []).

filter([HL | TL], [HL | TRes]) :-
  isValidMain(HL, 1),
  filter(TL, TRes).

filter([HL | TL], Res) :-
  isValidMain(HL, 0),
  filter(TL, Res).

% ==================

main(L, R) :-
    cperm(L, Perms),
    filter(Perms, R).
