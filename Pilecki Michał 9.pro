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
  
/* Task 1 *

Get acquainted with the predicate definition.

https://pl.wikipedia.org/wiki/Predykat
*/

/*
2 ?- mather(ola, tomek).
false.

2 ?- mather(ola, max).
true.

3 ?- father(ola, max).
false.

4 ?- father(tomek, lila)
.
true.

5 ?-
*/

% 7.1

/*


(*) Kto ma prawnuka? (bez dodawania nowych regu³)

2 ?- rodzic(R,D), rodzic(D,X), rodzic(X,W), mezczyzna(W).
R = ola,
D = max,
X = kasia,
W = radek ;
R = tomek,
D = max,
X = kasia,
W = radek ;
false.

(*) Czy Ola jest kobiet¹?

3 ?- kobieta(ola).
true.

(*) Kto jest mê¿czyzn¹?

8 ?- mezczyzna(X).
X = tomek ;
X = max ;
X = radek.

(*) Kto jest matk¹ Maxa?

4 ?- mezczyzna(X).
X = tomek ;
X = max ;
X = radek.

(*) Kto jest ojcem Maxa?
2 ?- ojciec(_,max).
true.

3 ?- ojciec(X,max).
X = tomek.

(*) Kto ma matkê i ojca?
4 ?- ojciec(F,D), matka(M,D).
F = M, M = tomek,
D = max ;
F = M, M = tomek,
D = lila ;
F = M, M = max,
D = ania ;
F = M, M = max,
D = kasia ;
false.

(*) Kto ma wnuczkê? (bez dodawania nowych regu³)
7 ?- rodzic(D,X), rodzic(X,W), kobieta(W).
D = ola,
X = max,
W = ania ;
D = ola,
X = max,
W = kasia ;
D = tomek,
X = max,
W = ania ;
D = tomek,
X = max,
W = kasia ;
false.

7 ?-

(*) Kto ma prawnuczkê? (bez dodawania nowych regu³)
7 ?- parent(Y,D), parent(D,X), parent(X,W), women(W).
Correct to: "woman(W)"? yes
false.
*/

% 7.2.1
% wnuk/wnuczka
wnuk(D, W) :-          % D ma wnuka W
    rodzic(D, X),
    rodzic(X, W),
    mezczyzna(W).

wnuczka(D, Z) :-       % D ma wnuczkê Z
    rodzic(D, X),
    rodzic(X, Z),
    kobieta(Z).

% prawnuk/prawnuczka
prawnuk(G, P) :-       % G ma prawnuka P
    rodzic(G, D),
    rodzic(D, X),
    rodzic(X, P),
    mezczyzna(P).

prawnuczka(G, Q) :-    % G ma prawnuczkê Q
    rodzic(G, D),
    rodzic(D, X),
    rodzic(X, Q),
    kobieta(Q).

/*
10 ?- wnuk(D,W).
D = max,
W = radek ;
false.

11 ?- wnuczka(D,W).
D = ola,
W = ania ;
D = ola,
W = kasia ;
D = tomek,
W = ania ;
D = tomek,
W = kasia ;
false.

12 ?- prawnuk(G,P).
G = ola,
P = radek ;
G = tomek,
P = radek ;
false.

13 ?- prawnuczka(G,P).
false.
*/

% 7.2.2

/*
14 ?- listing.

:- multifile prolog_list_goal/1.


:- dynamic term_expansion/2.
:- multifile term_expansion/2.


:- dynamic resource/3.
:- multifile resource/3.


prawnuczka(G, Q) :-
    rodzic(G, D),
    rodzic(D, X),
    rodzic(X, Q),
    kobieta(Q).

:- dynamic file_search_path/2.
:- multifile file_search_path/2.

file_search_path(library, Dir) :-
    library_directory(Dir).
file_search_path(swi, A) :-
    system:current_prolog_flag(home, A).
file_search_path(swi, A) :-
    system:current_prolog_flag(shared_home, A).
file_search_path(library, app_config(lib)).
file_search_path(library, swi(library)).
file_search_path(library, swi(library/clp)).
file_search_path(library, A) :-
    system:'$ext_library_directory'(A).
file_search_path(foreign, swi(A)) :-
    system:
    (   current_prolog_flag(apple_universal_binary, true),
        A='lib/fat-darwin'
    ).
file_search_path(path, A) :-
    system:
    (   getenv('PATH', B),
        current_prolog_flag(path_sep, C),
        atomic_list_concat(D, C, B),
        '$member'(A, D)
    ).
file_search_path(user_app_data, A) :-
    system:'$xdg_prolog_directory'(data, A).
file_search_path(common_app_data, A) :-
    system:'$xdg_prolog_directory'(common_data, A).
file_search_path(user_app_config, A) :-
    system:'$xdg_prolog_directory'(config, A).
file_search_path(common_app_config, A) :-
    system:'$xdg_prolog_directory'(common_config, A).
file_search_path(app_data, user_app_data('.')).
file_search_path(app_data, common_app_data('.')).
file_search_path(app_config, user_app_config('.')).
file_search_path(app_config, common_app_config('.')).
file_search_path(app_preferences, user_app_config('.')).
file_search_path(user_profile, app_preferences('.')).
file_search_path(app, swi(app)).
file_search_path(app, app_data(app)).
file_search_path(autoload, swi(library)).
file_search_path(autoload, pce(prolog/lib)).
file_search_path(autoload, app_config(lib)).
file_search_path(autoload, Dir) :-
    '$autoload':'$ext_library_directory'(Dir).
file_search_path(pack, app_data(pack)).
file_search_path(library, PackLib) :-
    '$pack':pack_dir(_Name, prolog, PackLib).
file_search_path(foreign, PackLib) :-
    '$pack':pack_dir(_Name, foreign, PackLib).
file_search_path(app, AppDir) :-
    '$pack':pack_dir(_Name, app, AppDir).

:- multifile message_property/2.


wnuczka(D, Z) :-
    rodzic(D, X),
    rodzic(X, Z),
    kobieta(Z).

prawnuk(G, P) :-
    rodzic(G, D),
    rodzic(D, X),
    rodzic(X, P),
    mezczyzna(P).

:- dynamic library_directory/1.
:- multifile library_directory/1.


wnuk(D, W) :-
    rodzic(D, X),
    rodzic(X, W),
    mezczyzna(W).

:- dynamic expand_answer/2.
:- multifile expand_answer/2.


ojciec(X, Y) :-
    rodzic(X, Y),
    mezczyzna(X).

:- dynamic prolog_file_type/2.
:- multifile prolog_file_type/2.

prolog_file_type(pl, prolog).
prolog_file_type(prolog, prolog).
prolog_file_type(qlf, prolog).
prolog_file_type(qlf, qlf).
prolog_file_type(A, executable) :-
    system:current_prolog_flag(shared_object_extension, A).
prolog_file_type(dylib, executable) :-
    system:current_prolog_flag(apple, true).

:- dynamic prolog_load_file/2.
:- multifile prolog_load_file/2.


matka(X, Y) :-
    rodzic(X, Y),
    kobieta(X).

rodzic(ola, max).
rodzic(tomek, max).
rodzic(tomek, lila).
rodzic(max, ania).
rodzic(max, kasia).
rodzic(kasia, radek).

:- multifile prolog_predicate_name/2.


:- dynamic exception/3.
:- multifile exception/3.


:- multifile prolog_clause_name/2.


:- dynamic expand_query/4.
:- multifile expand_query/4.


:- dynamic portray/1.
:- multifile portray/1.


:- dynamic goal_expansion/2.
:- multifile goal_expansion/2.


:- thread_local thread_message_hook/3.
:- dynamic thread_message_hook/3.
:- volatile thread_message_hook/3.


mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).

:- dynamic resource/2.
:- multifile resource/2.


:- dynamic goal_expansion/4.
:- multifile goal_expansion/4.


:- dynamic message_hook/3.
:- multifile message_hook/3.


:- dynamic term_expansion/4.
:- multifile term_expansion/4.


kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
true.

15 ?- listing(rodzic).
rodzic(ola, max).
rodzic(tomek, max).
rodzic(tomek, lila).
rodzic(max, ania).
rodzic(max, kasia).
rodzic(kasia, radek).

true.

16 ?- listing([rodzic, prawnuk]).
rodzic(ola, max).
rodzic(tomek, max).
rodzic(tomek, lila).
rodzic(max, ania).
rodzic(max, kasia).
rodzic(kasia, radek).

prawnuk(G, P) :-
    rodzic(G, D),
    rodzic(D, X),
    rodzic(X, P),
    mezczyzna(P).

true.
*/

% 7.3

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


/*
(*) Jakie zabytki mo¿na zwiedzaæ w pañstwie, w którym znajduje siê Barcelona?

21 ?- gdzie(Z,'Barcelona').
Z = 'Sagrada Familia'.

(*) Jakie miasta znajduj¹ siê w Pañstwach s¹siaduj¹cych z Niemcami?

23 ?- obok('Niemcy', P), polozenie(M,P).
P = 'Francja',
M = 'Pary¿'.

24 ?- obok(P,'Niemcy'), polozenie(M,P).
P = 'Polska',
M = 'Warszawa' ;
P = 'Polska',
M = 'Kraków'.


(*) Czy w Wielkiej Brytanii znajduj¹ siê jakieœ zabytki?

26 ?- polozenie(P, 'Wielka Brytania'), gdzie(Z,P).
P = 'Londyn',
Z = 'Tower Bridge' ;
P = 'Londyn',
Z = 'Pa³ac Buckingham' ;
P = 'Londyn',
Z = 'Katedra Œwiêtego Paw³a'.

(*) Czy istnieje pañstwo, które s¹siaduje z pañstwem, w którym znajduje siê Madryt?
28 ?- polozenie('Madryt', P), obok(P,S).
false.

28 ?- polozenie('Madryt', P), obok(S,P).
P = 'Hiszpania',
S = 'Francja'.
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
  
brat(X, Y) :-
  rodzic(R, X),
  rodzic(R,Y),
  mezczyzna(X),
  X \= Y.

rodzina(X, Y, Z1, Z2) :-
  kobieta(X),
  mezczyzna(Y),
  matka(X,Z1),
  matka(X,Z2),
  ojciec(Y,Z1),
  ojciec(Y,Z2),
  Z2 \= Z1.

/*

8.1.3

1 ?- bat(X,Y).
Correct to: "brat(X,Y)"? yes
X = max,
Y = lila ;
false.


8.1.4

rodzina bez sprawdzania czy Z1 i Z2 to to samo dziecko

4 ?- rodzina(X, Y, Z1, Z2).
X = ola,
Y = tomek,
Z1 = Z2, Z2 = max ;
false.

rodzina z warunkiem sprawdzania czy Z1 i Z2 to to samo dzieko, jak widzimy aktualnie w bazie danych nie ma rodziny, która posiada wiêcej ni¿ 1 dziecko

6 ?- rodzina(X, Y, Z1, Z2).
false.

*/

% 8.3.2

potomek(X,Y) :- rodzic(Y,X).
potomek(X,Y) :- rodzic(Y,Z), potomek(X,Z).

potomkowie(X) :-
    writeln('Potomkowie:'),
    potomek(X, Y),
    write(Y), nl,
    fail.

potomkowie(_) :-
    true.
    
/*

14 ?- potomkowie(X).
Potomkowie:
ola
tomek
tomek
max
max
kasia
ola
ola
ola
tomek
tomek
tomek
max
true.
*/


