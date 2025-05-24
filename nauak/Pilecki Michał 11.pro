% 9.2

/*
(*) W pliku listy.pl zdefiniuj predykat drop/3 usuwaj¹cy N pocz¹tkowych elementów z listy. Argumenty:

liczba naturalna,
lista pocz¹tkowa,
lista wynikowa.
Uwaga: Nale¿y rozpatrzeæ dwa warunki koñcowe: usuwanie z pustej listy i usuwanie „0“ elementów.
*/

drop(0,  L,  L)  :- !.
drop(_,  [], []) :- !.
drop(N, [_|T], R) :-
    N > 0,
    N1 is N - 1,
    drop(N1, T, R).
    
/*
1 ?- drop(3, [a,b,c,d,e], R).
R = [d, e].

2 ?- drop(0, [x,y], R).
R = [x, y].

3 ?- drop(5, [1,2,3], R).
R = [].

4 ?- drop(5, [], R).
R = [].
*/

% 9.3.2
/*
(*) z zastosowaniem predykatu take.
*/
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|R]) :-
    N > 0,
    N1 is N - 1,
    take(N1, T, R).
    
/*
7 ?- take(2,[a,b,c],X).
X = [a, b].

8 ?- take(0,[a,b,c],X).
X = [].

9 ?- take(3,[a,b,c],X).
X = [a, b, c].

10 ?- take(4,[a,b,c],X).
X = [a, b, c].
*/

% 9.5

/*
(*) W pliku listy.pl zdefiniuj predykat split/3, który dzieli listê L na dwie czêœci L1 i L2 mniej wiêcej równej d³ugoœci (z dok³adnoœci¹ do jednego elementu).
*/

split(InputList, FirstPart, SecondPart) :-
    length(InputList, Len),
    Half is Len // 2,
    take(Half, InputList, FirstPart),
    drop(Half, InputList, SecondPart).
    
/*

12 ?- split([a,b,c,d,e,f], L1, L2).
L1 = [a, b, c],
L2 = [d, e, f].

13 ?- split([1,2,3,4,5], L1, L2).
L1 = [1, 2],
L2 = [3, 4, 5].

14 ?- split([], L1, L2).
L1 = L2, L2 = [].
*/

% 9.7

/*
(*) W pliku listy.pl zdefiniuj predykat middle/3 pobieraj¹cy z listy L wszystkie elementy z pominiêciem N pierwszych i N ostatnich. Pierwszym argumentem predykatu jest liczba odcinanych z ka¿dej strony listy elementów, drugim jest lista wejœciowa, a trzecim wynik.

Uwaga: Z listy mo¿na odcinaæ elementy je¿eli jej d³ugoœæ jest wiêksza ni¿ 2 * N. W przeciwnym przypadku wynikiem jest lista pusta.

Nale¿y skorzystaæ z predykatów take/2 i drop/2.
*/

middle(N, L, M) :-
    length(L, Len),
    MLen is Len - 2 * N,
    (  MLen > 0
    -> drop(N, L, T),
       take(MLen, T, M)
    ;  M = []
    ).
    
/*
15 ?- middle(2, [a,b,c,d,e,f,g], M).
M = [c, d, e].

16 ?- middle(3, [1,2,3,4,5,6], M).
M = [].

17 ?- middle(0, [x,y], M).
M = [x, y].
*/

% 9.8

/* (*) W pliku listy.pl zdefiniuj predykat move/2 przesuwaj¹cy cyklicznie o 1 elementy z listy, np.:

?- move([1,2,3,4], X), move(X, Y), move(Y, Z).
X = [2, 3, 4, 1],
Y = [3, 4, 1, 2],
Z = [4, 1, 2, 3]
*/

move([], []).
move([H|T], M) :-
    append(T, [H], M).

/*
19 ?- move([1,2,3,4], X), move(X, Y), move(Y, Z).
X = [2, 3, 4, 1],
Y = [3, 4, 1, 2],
Z = [4, 1, 2, 3].
*/

% 9.9

/*
W pliku analiza.pl zdefiniuj predykaty wyliczaj¹ce poni¿sze sumy i iloczyny:

suma od 1 do 100 liczb postaci 1/n;
iloczyn od 1 do 50 liczb postaci (1+n)/(2+n);
(*) suma od 1 do 1000 liczb postaci 1/(i^2);
(*) suma od 1 do 1000 liczb postaci (sqrt i)-1/i;
(*) iloczyn od 1 do 1000 liczb postaci (i+1)/(i^3).
Uwaga: Do pliku analiza.pl skopiuj predykat listSum ze slajdu 41. Zobacz przyk³ady ze slajdu 47.
*/

listSum([X], X).
listSum([X,Y|T], Sum) :-
  Z is X + Y,
  listSum([Z|T], Sum).



f3(I, Y) :-
    Y is 1/(I*I).

s3(Sum) :-
    numlist(1,1000,L1),
    maplist(f3,L1,L2),
    listSum(L2,Sum),
    !.

f4(I, Y) :-
    Y is sqrt(I) - 1/I.

s4(Sum) :-
    numlist(1,1000, L1),
    maplist(f4,L1, L2),
    listSum(L2,Sum),
    !.

f5(I, Y) :-
    Y is (I+1)/(I*I*I).

listProd([X],    X).
listProd([X,Y|T],P) :-
    Z is X*Y,
    listProd([Z|T], P).

p5(Prod) :-
    numlist(1,1000, L1),
    maplist(f5,L1, L2),
    listProd(L2,Prod),
    !.
    
/*
21 ?- s3(S).
S = 1.6439345666815615.

22 ?- s4(S).
S = 21089.970416620185.

23 ?- p5(P).
P = 0.0.
*/