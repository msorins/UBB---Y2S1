%Sa se scrie un program care elimina primele n subliste dintr-o lista

remf(L, NR, CNR, L) :-
  CNR > NR.

remf([HL|TL], NR, CNR, RES) :-
    CNR =< NR,
    CNR2 is CNR + 1,
    remf(TL, NR, CNR2, RES).

main(L, NR, RES) :-
  remf(L, NR, 1, RES).
