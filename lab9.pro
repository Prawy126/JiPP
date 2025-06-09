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

2 ?- X = [b|[]].
X = [b].
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

/* Task 1

dokonaj analizy wywo�ania take(0, [a,b,c,d], X).

*/

/*
1. Przebieg z g�ry do do�u                  1. Przebieg do�u do g�ry
                                                                                     
* take(2, [a,b,c,d],X) =>                   * take(2, [a,b,c,d],X) => X = [a,b]
  N = 2                                       N = 2                                  
  [H|L] = [a,b,c,d] => H = a, L = [b,c,d]     [H|L] = [a,b,c,d] => H = a, L = [b,c,d]
  X := [H|K] =                                X := [H|K] = [a|[b]] = [a,b]
  :-                                          :-                                     
  N1 is 2 - 1 = 1                             N1 is 2 - 1 = 1                        
  2 take (1, [b,c,d],K) => ??                 2 take (1, [b,c,d],K) => K = [b]

* 2 take (1, [b,c,d],K) =>                  * 2 take (1, [b,c,d],K) => K = [b]
  N = 1                                       N = 1
  [H|L] = [b,c,d] => H = b, L = [c,d]         [H|L] = [b,c,d] => H = b, L = [c,d]
  X := [H|K] =                                X := [H|K] = [b|[]] = [b]
  :-                                          :-
  N1 is 1 - 1 = 0                             N1 is 1 - 1 = 0                        
  3 take(0,[c,d],K) => ??                     3 take(0,[c,d],K) => K = []
                                                                                     
* 3 take(0,[c,d],K) =>                      * 3 take(0,[c,d],K) => K = []
  0 = 0                                       0 = 0                                  
  _ = [c,d]                                   _ = [c,d]                              
  K = []                                      K = []
  :-                                          :-
                                              !
*/

/*
2 ?- trace.
true.

[trace] 2 ?- take(2, [a,b,c,d],X).
   Call: (8) take(2, [a, b, c, d], _5440) ? creep
   Call: (9) _5698 is 2+ -1 ? creep
   Exit: (9) 1 is 2+ -1 ? creep
   Call: (9) take(1, [b, c, d], _5674) ? creep
   Call: (10) _5710 is 1+ -1 ? creep
   Exit: (10) 0 is 1+ -1 ? creep
   Call: (10) take(0, [c, d], _5686) ? creep
   Exit: (10) take(0, [c, d], []) ? creep
   Exit: (9) take(1, [b, c, d], [b]) ? creep
   Exit: (8) take(2, [a, b, c, d], [a, b]) ? creep
X = [a, b].
*/

% 9.3

/*
 [trace] 3 ?- nodebug.
true.

4 ?- [H|T] = [a,b,c].
H = a,
T = [b, c].

5 ?- reverse([a,b], X).
X = [b, a].
*/

/*
L          R          T        I
[a,b,c] -> [c,b,a] -> [b,a] -> [a,b]
*/

init2(L,I) :-
    reverse(L, R),
    R = [_|T],
    reverse(T,I).

/*
10 ?- init2([],I).
false.

11 ?- init2([1],I).
I = [].

12 ?- init2([1,2,3,4],I).
I = [1, 2, 3].
*/

init(L,I) :-
    reverse(L,[_|T]),
    reverse(T,I).

/*
14 ?- init([1,2,3,4],I).
I = [1, 2, 3].

16 ?- init([],I).
false.

17 ?- init([1],I).
I = [].
*/

% 9.4

/*
L            T          M
[a,b,c,d] -> [b,c,d] -> [b,c]
*/

middle2(L, M) :-
    L = [_|T],
    init(T,M).

/*
19 ?- middle2([],X).
false.

20 ?- middle2([1],X).
false.

21 ?- middle2([1,2],X).
X = [].

22 ?- middle2([1,2,3,3],X).
X = [2, 3].

23 ?- middle2([1,2,3,4],X).
X = [2, 3].
*/

middle([_|T], M) :-
    init(T,M).

/*
25 ?- middle([],X).
false.

26 ?- middle([1],X).
false.

27 ?- middle([1,2],X).
X = [].

28 ?- middle([1,2,3,4],X).
X = [2, 3].
*/

% 9.6
% permutation(P, L) -  P jest permutacj� listy L
 
permutation([], []).
 
permutation(P, [H|T]) :-
    permutation(P1, T),        
    append(A, B, P1),      % P1 dzielimy na dwie cz�ci 
    append(A, [H|B], P).   % P powstaje poprzez wstawienie 
                           % elementu H w pewne miejsce listy P1
                           
/*
1 ?- permutation([a,b],[X,Y]).
X = a,
Y = b ;
X = b,
Y = a ;
false.
*/

% 9.9

/*

2 ?- numlist(1,5,L).
L = [1, 2, 3, 4, 5].

*/

f1(X,Y) :- Y is 1/X.

listSum([X], X).
listSum([X,Y|T], Sum) :-
  Z is X + Y,
  listSum([Z|T], Sum).
  
s1(X) :-
    numlist(1,100,L1),
    maplist(f1, L1, L2),
    listSum(L2, X),
    !.

/*
6 ?- s1(X).
X = 5.187377517639621.
*/

f2(X,Y) :- Y is (1+X)/(2+X).

listProd([X], X).
listProd([X,Y|T], Prod) :-
  Z is X * Y,
  listProd([Z|T], Prod).

p1(X) :-
    numlist(1,50,L1),
    maplist(f2, L1, L2),
    listProd(L2, X),
    !.

/*
1 ?- p1(X).
X = 0.03846153846153846.
*/

