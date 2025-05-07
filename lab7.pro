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
1. Czy Tomek jest mê¿czyzn¹?

18 ?- mezczyzna(tomek).
true.

2. Czy Tomek jest kobiet¹?

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

5. Czy Ola jest matk¹?

1 ?- matka(ola,_).
true.

6. Czy Ola ma matkê?

2 ?- matka(_,ola).
false.

7. Czy Tomek ma dzieci?

3 ?- rodzic(tomek,_).
true .

4 ?- ojciec(tomek,_).
true .

8. Czy Ania ma matkê i ojca?
5 ?- matka(_, ania), ojciec(_,ania).
false.

9. Kto ma wnuka? (bez dodawania nowych regu³)


6 ?- rodzic(R,D), rodzic(D,W), mezczyzna(W)
R = max,
D = kasia,
W = radek ;
false.

% R -> D -> W(mê¿czyzna)
*/

% 7.3

/*
Copy the monuments knowledge database from the site:

https://www.balois.pl/jipp/help
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
1. Jakie zabytki znajduj¹ siê w Berlinie?

9 ?- gdzie(Z, 'Berlin'), zabytek(Z).
Z = 'Brama Brandenburska' ;
Z = 'Reichstag'.

2. Jakie miasta znajduj¹ siê w Hiszpani?

9 ?- polozenie(M, 'Hiszpania'), miasto(M).
M = 'Barcelona' ;
M = 'Madryt'.

3. Jakie zabytki znajduj¹ siê we W³oszech?

10 ?-  gdzie(Z,M), polozenie(M, 'W³ochy'), zabytek(Z), miasto(M).
Z = 'Bazylika œw. Paw³a za Murami',
M = 'Rzym' ;
Z = 'Koloseum',
M = 'Rzym' ;
Z = 'Zamek Œwiêtego Anio³a',
M = 'Rzym' ;
Z = 'Bazylika œw. Marka',
M = 'Wenecja' ;
Z = 'Pa³ac Do¿ów',
M = 'Wenecja' ;
false.

4. W jakim mieœcie znajduje siê Bazylika œw. Paw³a za Murami?

12 ?- gdzie('Bazylika œw. Paw³a za Murami', M), miasto(M).
M = 'Rzym'.

5. W jakim pañstwie jest Sagrada Familia?

16 ?- polozenie(M, P), gdzie('Sagrada Familia', M), miasto(M), panstwo(P).
M = 'Barcelona',
P = 'Hiszpania' ;
false.

6. Jakie zabytki mo¿na zwiedzaæ w Pañstwach s¹siaduj¹cych z Francj¹?

17 ?- (obok('Francja',P); obok(P,'Francja')), polozenie(M, P), gdzie(Z, M), pans
two(P), miasto(M), zabytek(Z).
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Tower Bridge' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Pa³ac Buckingham' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Katedra Œwiêtego Paw³a' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Bazylika œw. Paw³a za Murami' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Koloseum' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Zamek Œwiêtego Anio³a' ;
P = 'W³ochy',
M = 'Wenecja',
Z = 'Bazylika œw. Marka' ;
P = 'W³ochy',
M = 'Wenecja',
Z = 'Pa³ac Do¿ów' ;
P = 'Hiszpania',
M = 'Barcelona',
Z = 'Sagrada Familia' ;
P = 'Hiszpania',
M = 'Madryt',
Z = 'Pa³ac Kryszta³owy' ;
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
Z = 'Pa³ac Buckingham' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Katedra Œwiêtego Paw³a' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Bazylika œw. Paw³a za Murami' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Koloseum' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Zamek Œwiêtego Anio³a' ;
P = 'W³ochy',
M = 'Wenecja',
Z = 'Bazylika œw. Marka' ;
P = 'W³ochy',
M = 'Wenecja',
Z = 'Pa³ac Do¿ów' ;
P = 'Hiszpania',
M = 'Barcelona',
Z = 'Sagrada Familia' ;
P = 'Hiszpania',
M = 'Madryt',
Z = 'Pa³ac Kryszta³owy'.

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
Z = 'Pa³ac Buckingham' ;
P = 'Wielka Brytania',
M = 'Londyn',
Z = 'Katedra Œwiêtego Paw³a' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Bazylika œw. Paw³a za Murami' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Koloseum' ;
P = 'W³ochy',
M = 'Rzym',
Z = 'Zamek Œwiêtego Anio³a' ;
P = 'W³ochy',
M = 'Wenecja',
Z = 'Bazylika œw. Marka' ;
P = 'W³ochy',
M = 'Wenecja',
Z = 'Pa³ac Do¿ów' ;
P = 'Hiszpania',
M = 'Barcelona',
Z = 'Sagrada Familia' ;
P = 'Hiszpania',
M = 'Madryt',
Z = 'Pa³ac Kryszta³owy'.
*/