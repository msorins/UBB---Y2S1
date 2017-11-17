% generate all valid paranthesis
% gen(N - total number of p, C - current number of p, Nro - nr open p, RAux - Aux Res, FRes - FinalRes)
% gen flow(i, i, i, i, o )

gen(N, N, 0, R, R).

gen(N, C, Nro, RAux, FRes) :-
  C < N,
  CNew is C + 1,
  NroNew is Nro + 1,
  append(RAux, ['('], RAuxNew),
  gen(N, CNew, NroNew, RAuxNew, FRes).

gen(N, C, Nro, RAux, FRes) :-
  C < N,
  Nro > 0,
  CNew is C + 1,
  NroNew is Nro - 1,
  append(RAux, [')'], RAuxNew),
  gen(N, CNew, NroNew, RAuxNew, FRes).

genAll(N, FRes) :-
  findall(RAux, gen(N, 0, 0, [], RAux), FRes),
  length(FRes, LenFRes),
  write("Nr of sols: "), write(LenFRes), nl,
  printlist(FRes).

printlist([]).

printlist([X|List]) :-
  write(X),nl,
  printlist(List).

pb8_test() :-
  genAll(2, [['(', ')']]),
  genAll(4, [['(', '(', ')', ')'], ['(', ')', '(', ')']] ),
  genAll(6, [['(','(','(',')',')',')'], ['(','(',')','(',')',')'], ['(','(',')',')','(',')'], ['(',')','(','(',')',')'], ['(',')','(',')','(',')']] ).
