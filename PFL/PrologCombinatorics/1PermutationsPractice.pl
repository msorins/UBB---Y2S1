
delete([HL|TL], HL, TL).

delete([HL|TL], X, [HL|TRes]) :-
  delete(TL, X, TRes).


perm([], []).

perm(L, [DeletedElement|TRes]) :-
  delete(L, DeletedElement, Rest),
  perm(Rest, TRes).

compute(L, ResAll) :-
  findall(ResAux, perm(L, ResAux), ResAll).
