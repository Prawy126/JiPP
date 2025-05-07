% 8.1

rodzic(ola,max).
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).
 
kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
 
mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).
 
matka(X,Y) :-
  rodzic(X,Y),
  kobieta(X).
 
ojciec(X,Y) :-
  rodzic(X,Y),
  mezczyzna(X).
  
/*
1 ?- \+ false.
true.

2 ?- \+ true.
false.

3 ?- not(false).
true.

4 ?- not(true).
false.

5 ?- X = Y.
X = Y.

6 ?- \+ X = Y.
false.

7 ?- X \= Y.
false.
*/

% 8.1
siostra(X, Y) :-
  rodzic(R, X),
  rodzic(R,Y),
  kobieta(X),
  X \= Y.

siostra2(X, Y) :-
  X \= Y,
  rodzic(R, X),
  rodzic(R,Y),
  kobieta(X).


/*
18 ?- siostra(ola, lila).
false.

19 ?- siostra(lila, max).
true.
*/

/* Task 1

1. Przy pomocy reguly siostra wypisz wszystkie pary (siostra, siostra lub brat)

22 ?- siostra(S,R).
S = lila,
R = max ;
S = ania,
R = kasia ;
S = kasia,
R = ania ;
false.

2. Podaj druga wersje reguly siostra dla ktorej nie jest mozliwe wypisanie tych par.

1 ?- siostra2(S,R).
false.

2 ?- siostra2(lilia, max)
false.

3 ?- siostra2(lilia, max)
false.

3 ?- siostra2(lila, max).
true.
*/

% 8.1.2
% para(X, Y) - konczy sie sukcesem, jezeli X jest kobieta, Y jest mezczyzna i maja wspólne dziecko

para(X, Y) :-
  kobieta(X),
  mezczyzna(Y),
  rodzic(X,D),
  rodzic(Y,D).
  
/*
5 ?- para(X,Y).
X = ola,
Y = tomek ;
false.
*/

% 8.2
rodzice(X) :-
  ojciec(O, X),
  matka(M, X),
  write('ojciec: '), writeln(O),
  write('matka: '), writeln(M).

rodzice(X) :-
  ojciec(O, X),
  write('ojciec: '), writeln(O), !.

rodzice(X) :-
  matka(M, X),
  write('matka: '), writeln(M), !.

rodzice(_) :-
  write('brak danych.').
  
/*
14 ?- rodzice(ola).
brak danych.
true.

15 ?- rodzice(max).
ojciec: tomek
matka: ola
true .

16 ?- rodzice(lila).
ojciec: tomek
true .

17 ?- rodzice(radek).
matka: kasia
true .

18 ?- rodzice(ola).
brak danych.
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

potomek(X,Y) :- rodzic(Y,X).
potomek(X,Y) :- rodzic(Y,Z), potomek(X,Z).

/*
25 ?- potomek(ola,tomek).
false.

26 ?- potomek(radek,tomek).
true ;
false.
*/

/* Task 2

1. Na ile sposobow mozna okreslic regule potomek?

2. Podaj wszystkie mozliwe rozwiazania dla reguly potomek.

3. Are the rules descendant(X,Y) and descendant2(X,Y) equivalent?
*/

potomek2(X,Y) :- rodzic(Y,X).
potomek2(X,Y) :- rodzic(Z,X), potomek(Z,Y).

/*
28 ?- potomek(X,Y).    29 ?- potomek2(X,Y).
X = max,               X = max,             
Y = ola ;              Y = ola ;            
X = max,               X = max,             
Y = tomek ;            Y = tomek ;          
X = lila,              X = lila,            
Y = tomek ;            Y = tomek ;          
X = ania,              X = ania,            
Y = max ;              Y = max ;            
X = kasia,             X = kasia,           
Y = max ;              Y = max ;            
X = radek,             X = radek,           
Y = kasia ;            Y = kasia ;          
X = ania,              X = ania,            
Y = ola ;              Y = ola ;            
X = kasia,             X = ania,            
Y = ola ;              Y = tomek ;          
X = radek,             X = kasia,           
Y = ola ;              Y = ola ;            
X = ania,              X = kasia,           
Y = tomek ;            Y = tomek ;          
X = kasia,             X = radek,           
Y = tomek ;            Y = max ;            
X = radek,             X = radek,           
Y = tomek ;            Y = ola ;            
X = radek,             X = radek,           
Y = max ;              Y = tomek ;          
false.                 false.


*/
