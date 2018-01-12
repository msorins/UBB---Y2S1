% Toate aranjamentele unei multimi de K elemente care au ca produs P

delete([HL | TL], HL, TL).

delete([HL | TL], X, [HL | TRes]) :-
  delete(TL, X, TRes).

% =======================================

varia(_, 0, []).

varia(L, K, [DeletedElem | TRes]) :-
  delete(L, DeletedElem, Rest),
  KNew is K - 1,
  varia(Rest, KNew, TRes).

computePerms(L, K, RAll) :-
  findall(RAux, varia(L, K, RAux), RAll).

% =======================================

 productList([], 1).

 productList([HL | TL], Prod) :-
   productList(TL, ProdRecursive),
   Prod is ProdRecursive * HL.

% =======================================

filterPerms([], _, []).

filterPerms([HL | TL], P, [HL | TRes]) :-
  productList(HL, ProdHL),
  ProdHL =:= P,
  filterPerms(TL, P, TRes).

filterPerms([HL | TL], P, Res) :-
  productList(HL, ProdHL),
  ProdHL =\= P,
  filterPerms(TL, P, Res).

% =======================================

 main(L, K, P, Res) :-
   computePerms(L, K, Perms),
   filterPerms(Perms, P, Res).
