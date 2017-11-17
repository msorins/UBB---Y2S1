% inserarea elementului X in Lista L pe pozitia P
% insertAt(L - lista, X - elementul, Pos - pozitia pe care vreau sa inserez, CPos - pozitia curenta, R - rezultat )
% insertAt(i, i, i, i, o)

insertAt([], X, _, _, [X]) :-
  !.

insertAt(L, X, POS, POS, [X | L]) :-
  !.

insertAt([HL|TL], X, POS, CPOS, [HL | TR]) :-
    POS =\= CPOS,
    CPOS2 is CPOS + 1,
    insertAt(TL, X, POS, CPOS2, TR).

insertAtWrap(L, X, POS, R) :-
    insertAt(L, X, POS, 1, R).


insertAll(L, X, CPOS, R) :-
    insertAtWrap(L, X, CPOS, R).

insertAll(L, X, CPOS, R) :-
    write(CPOS),
    length(L, LenL),
    CPOS =< LenL,
    CPOS2 is CPOS + 1,
    insertAll(L, X, CPOS2, R).

insertAllWrapA(L, X, RFinal) :-
    findall(RPart, insertAll(L, X, 1, RPart), RFinal).

insertAllWrap(L, X, R) :-
      insertAll(L, X, 1, R).

% perm(L - list , CrtR - aux variable, initial [], FinR - result variable )
% perm flow(i, i, o)

perm([], R, R).

perm([HL | TL], CrtR, FinR) :-
  insertAllWrap(CrtR, HL, AuxR),
  perm(TL, AuxR, FinR).

permWrapA(L, RFinal) :-
  findall(RAux, perm(L, [], RAux), RFinal).
