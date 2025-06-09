% Fakty dotyczące płci
kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
kobieta(ewa).

mezczyzna(tomek).
mezczyzna(adam).
mezczyzna(bada).
mezczyzna(karol).
mezczyzna(wojtek).
mezczyzna(artur).

% Relacje rodzicielskie (matka)
matka(ola, lila).
matka(lila, kasia).
matka(lila, ania).
matka(kasia, wojtek).
matka(ania, karol).

% Relacje rodzicielskie (ojciec)
ojciec(tomek, lila).
ojciec(tomek, kasia).
ojciec(adam, karol).
ojciec(adam, wojtek).
ojciec(adam, ania).

% Dane adresowe
adres(ola, krakow, kwiatowa).
adres(tomek, krakow, wiosenna).
adres(lila, krakow, wiosenna).
adres(artur, krakow, wiosenna).
adres(kasia, wieliczka, kwiatowa).
adres(adam, wieliczka, kwiatowa).
adres(wojtek, wieliczka, kwiatowa).
adres(ania, krakow, wiosenna).

% Zadanie 2
dziadek(X, Y) :-
    (ojciec(X, Z); matka(X, Z)),
    (ojciec(Z, Y); matka(Z, Y)).

siostra(X, Y) :-
    kobieta(X),
    X \= Y,
    ((ojciec(Z, X), ojciec(Z, Y));
     (matka(Z, X), matka(Z, Y))).

ciag(1, 0).
ciag(2, 2).
ciag(N, Wynik) :-
   N > 2,
   N1 is N - 1,
   N2 is N - 2,
   ciag(N1, W1),
   ciag(N2, W2),
   Wynik is W1 + 2*W2.

max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, MaxT),
    (H > MaxT -> Max = H; Max = MaxT).

% BRAKUJĄCY PREDYKAT assign/2
assign([], _).
assign([V|Vs], L) :-
    select(V, L, Reszta),
    assign(Vs, Reszta).

% Zamiast redefiniować sum_list/2, użyjemy własnego predykatu:
moja_suma_listy([], 0).
moja_suma_listy([H|T], Suma) :-
    moja_suma_listy(T, SumaT),
    Suma is H + SumaT.

gwiazda(Rozwiazanie) :-
    Rozwiazanie = [A,B,C,D,E,F,G,H,I,J,K,L],
    Liczby = [1,2,3,4,5,6,7,8,9,10,11,12],
    assign(Rozwiazanie, Liczby),

    % Linie w gwieździe
    Linia1 = [A,B,C,D],
    Linia2 = [D,E,F,G],
    Linia3 = [G,H,I,J],
    Linia4 = [J,K,L,A],
    Linia5 = [L,B,E,H],
    Linia6 = [H,C,F,K],
    Linia7 = [K,E,A,I],
    Linia8 = [I,F,B,J],
    Linia9 = [J,E,C,L],
    Linia10 = [L,F,D,H],

    % Sprawdzenie sum (moją_suma_listy zamiast sum_list)
    moja_suma_listy(Linia1, 26),
    moja_suma_listy(Linia2, 26),
    moja_suma_listy(Linia3, 26),
    moja_suma_listy(Linia4, 26),
    moja_suma_listy(Linia5, 26),
    moja_suma_listy(Linia6, 26),
    moja_suma_listy(Linia7, 26),
    moja_suma_listy(Linia8, 26),
    moja_suma_listy(Linia9, 26),
    moja_suma_listy(Linia10, 26).