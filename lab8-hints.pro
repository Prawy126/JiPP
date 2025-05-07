% facts

parent(ola,max).     % parent  P ~ K
parent(tomek,max).
parent(tomek,lila).
parent(max,ania).
parent(max,kasia).
parent(kasia,radek).

woman(ola).          % woman  W
woman(lila).
woman(kasia).
woman(ania).

man(tomek).          % man  M
man(max).
man(radek).

% rules

mother(X,Y) :-       % mother(X,Y)  M ~ K
  parent(X,Y),
  woman(X).

father(X,Y) :-       % father(X,Y)  F ~ K
  parent(X,Y),
  man(X).
  
/* Overview of the family knowledge database

Relations:

parent  P ~ K

Properties:

woman  W
man    M

Procedures or rules:

mother(X,Y)  M ~ K
father(X,Y)  F ~ K
*/

% 8.1

/*
1 ?- \+ false.
true.

2 ?- \+ true.
false.

3 ?- not(false).
true.

4 ?- not(true).
false.

5 ?- X = Y.  % What is the logical evaluation of this unification?
X = Y.

6 ?- \+ X = Y.
false.

7 ?- not(X = Y).
false.

8 ?- X \= Y. % Is it true that X cannot be unified with Y? No, it isn't since X can be unified with Y.
false.
*/

% 8.1.1
% siostra(X, Y) - konczy sie sukcesem, jesli X jest siostra Y

% solution here

/*
1 ?- siostra(ola,lila).
false.

2 ?- siostra(lila,max).
true.
*/

/* Task 1

1. Przy pomocy reguly siostra wypisz wszystkie pary (siostra, siostra lub brat)

2. Podaj druga wersje reguly siostra dla ktorej nie jest mozliwe wypisanie tych par.
*/

% 8.1.2
% para(X, Y) - konczy sie sukcesem, jezeli X jest kobieta, Y jest mezczyzna i maja wspólne dziecko

% solution here

/*
1 ?- para(X,Y).
X = ola,
Y = tomek ;
false.
*/

% 8.2

/*
Dokonaj analizy przykladow ze strony:

http://www.balois.pl/jipp/prolog/obciecia.htm
*/

% solution here

/*
1 ?- rodzice(max).
ojciec: tomek
matka: ola
true.

2 ?- rodzice(lila).
ojciec: tomek
true.

3 ?- rodzice(kasia).
ojciec: max
true.

4 ?- rodzice(ola).
brak danych
true.
*/

% 8.3.1

/*
X is the descendant of Y.

X <- Y
X <- Z <- Y
 \__/ \__/

X <- ... <- Y
*/

% solution here

/*
1 ?- descendant(ola,tomek).
false.

2 ?- descendant(radek,tomek).
true ;
false.
*/

/* Task 2

1. Na ile sposobow mozna okreslic regule potomek?

2. Podaj wszystkie mozliwe rozwiazania dla reguly potomek.

3. Are the rules descendant(X,Y) and descendant2(X,Y) equivalent?
*/

% The rule descendant3(X,Y) is a slight modification of descendant2(X,Y).

descendant3(X,Y) :- parent(Y,X).
descendant3(X,Y) :- descendant3(X,Z), parent(Y,Z). % It is not correct to place a recursive invocation as the first predicate in the body of a rule.

/*
7 ?- descendant3(ola,tomek).
ERROR: Out of local stack
8 ?- descendant3(radek,tomek).
true ;
ERROR: Out of local stack
*/

% 8.4

/*
Copy knowledge database from the site: http://www.balois.pl/jipp/help/
*/

/*
Properties:

country   C
city      T
monument  M

Relations:

location  T ~ C
where     M ~ T
next      C1 ~ C2
*/

% 8.4.1

% solution here

% zabytki_m(T) :-

/*
1 ?- zabytki_m('Berlin').
Brama Brandenburska
Reichstag
true.
*/

% 8.4.2

% solution here

% zabytki_mp(T) :-

/*
2 ?- zabytki_mp('Berlin').
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.
*/

% 8.5

/*
1 ?- X is 3*5.
X = 15.
*/

/*
16 ?- 1 + 3 = 1 + 3.
true.

17 ?- 1 + 3 = 3 + 1.
false.

18 ?- 1 + 3 =:= 1 + 3.
true.

19 ?- 1 + 3 =:= 3 + 1.
true.
*/

fun(X,Y) :- Y is 2*X.

/*
2 ?- fun(5,Y).
Y = 10.
*/

% solution here

% delta(A,B,C,W) :-

% trojmian(...) :-

/*
1 ?- quadratic(1,0,-1,X).
X = [-1.0, 1.0] ;
false.

2 ?- quadratic(1,-2,1,X).
X = [1] ;
false.

3 ?- quadratic(1,0,1,X).
X = [].
*/

/* Task 3

Podaj drugie rozwiazanie z wykorzystaniem operatora obciecia !
*/

% 8.6 *

test(1,3).

/*
1 ?- test(1,3).
true.

2 ?- test(3,1).
false.

3 ?- test(_,3).
true.

4 ?- test(1,_).
true.

5 ?- test(_,_).
true.

6 ?- test(X,3).
X = 1.

7 ?- test(1,Y).
Y = 3.

8 ?- test(X,Y).
X = 1,
Y = 3.

9 ?- test(3,Y).
false.

10 ?- test(X,1).
false.
*/

% solution here

/*
Podaj dwa rozwiazania bez i z operatorem obciecia !
*/
