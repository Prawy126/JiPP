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


dobrapizza(Tak, Nie) :-
   pizza(Nie, _),
   lubi(Tak, S1),
   lubi(Tak, S2),
   S1 \= S2,
   skladnik(S1, Nie),
   skladnik(S2, Nie).

drop(0, X, X) :- !.
drop(N, [_|T], Y) :-
  N > 0, 
  N1 is N - 1,
  drop(N1, T, Y).

