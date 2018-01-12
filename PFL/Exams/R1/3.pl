% Lista submultimi care au suma S

%      subm(l, s, cs, res)
% flow subm(i, i, i,  o)

subm(_, S, S, Res).

% mai pot adauga un element si il adaug
subm([HL|TL], S, CS, [HL|TRes]) :-
  CS2 is CS + HL,
  CS2 < S,
  subm(TL, S, CS2, TRes ).

% mai pot adauga un element dar nu o fac
subm([HL|TL], S, CS, Res) :-
  CS < S,
  subm(TL, S, CS, Res ).

% raspuns => ma opresc din recursie
subm([HL|TL], S, CS, [HL]) :-
  CS2 is CS + HL,
  CS2 =:= S,
  Res is HL.

% am depasit suma limita => ies din recursie, solutie invalida
subm([HL|TL], S, CS, Res) :-
  CS2 is CS + HL,
  CS2 > S!.

printlist([]).

printlist([X|List]) :-
  write(X),nl,
  printlist(List).


main(L, S, ResAll) :-
  findall(RAux, subm(L, S, 0, RAux), ResAll),
  printlist(ResAll).
