/* Task 1 *

Get acquainted with the predicate definition.

https://pl.wikipedia.org/wiki/Predykat
*/

% 7.1

/* AND operator

1 ?- true, true.
true.

2 ?- false, true.
false.

3 ?- true, false.
false.

4 ?- false, false.
false.
*/

/* OR operator

1 ?- true; true.
true .

2 ?- true; true.
true ;
true.

3 ?- false; true.
true.

4 ?- true; false.
true .

5 ?- true; false.
true ;
false.

6 ?- false; false.
false.
*/

/* Task 2

Discuss the following example:
*/
predicate1 :- true.  % you can change true to false
predicate2 :- false. % you can change false to true
/*
12 ?- predicate1.
true.

13 ?- predicate2.
false.
*/
% instead of using ; operator

or :- predicate1 ; predicate2.

/*
1 ?- or.
true ;
false.
*/

% we usually define separate rules for each case:

or2 :- predicate1.
or2 :- predicate2.

/*
1 ?- or2.
true ;
false.
*/

/*
Paste here the solution from the console.
*/

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

% 7.1

/*
1. Czy Tomek jest m�czyzn�?

18 ?- mezczyzna(tomek).
true.

2. Czy Tomek jest kobiet�?

19 ?- kobieta(tomek).
false.

3. Kto jest rodzicem Maxa?

24 ?- rodzic(R,max).
R = ola ;
R = tomek.

4. Czyim rodzicem jest Max?

24 ?- rodzic(max,D).
D = ania ;
D = kasia.

5. Czy Ola jest matk�?

1 ?- matka(ola,_).
true.

6. Czy Ola ma matk�?

2 ?- matka(_,ola).
false.

7. Czy Tomek ma dzieci?

3 ?- rodzic(tomek,_).
true .

4 ?- ojciec(tomek,_).
true .

8. Czy Ania ma matk� i ojca?
5 ?- matka(_, ania), ojciec(_,ania).
false.

9. Kto ma wnuka? (bez dodawania nowych regu�)


6 ?- rodzic(R,D), rodzic(D,W), mezczyzna(W)
R = max,
D = kasia,
W = radek ;
false.

% R -> D -> W(m�czyzna)
*/

% 7.3

/*
Copy the monuments knowledge database from the site:

https://www.balois.pl/jipp/help
*/

panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('W�ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Krak�w').
miasto('Berlin').
miasto('Pary�').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Krak�w', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary�', 'Francja').
polozenie('Rzym', 'W�ochy').
polozenie('Wenecja', 'W�ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa�ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Ko�ci� Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie�a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa�ac Elizejski').
zabytek('Bazylika �w. Paw�a za Murami').
zabytek('Koloseum').
zabytek('Zamek �wi�tego Anio�a').
zabytek('Bazylika �w. Marka').
zabytek('Pa�ac Do��w').
zabytek('Sagrada Familia').
zabytek('Pa�ac Kryszta�owy').
zabytek('Tower Bridge').
zabytek('Pa�ac Buckingham').
zabytek('Katedra �wi�tego Paw�a').

gdzie('Pa�ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Krak�w').
gdzie('Sukiennice', 'Krak�w').
gdzie('Ko�ci� Mariacki', 'Krak�w').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie�a Eiffla', 'Pary�').
gdzie('Katedra Notre-Dame', 'Pary�').
gdzie('Pa�ac Elizejski', 'Pary�').
gdzie('Bazylika �w. Paw�a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek �wi�tego Anio�a', 'Rzym').
gdzie('Bazylika �w. Marka', 'Wenecja').
gdzie('Pa�ac Do��w', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa�ac Kryszta�owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa�ac Buckingham', 'Londyn').
gdzie('Katedra �wi�tego Paw�a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W�ochy').
obok('Francja', 'Hiszpania').

/* Overview of the monuments knowledge database

Properties:

country   C
city      T
monument  M

Relations:

location  T ~ C
where     M ~ T
next      C1 ~ C2
*/
/* Task 3

Is the relation next symmetric?
*/

/*
Polska ~ Niemcy
Niemcy ~ Polska (nie zachodzi)
*/

% 7.3

/*
polozenie M ~ P
gdzie Z ~ M
obok P1 ~ P2
*/

/*
1. Jakie zabytki znajduj� si� w Berlinie?

9 ?- gdzie(Z, 'Berlin'), zabytek(Z).
Z = 'Brama Brandenburska' ;
Z = 'Reichstag'.

2. Jakie miasta znajduj� si� w Hiszpani?

9 ?- polozenie(M, 'Hiszpania'), miasto(M).
M = 'Barcelona' ;
M = 'Madryt'.

3. Jakie zabytki znajduj� si� we W�oszech?

10 ?-  gdzie(Z,M), polozenie(M, 'W�ochy'), zabytek(Z), miasto(M).
Z = 'Bazylika �w. Paw�a za Murami',
M = 'Rzym' ;
Z = 'Koloseum',
M = 'Rzym' ;
Z = 'Zamek �wi�tego Anio�a',
M = 'Rzym' ;
Z = 'Bazylika �w. Marka',
M = 'Wenecja' ;
Z = 'Pa�ac Do��w',
M = 'Wenecja' ;
false.

4. W jakim mie�cie znajduje si� Bazylika �w. Paw�a za Murami?

12 ?- gdzie('Bazylika �w. Paw�a za Murami', M), miasto(M).
M = 'Rzym'.

5. W jakim pa�stwie jest Sagrada Familia?

16 ?- polozenie(M, P), gdzie('Sagrada Familia', M), miasto(M), panstwo(P).
M = 'Barcelona',
P = 'Hiszpania' ;
false.

6. Jakie zabytki mo�na zwiedza� w Pa�stwach s�siaduj�cych z Francj�?

17 ?- (obok('Francja',P); obok(P,'Francja')), polozenie(M, P), gdzie(Z, M), pans
two(P), miasto(M), zabytek(Z).
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Tower Bridge' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Pa�ac Buckingham' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Katedra �wi�tego Paw�a' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Bazylika �w. Paw�a za Murami' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Koloseum' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Zamek �wi�tego Anio�a' ;
P = 'W�ochy',
M = 'Wenecja',
Z = 'Bazylika �w. Marka' ;
P = 'W�ochy',
M = 'Wenecja',
Z = 'Pa�ac Do��w' ;
P = 'Hiszpania',
M = 'Barcelona',
Z = 'Sagrada Familia' ;
P = 'Hiszpania',
M = 'Madryt',
Z = 'Pa�ac Kryszta�owy' ;
P = 'Niemcy',
M = 'Berlin',
Z = 'Brama Brandenburska' ;
P = 'Niemcy',
M = 'Berlin',
Z = 'Reichstag'.

*/

/*
solution here
*/
/* Task 4

Additionally, for the task 7.3.6 define equivalent rules 
neighbor and neighbor2 in two ways and use them in queries.

Should the neighbor and neighbor2 rules be symmetric?
*/

sasiad(P1, P2) :- obok(P1,P2); obok(P2, P1).

sasiad2(P1, P2) :- obok(P1,P2).
sasiad2(P1, P2) :- obok(P2, P1).

/*
19 ?- sasiad(P, 'Francja'), polozenie(M, P), gdzie(Z, M), panstwo(P), miasto(M),
 zabytek(Z).
P = 'Niemcy',
M = 'Berlin',
Z = 'Brama Brandenburska' ;
P = 'Niemcy',
M = 'Berlin',
Z = 'Reichstag' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Tower Bridge' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Pa�ac Buckingham' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Katedra �wi�tego Paw�a' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Bazylika �w. Paw�a za Murami' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Koloseum' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Zamek �wi�tego Anio�a' ;
P = 'W�ochy',
M = 'Wenecja',
Z = 'Bazylika �w. Marka' ;
P = 'W�ochy',
M = 'Wenecja',
Z = 'Pa�ac Do��w' ;
P = 'Hiszpania',
M = 'Barcelona',
Z = 'Sagrada Familia' ;
P = 'Hiszpania',
M = 'Madryt',
Z = 'Pa�ac Kryszta�owy'.

20 ?- sasiad2(P, 'Francja'), polozenie(M, P), gdzie(Z, M), panstwo(P), miasto(M)
, zabytek(Z).
P = 'Niemcy',
M = 'Berlin',
Z = 'Brama Brandenburska' ;
P = 'Niemcy',
M = 'Berlin',
Z = 'Reichstag' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Tower Bridge' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Pa�ac Buckingham' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Katedra �wi�tego Paw�a' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Bazylika �w. Paw�a za Murami' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Koloseum' ;
P = 'W�ochy',
M = 'Rzym',
Z = 'Zamek �wi�tego Anio�a' ;
P = 'W�ochy',
M = 'Wenecja',
Z = 'Bazylika �w. Marka' ;
P = 'W�ochy',
M = 'Wenecja',
Z = 'Pa�ac Do��w' ;
P = 'Hiszpania',
M = 'Barcelona',
Z = 'Sagrada Familia' ;
P = 'Hiszpania',
M = 'Madryt',
Z = 'Pa�ac Kryszta�owy'.
*/