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

% 7.1.9

% G -> P -> K (man)

% 7.2 *

/*
Place the solution in a separate file, for example, lab7_2.pro
*/

% 7.3

/*
Copy the monuments knowledge database from the site:

https://www.balois.pl/jipp/help
*/

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
solution here
*/

/* Task 4

Additionally, for the task 7.3.6 define equivalent rules 
neighbor and neighbor2 in two ways and use them in queries.

Should the neighbor and neighbor2 rules be symmetric?
*/
