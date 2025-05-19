% 9.1

/*
2 ?- [H|T] = [].
false.

3 ?- [H|T] = [a].
H = a,
T = [].

4 ?- [H|T] = [a,b].
H = a,
T = [b].

5 ?- [H|T] = [a,b,c].
H = a,
T = [b, c].
*/

% take(N, L, K)

take2(_,[],[]) :- !.
take2(0, _,[]) :- !.
take2(N, L, K) :- 
    N1 is N-1,
    L = [H|L1],
    K = [H|K1],
    take2(N1, L1, K1).

/*
8 ?- take2(2, [a,b,c,d],X).
X = [a, b].
*/

take(_,[],[]) :- !.
take(0, _,[]) :- !.
take(N, [H|L], [H|K]) :-
    N1 is N-1,
    take(N1, L, K).

/*
11 ?- take(2, [a,b,c,d],X).
X = [a, b].
12 ?- take(1, [],X).
X = [].

13 ?- take(0, [],X).
X = [].

*/