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

potomek3(X,Y) :- rodzic(Y,X).
potomek3(X,Y) :- potomek3(X,Z), rodzic(Y,Z). % It is not correct to place a recursive invocation as the first predicate in the body of a rule.

/*
2 ?- potomek3(X,Y).
X = max,
Y = ola ;
X = max,
Y = tomek ;
X = lila,
Y = tomek ;
X = ania,
Y = max ;
X = kasia,
Y = max ;
X = radek,
Y = kasia ;
X = ania,
Y = ola ;
X = ania,
Y = tomek ;
X = kasia,
Y = ola ;
X = kasia,
Y = tomek ;
X = radek,
Y = max ;
X = radek,
Y = ola ;
X = radek,
Y = tomek ;
ERROR: Out of local stack
*/

panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('W³ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Kraków').
miasto('Berlin').
miasto('Pary¿').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary¿', 'Francja').
polozenie('Rzym', 'W³ochy').
polozenie('Wenecja', 'W³ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa³ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Koœció³ Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie¿a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa³ac Elizejski').
zabytek('Bazylika œw. Paw³a za Murami').
zabytek('Koloseum').
zabytek('Zamek Œwiêtego Anio³a').
zabytek('Bazylika œw. Marka').
zabytek('Pa³ac Do¿ów').
zabytek('Sagrada Familia').
zabytek('Pa³ac Kryszta³owy').
zabytek('Tower Bridge').
zabytek('Pa³ac Buckingham').
zabytek('Katedra Œwiêtego Paw³a').

gdzie('Pa³ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Koœció³ Mariacki', 'Kraków').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie¿a Eiffla', 'Pary¿').
gdzie('Katedra Notre-Dame', 'Pary¿').
gdzie('Pa³ac Elizejski', 'Pary¿').
gdzie('Bazylika œw. Paw³a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Œwiêtego Anio³a', 'Rzym').
gdzie('Bazylika œw. Marka', 'Wenecja').
gdzie('Pa³ac Do¿ów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa³ac Kryszta³owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa³ac Buckingham', 'Londyn').
gdzie('Katedra Œwiêtego Paw³a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W³ochy').
obok('Francja', 'Hiszpania').

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

zabytki_m(M) :-
    miasto(M),
    zabytek(Z),
    gdzie(Z,M),
    writeln(Z),
    fail. 
    
    
/*
4 ?- zabytki_m('Berlin').
Brama Brandenburska
Reichstag
false.
*/  

zabytki_mp(M) :-
  miasto(M),
  zabytek(Z),
  panstwo(P),
  gdzie(Z,M),
  polozenie(M,P),
  write(P), tab(1), write(M), tab(1), writeln(Z),
  fail.

/*
11 ?- zabytki_mp('Berlin').
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
false.
*/

% 8.5

/*
14 ?- X is 3*5.
X = 15.

15 ?- 1 + 3 = 3 + 1
.
false.

16 ?- 1 + 3 = 1 + 3.
true.

17 ?- 1 + 3 =:= 1 + 3.
true.

18 ?- 1 + 3 =:= 3 + 1.
true.
*/

fun(X, Y) :- Y is 2*X.

/*
1 ?- fun(5, Y).
Y = 10.
*/

delta(A, B, C, D) :- D is B*B - 4*A*C.

trojmian(A, B, C, X) :-
    delta(A, B, C, D),
    D > 0,
    X1 is (-B - sqrt(D)) / (2*A),
    X2 is (-B + sqrt(D)) / (2*A),
    X = [X1, X2].
    
trojmian(A, B, C, X) :-
    delta(A, B, C, D),
    D = 0,
    X0 is -B / (2*A),
    X = [X0].
    
trojmian(A, B, C, X) :-
    delta(A, B, C, D),
    D < 0,
    X = [].
    
/*
1 ?- trojmian(-1,0,1,X).
X = [1.0, -1.0] ;
false.

2 ?- trojmian(1,-2,1,X).
X = [1] ;
false.

3 ?- trojmian(1,0,1,X).
X = [].
*/


trojmian2(A, B, C, X) :-
    delta(A, B, C, D),
    D > 0,
    X1 is (-B - sqrt(D)) / (2*A),
    X2 is (-B + sqrt(D)) / (2*A),
    X = [X1, X2],
    !.
    
trojmian2(A, B, C, X) :-
    delta(A, B, C, D),
    D = 0,
    X0 is -B / (2*A),
    X = [X0],
    !.
    
trojmian2(_, _, _, []).

/*
6 ?- trojmian2(-1,0,1,X).
X = [1.0, -1.0].

7 ?- trojmian2(1,0,1,X).
X = [].

8 ?- trojmian2(1,-2,1,X).
X = [1].
*/

% 8.7

/*
11 ?- between(1,5,X).
X = 1 ;
X = 2 ;
X = 3 ;
X = 4 ;
X = 5.
*/ 

liczba(X) :-
  between(100, 999, X),
  X mod 3 =:= 0,
  X mod 5 =:= 0,
  X mod 7 =:= 0.

/*
13 ?- liczba(X).
X = 105 ;
X = 210 ;
X = 315 ;
X = 420 ;
X = 525 ;
X = 630 ;
X = 735 ;
X = 840 ;
X = 945 ;
false.
*/
