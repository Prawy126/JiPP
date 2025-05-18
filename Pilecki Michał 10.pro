% 8.4
panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('Włochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Kraków').
miasto('Berlin').
miasto('Paryż').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Paryż', 'Francja').
polozenie('Rzym', 'Włochy').
polozenie('Wenecja', 'Włochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pałac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Kościół Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wieża Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pałac Elizejski').
zabytek('Bazylika Świętego Pawła za Murami').
zabytek('Koloseum').
zabytek('Zamek Świętego Anioła').
zabytek('Bazylika Świętego Marka').
zabytek('Pałac Dogłów').
zabytek('Sagrada Familia').
zabytek('Pałac Kryształowy').
zabytek('Tower Bridge').
zabytek('Pałac Buckingham').
zabytek('Katedra Świętego Pawła').

gdzie('Pałac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Kościół Mariacki', 'Kraków').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wieża Eiffla', 'Paryż').
gdzie('Katedra Notre-Dame', 'Paryż').
gdzie('Pałac Elizejski', 'Paryż').
gdzie('Bazylika Świętego Pawła za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Świętego Anioła', 'Rzym').
gdzie('Bazylika Świętego Marka', 'Wenecja').
gdzie('Pałac Dogłów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pałac Kryształowy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pałac Buckingham', 'Londyn').
gdzie('Katedra Świętego Pawła', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'Włochy').
obok('Francja', 'Hiszpania').

/*
(*) zabytki_p(P), która wypisuje na ekranie wszystkie zabytki znajdujące się w państwie P (każdy w oddzielnej linii).
(*) zabytki_ps(P), która wypisuje na ekranie wszystkie zabytki znajdujące się w państwie P (każdy w oddzielnej linii, łącznie z nazwą miasta i państwa) i w państwach sąsiednich.
*/

zabytki_p(P) :-
    write('Zabytki w '), write(P), writeln(':'),
    polozenie(Miasto, P),
    gdzie(Zabytek, Miasto),
    write('- '), write(Zabytek), write(' ('), write(Miasto), write(')'), nl,
    fail.
zabytki_p(_).

/*
zabytki_p(P).
Zabytki w _32262:
- Pałac w Wilanowie (Warszawa)
- Kolumna Zygmunta III Wazy (Warszawa)
- Wawel (Kraków)
- Sukiennice (Kraków)
- Kościół Mariacki (Kraków)
- Brama Brandenburska (Berlin)
- Reichstag (Berlin)
- Wieża Eiffla (Paryż)
- Katedra Notre-Dame (Paryż)
- Pałac Elizejski (Paryż)
- Bazylika Świętego Pawła za Murami (Rzym)
- Koloseum (Rzym)
- Zamek Świętego Anioła (Rzym)
- Bazylika Świętego Marka (Wenecja)
- Pałac Dogłów (Wenecja)
- Sagrada Familia (Barcelona)
- Pałac Kryształowy (Madryt)
- Tower Bridge (Londyn)
- Pałac Buckingham (Londyn)
- Katedra Świętego Pawła (Londyn)
true.

*/

zabytki_ps(P) :-
    write('Zabytki w '), write(P), write(' i państwach sąsiednich:'), nl,
    (
        polozenie(Miasto, P),
        gdzie(Zabytek, Miasto),
        write('- '), write(Zabytek), write(' ('), write(Miasto), write(', '), write(P), write(')'), nl,
        fail
    ;
        obok(P, Sasiad),
        polozenie(Miasto, Sasiad),
        gdzie(Zabytek, Miasto),
        write('- '), write(Zabytek), write(' ('), write(Miasto), write(', '), write(Sasiad), write(')'), nl,
        fail
    ).
zabytki_ps(_).



/*
?- zabytki_ps(P).
Zabytki w _31830 i państwach sąsiednich:
- Pałac w Wilanowie (Warszawa, Polska)
- Kolumna Zygmunta III Wazy (Warszawa, Polska)
- Wawel (Kraków, Polska)
- Sukiennice (Kraków, Polska)
- Kościół Mariacki (Kraków, Polska)
- Brama Brandenburska (Berlin, Niemcy)
- Reichstag (Berlin, Niemcy)
- Wieża Eiffla (Paryż, Francja)
- Katedra Notre-Dame (Paryż, Francja)
- Pałac Elizejski (Paryż, Francja)
- Bazylika Świętego Pawła za Murami (Rzym, Włochy)
- Koloseum (Rzym, Włochy)
- Zamek Świętego Anioła (Rzym, Włochy)
- Bazylika Świętego Marka (Wenecja, Włochy)
- Pałac Dogłów (Wenecja, Włochy)
- Sagrada Familia (Barcelona, Hiszpania)
- Pałac Kryształowy (Madryt, Hiszpania)
- Tower Bridge (Londyn, Wielka Brytania)
- Pałac Buckingham (Londyn, Wielka Brytania)
- Katedra Świętego Pawła (Londyn, Wielka Brytania)
- Brama Brandenburska (Berlin, Niemcy)
- Reichstag (Berlin, Niemcy)
- Wieża Eiffla (Paryż, Francja)
- Katedra Notre-Dame (Paryż, Francja)
- Pałac Elizejski (Paryż, Francja)
- Tower Bridge (Londyn, Wielka Brytania)
- Pałac Buckingham (Londyn, Wielka Brytania)
- Katedra Świętego Pawła (Londyn, Wielka Brytania)
- Bazylika Świętego Pawła za Murami (Rzym, Włochy)
- Koloseum (Rzym, Włochy)
- Zamek Świętego Anioła (Rzym, Włochy)
- Bazylika Świętego Marka (Wenecja, Włochy)
- Pałac Dogłów (Wenecja, Włochy)
- Sagrada Familia (Barcelona, Hiszpania)
- Pałac Kryształowy (Madryt, Hiszpania)
true.

*/

% 8.6

/*


(*) Zdefiniuj rekurencyjny predykat seq/2, wyznaczający wartość n-tego wyrazu ciągu liczbowego zdefiniowanego następująco:

    seq_1 = 3
    seq_2 = 4
    seq_n = seq_n-1 + 3*seq_n-2, dla n > 2


*/

seq(1, 3).
seq(2, 4).
seq(N, X) :-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    seq(N1, X1),
    seq(N2, X2),
    X is X1 + 3 * X2.

/*
?- seq(5,X).
X = 64 ;

- seq(1,X).
X = 3 ;
false.

?- seq(2,X).
X = 4 
Unknown action: ' (h for help)
Action? ;
false.


*/

% 8.7
/*

Przeanalizuj poniższy kod. Jakie zadanie realizuje predykat liczba/1?

liczba(X) :-
  between(100, 999, X),
  X mod 3 =:= 0,
  X mod 5 =:= 0,
  X mod 7 =:= 0.

(*) Napisz program w Prologu rozwiązujący następującą zagadkę: W skrzyni znajdują się złote monety. Jest ich mniej niż 100. Jeśli będą wyjmowane po 3, to w skrzyni zostanie 1. Jeśli będą wyjmowane po 4, to w skrzyni zostaną 2. Jeśli będą wyjmowane po 5, to w skrzyni zostaną 3. Jeśli będą wyjmowane po 6, to w skrzyni zostaną 4. Ile monet jest w skrzyni?

*/

monety(X) :-
    between(1, 99, X),
    X mod 3 =:= 1,
    X mod 4 =:= 2,
    X mod 5 =:= 3,
    X mod 6 =:= 4.

/*
?- monety(X).
X = 58 ;
false.
*/

rozwiazanie(A, B, C) :-
    between(1, 9, A), 
    between(0, 9, B),
    between(0, 9, C),
    B \= C,             
    Liczba1 is 100*A + 10*B + C,
    Liczba2 is 100*A + 10*C + B,
    Suma is Liczba1 + Liczba2,
    Suma =:= 1187.

/*
?- rozwiazanie(A, B, C).
A = 5,
B = 8,
C = 9 ;
A = 5,
B = 9,
C = 8 ;
false.

*/

% 8.8

/*

(*) Napisz program w Prologu rozwiązujący następujące zadanie: W pewnej liczbie trzycyfrowej zamieniono cyfrę dziesiątek z cyfrą jedności, tworząc w ten sposób nową liczbę trzycyfrową. Suma obu liczb jest równa 1187. Znajdź te liczby. Czy rozwiązanie jest jednoznaczne? 

*/
szukaj(Liczba1, Liczba2) :-
    between(100, 999, Liczba1),  
    A is Liczba1 // 100,          
    B is (Liczba1 // 10) mod 10,    
    C is Liczba1 mod 10,          

    Liczba2 is 100*A + 10*C + B,   

    Liczba1 + Liczba2 =:= 1187.

/*
?- szukaj(X, Y).
X = 589,
Y = 598 ;
X = 598,
Y = 589 ;
false.

*/

/*
Nie, bo istnieją dwie liczby: 589 i 598, które zamieniają się miejscami i tworzą parę, których suma to 1187. Więc zadanie ma dokładnie dwa rozwiązania
*/

