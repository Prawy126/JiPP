-- Task 4 *

{-
Draw stages of the creation of a tree for the list [1,3,5,7,9]
-}

{-
     5
    / \
[1,3] [7,9]


     _5__
    /    \
   3     9
  / \   / \
[1] [][7] []

    _5__
   /    \
  3     9
 / \   / \
1   o 7   o
-}

-- Task 5 *

{-
1. Draw the tree that comes as a result of (add 6 bt1).

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

    __7__
   /     \
  4      10
 / \
2   5
   / \
  o   6

2. Draw the tree that comes as a result of (list2tree (tree2list (add 6 bt1)).

1. (add 6 bt1)

    _7__
   /    \
  4     10
 / \
2   5
   / \
  o   6

2. tree2list (add 6 bt1)

[2,4,5,6,7,10]

3. list2tree (tree2list (add 6 bt1)

    _6__
   /    \
  4     10
 / \   /  \
2  5  7    o

3. Elaborate on the differences between the two above trees.

!znale�c co najmniej 4/5 r�nic pomi�dzy drzewami, jak i podobie�stw

R�nice:
        Korze� drzewa :
               W pierwszym drzewie korze� to 7, kt�ry zosta� wybrany arbitralnie lub na podstawie kolejno�ci dodawania element�w.
               W drugim drzewie korze� to 6, czyli �rodkowy element z uporz�dkowanej listy warto�ci, co zapewnia bardziej r�wnowa�on� struktur�.
        Organizacja struktury :
               Pierwsze drzewo ma mniej przemy�lan� budow� � elementy s� dodawane w spos�b nieregularny, co prowadzi do nier�wnomiernego rozmieszczenia w�z��w i wi�kszej g��boko�ci niekt�rych ga��zi.
               Drugie drzewo zosta�o zbudowane metod� bardziej systematyczn�, gdzie wyb�r korzenia i rozmieszczenie element�w oparte jest na ich porz�dku, co skutkuje lepszym zr�wnowa�eniem ca�ej struktury.
        Rozk�ad warto�ci :
                W pierwszym drzewie elementy s� rozmieszczone w spos�b zale�ny od kolejno�ci ich dodawania, co mo�e prowadzi� do asymetrycznego uk�adu.
                W drugim drzewie warto�ci s� rozmieszczone wed�ug rosn�cego porz�dku, co sprawia, �e struktura jest bardziej symetryczna i zorganizowana.
        Liczba li�ci :
               W pierwszym drzewie wyst�puj� 4 li�cie (ko�cowe w�z�y bez potomk�w).
               W drugim drzewie liczba li�ci wynosi 3, co wynika z bardziej zr�wnowa�onego rozmieszczenia element�w.
Podobie�stwa:
       Zestaw warto�ci :
              Oba drzewa zawieraj� te same liczby: 2, 4, 5, 6, 7 i 10. R�nica tkwi jedynie w sposobie ich rozmieszczenia.
       Wsp�lne li�cie :
              W obu drzewach wyst�puj� takie same warto�ci jako li�cie: 2, 5 i 7. Jednak ich po�o�enie w strukturze r�ni si� � w pierwszym drzewie s� one bardziej rozproszone, a w drugim zorganizowane w spos�b bardziej r�wnomierny.
       Warto�� 6 w r�nych rolach :
              Liczba 6 wyst�puje w obu drzewach, ale pe�ni r�ne funkcje: w pierwszym drzewie jest li�ciem, natomiast w drugim pe�ni rol� korzenia.
       Poziomy drzewa :
              Obie struktury maj� trzy poziomy hierarchii: korze�, w�z�y po�rednie (ga��zie) oraz li�cie. Organizacja tych poziom�w r�ni si�, ale og�lna architektura pozostaje podobna
-}