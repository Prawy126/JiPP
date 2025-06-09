kobieta(ola).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).
mezczyzna(maks).
mezczyzna(adam).

pizza(capriciosa, 24.901).
pizza(roma, 27.00).
pizza(califfo, 30.40).

skladnik(ser, capriciosa).
skladnik(szynka, capriciosa).
skladnik(pieczarki, capriciosa).

skladnik(ser, roma).
skladnik(salami, roma).
skladnik(kabanosy, roma).
skladnik(papryka, roma).

skladnik(ser, califfo).
skladnik(szynka, califfo).
skladnik(kabanosy, califfo).
skladnik(papryka, califfo).
skladnik(oliwki, califfo).

lubi(ola, szynka).
lubi(ola, oliwki).

lubi(kasia, szynka).
lubi(kasia, salami).

lubi(ania, oliwki).
lubi(ania, papryka).
lubi(ania, pieczarki).

lubi(tomek, szynka).
lubi(tomek, oliwki).

lubi(maks, salami).
lubi(maks, szynka).
lubi(maks, kabanosy).
lubi(maks, pieczarki).

lubi(adam, szynka).

% zadanie 2 - poprawne
dobrapizza(Osoba, Pizza) :-
   pizza(Pizza,_),
   lubi(Osoba, S1),
   lubi(Osoba, S2),
   S1 \= S2,
   skladnik(S1, Pizza),
   skladnik(S2, Pizza).

% zadanie 3
suma(Wynik) :-
    suma_aux(2, 0, Wynik).

suma_aux(I, Acc, Wynik) :-
    I =< 1000,
    Licznik is I + 1,
    Mianownik is I*I + 2,
    NowyAcc is Acc + (Licznik / Mianownik),
    NextI is I + 1,
    suma_aux(NextI, NowyAcc, Wynik).
suma_aux(_, Acc, Acc).

% zadanie 4 - poprawne
drogo(0, X, X) :- !.
drogo(N, [_|T], Y) :-
    N > 0,
    N1 is N - 1,
    drogo(N1, T, Y).

% zadanie 5 - poprawione
assign([], _).
assign([V|Vs], L) :-
    select(V, L, Reszta),
    assign(Vs, Reszta).

szescian(Rozwiazanie) :-
   Rozwiazanie = [A,B,C,D,E,F,G,H],
   Liczby = [1,2,3,4,5,6,7,8],
   assign(Rozwiazanie, Liczby),

   Sciana1 = [A,B,C,D],
   Sciana2 = [E,F,G,H],
   Sciana3 = [A,B,F,E],
   Sciana4 = [C,D,H,G],
   Sciana5 = [A,D,H,E],
   Sciana6 = [B,C,G,F],

   suma_sciany(Sciana1, Suma),
   suma_sciany(Sciana2, Suma),
   suma_sciany(Sciana3, Suma),
   suma_sciany(Sciana4, Suma),
   suma_sciany(Sciana5, Suma),
   suma_sciany(Sciana6, Suma).

% Wersja z własnym sumowaniem jeśli sum_list nie działa
suma_sciany(Sciana, Suma) :-
    suma_lista(Sciana, Suma).

suma_lista([], 0).
suma_lista([H|T], Suma) :-
    suma_lista(T, SumaT),
    Suma is H + SumaT.

bez_dwoch_ostatnich(X, Y) :-
    append(Y, [_, _], X).

take(1, [H|_], H) :- !.
take(N, [_|T],E) :-
   N > 1,
   N1 is N - 1,
   take(N1, T, E).

last([X], X) :- !.
last([_|T], X) :- last(T,X).

init([_], []) :- !.
init([H|T], [H|Res]) :- init(T, Res).

append2([], L, L).
append2([H|T], L2, [H|Res]) :- append(T, L2, Res).