loves(romeo, juliet).
loves(juliet, romeo) :- loves(rome, juliet).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :-
	happy(albert).

dances(alice) :-
	happy(alice),
	with_albert(alice).	

does_alice_dance :-
	dances(alice),
	write('When Alice is happy and she is with albert she dances').

swims(bill) :-
	happy(bill).

swims(bill) :-
	near_water(bill).	