delete([H|T], H, T).

delete([H|T], E, [H|TRes]) :-
  delete(T, E, TRes).

var(_, 0, []).

var(L, N, [DeletedElement | TRes] ) :-
  delete(L, DeletedElement, Rest),
  NewN is N - 1,
  var(Rest, NewN, TRes).

varAll(L, N, ResAll) :-
  findall(ResAux, var(L, N, ResAux), ResAll).
