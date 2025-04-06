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

!znaleŸc co najmniej 4/5 ró¿nic pomiêdzy drzewami, jak i podobieñstw

Ró¿nice:
        Korzeñ drzewa :
               W pierwszym drzewie korzeñ to 7, który zosta³ wybrany arbitralnie lub na podstawie kolejnoœci dodawania elementów.
               W drugim drzewie korzeñ to 6, czyli œrodkowy element z uporz¹dkowanej listy wartoœci, co zapewnia bardziej równowa¿on¹ strukturê.
        Organizacja struktury :
               Pierwsze drzewo ma mniej przemyœlan¹ budowê – elementy s¹ dodawane w sposób nieregularny, co prowadzi do nierównomiernego rozmieszczenia wêz³ów i wiêkszej g³êbokoœci niektórych ga³êzi.
               Drugie drzewo zosta³o zbudowane metod¹ bardziej systematyczn¹, gdzie wybór korzenia i rozmieszczenie elementów oparte jest na ich porz¹dku, co skutkuje lepszym zrównowa¿eniem ca³ej struktury.
        Rozk³ad wartoœci :
                W pierwszym drzewie elementy s¹ rozmieszczone w sposób zale¿ny od kolejnoœci ich dodawania, co mo¿e prowadziæ do asymetrycznego uk³adu.
                W drugim drzewie wartoœci s¹ rozmieszczone wed³ug rosn¹cego porz¹dku, co sprawia, ¿e struktura jest bardziej symetryczna i zorganizowana.
        Liczba liœci :
               W pierwszym drzewie wystêpuj¹ 4 liœcie (koñcowe wêz³y bez potomków).
               W drugim drzewie liczba liœci wynosi 3, co wynika z bardziej zrównowa¿onego rozmieszczenia elementów.
Podobieñstwa:
       Zestaw wartoœci :
              Oba drzewa zawieraj¹ te same liczby: 2, 4, 5, 6, 7 i 10. Ró¿nica tkwi jedynie w sposobie ich rozmieszczenia.
       Wspólne liœcie :
              W obu drzewach wystêpuj¹ takie same wartoœci jako liœcie: 2, 5 i 7. Jednak ich po³o¿enie w strukturze ró¿ni siê – w pierwszym drzewie s¹ one bardziej rozproszone, a w drugim zorganizowane w sposób bardziej równomierny.
       Wartoœæ 6 w ró¿nych rolach :
              Liczba 6 wystêpuje w obu drzewach, ale pe³ni ró¿ne funkcje: w pierwszym drzewie jest liœciem, natomiast w drugim pe³ni rolê korzenia.
       Poziomy drzewa :
              Obie struktury maj¹ trzy poziomy hierarchii: korzeñ, wêz³y poœrednie (ga³êzie) oraz liœcie. Organizacja tych poziomów ró¿ni siê, ale ogólna architektura pozostaje podobna
-}