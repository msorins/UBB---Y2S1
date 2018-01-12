%      insertAt(List, Poz, Elem, CrtPoz, Res)
% flow insertAt(i, i, i, i, o)

insertAt([], _, _, 0, []).

insertAt([], _, Elem, _, [Elem]).

insertAt([HL | TL], Poz, Elem, Poz, [Elem, HL | TRes]) :-
  NewCrtPoz is Poz + 1,
  insertAt(TL, Poz, Elem, NewCrtPoz, TRes).

insertAt([HL | TL], Poz, Elem, CrtPoz, [HL | TRes]) :-
  CrtPoz < Poz,
  NewCrtPoz is CrtPoz + 1,
  insertAt(TL, Poz, Elem, NewCrtPoz, TRes).

insertAt(L, Poz, _, CrtPoz, L) :-
  CrtPoz > Poz.

main() :-
  L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  insertAt(L, 2, 11, 1, L2),
  insertAt(L2, 8, 11, 1, L3),
  insertAt(L3, 16, 11, 1, L4),
  print(L4).
