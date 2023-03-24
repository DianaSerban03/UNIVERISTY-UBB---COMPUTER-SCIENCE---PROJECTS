#PROBLEMA 1
"1. Să se determine ultimul (din punct de vedere alfabetic) cuvânt " \
"care poate apărea într-un text care conține mai multe cuvinte separate prin ” ” (spațiu). " \
"De ex. ultimul (dpdv alfabetic) cuvânt din ”Ana are mere rosii si galbene” este cuvântul 'si'."
import math


def ex1(text):
    """
    determina ultimul (din punct de vedere alfabetic) cuvânt
    :param text: textul de parcurs
    :return:
    """
    words = text.split(' ')
    return sorted(words, reverse=True)[0]
print("EXERCITIUL 1: " + ex1("Ana are mere rosii si galbene"))
assert(ex1("Ana are mere rosii si galbene")=="si")
assert(ex1("Ana are mere rosii si galbene cu zahar")=="zahar")
assert(ex1("Ana are mere rosii si galbene tari")=="tari")


#PROBLEMA 2
"Să se determine distanța Euclideană între două locații identificate prin perechi de numere. " \
"De ex. distanța între (1,5) și (4,1) este 5.0"

ex2 = lambda x1, y1, x2, y2: math.sqrt(abs(x2-x1)**2 + abs(y2-y1)**2)

print("EXERCITIUL 2: " + str(ex2(1, 5, 4, 1)))
assert(ex2(1, 5, 4, 1)==5.0)
assert(ex2(0,0,0,0)==0)
assert(ex2(1,1,1,1)==0)

#PROBLEMA 3
"Să se determine produsul scalar a doi vectori rari care conțin numere reale. " \
"Un vector este rar atunci când conține multe elemente nule. Vectorii pot avea oricâte dimensiuni. " \
"De ex. produsul scalar a 2 vectori unisimensionali [1,0,2,0,3] și [1,2,0,3,1] este 4."

def ex3(a, b):
    """
    determina produsul scalar a doi vectori rari care conțin numere reale.
    :param a:  primul vector rar
    :param b: al doilea vector rar
    :return:
    """
    if (len(a)!=len(b)):
        return print("Nu se poate calcula produsul, deoarece nu au dim egale")
    elif (len(a)==0):
        return 0
    else: return a[0]* b[0] + ex3(a[1:], b[1:])
print("EXERCITIUL 3: " + str(ex3([1,0,2,0,3], [1,2,0,3,1])))
assert(ex3([1,0,2,0,3], [1,2,0,3,1])==4)
assert(ex3([2,0,3,0,4], [2,3,0,4,1])==8)

#PROBLEMA 4
"Să se determine cuvintele unui text care apar exact o singură dată în acel text. " \
"De ex. cuvintele care apar o singură dată în 'ana are ana are mere rosii ana' sunt: 'mere' și 'rosii'."

def ex4(text):
    """
    determina cuvintele unui text care apar exact o singură dată în acel text
    :param text: textul de parcurs
    :return:
    """
    words = text.split(' ')
    frecv = {}
    for c in words:
        if (frecv.get(c) != 0):
            while c in words:
                words.remove(c)
        else:
            frecv[c] = frecv.get(c, 0) + 1

    return words

print("EXERCITIUL 4: " + str(ex4("ana are ana are mere rosii ana")))
assert(ex4("ana are ana are mere rosii ana")==['mere', 'rosii'])
assert(ex4("ana are ana are mere rosii ana mere")==['rosii'])
assert(ex4("ana are ana are mere rosii ana rosii")==['mere'])


#PROBLEMA 5
"Pentru un șir cu n elemente care conține valori din mulțimea {1, 2, ..., n - 1} astfel încât o singură valoare se repetă de două ori, " \
"să se identifice acea valoare care se repetă. " \
"De ex. în șirul [1,2,3,4,2] valoarea 2 apare de două ori."

def ex5(vect):
    """
    Pentru un șir cu n elemente care conține valori din mulțimea {1, 2, ..., n - 1} astfel încât o singură valoare se repetă de două ori, " \
"să se identifice acea valoare care se repetă
    :param vect: vectorul de prelucrat
    :return:
    """
    frecv = {}
    for c in vect:
        if (frecv.get(c) == 1):
            return c
        else:
            frecv[c] = frecv.get(c, 0) + 1
    return 0

print("EXERCITIUL 5: " + str(ex5([1,2,3,4,4])))
assert(ex5([1,2,3,4,4])==4)
assert(ex5([1,2,3,4,3])==3)
assert(ex5([1,2,3,4,2])==2)

#PROBLEMA 6
"""
Pentru un șir cu n numere întregi care conține și duplicate, 
să se determine elementul majoritar (care apare de mai mult de n / 2 ori). 
De ex. 2 este elementul majoritar în șirul [2,8,7,2,2,5,2,3,1,2,2].
"""

def ex6(vect):
    """
    să se determine elementul majoritar (care apare de mai mult de n / 2 ori).
    :param vect: vectorul de parcurs
    :return:
    """
    frecv = {}
    max=0
    for c in vect:
        frecv[c] = frecv.get(c, 0) + 1
        if (frecv[c] > max):
            max = c
    if (frecv[max]>len(vect)/2):
        return max
    else:
        return 0
print("EXERCITIUL 6: " + str(ex6([2,8,7,2,2,5,2,3,1,2,2])))
assert(ex6([1,8,7,1,1,5,1,3,1,1,2])==1)
assert(ex6([1,2,3,4,4,5,6,7])==0)

#PROBLEMA 7
"""
Să se determine al k-lea cel mai mare element al unui șir de numere cu n elemente (k < n). 
De ex. al 2-lea cel mai mare element din șirul [7,4,6,3,9,1] este 7.
"""

def ex7(vect, k):
    frecv = {}
    for c in vect:
        frecv[c] = frecv.get(c, 0) + 1
    return sorted(frecv, reverse=True)[k-1]

print("EXERCITIUL 7: " + str(ex7([7,4,6,3,9,1], 2)))
assert(ex7([7,4,6,3,9,1], 2)==7)
assert(ex7([7,4,6,3,9,1], 3)==6)

#PROBLEMA 8
"""
Să se genereze toate numerele (în reprezentare binară) cuprinse între 1 și n. 
De ex. dacă n = 4, numerele sunt: 1, 10, 11, 100.
"""

def ex8(n):
    vect=[]
    i=1
    while(i<=n):
        vect.append(bin(i)[2:])
        i=i+1
    return vect
print("EXERCITIUL 8: " + str(ex8(4)))
assert(ex8(4)==['1', '10', '11', '100'])
assert(ex8(5)==['1', '10', '11', '100', '101'])

#PROBLEMA 9
"""
Considerându-se o matrice cu n x m elemente întregi și o listă cu perechi formate din coordonatele a 2 căsuțe din matrice ((p,q) și (r,s)), 
să se calculeze suma elementelor din sub-matricile identificate de fieare pereche.
De ex, pt matricea
[
[0, 2, 5, 4, 1],
[4, 8, 2, 3, 7],
[6, 3, 4, 6, 2],
[7, 3, 1, 8, 3],
[1, 5, 7, 9, 4]
]
și lista de perechi ((1, 1) și (3, 3)), ((2, 2) și (4, 4)), 
suma elementelor din prima sub-matrice este 38, iar suma elementelor din a 2-a sub-matrice este 44.
"""

def ex9(matrix, a, b, c, d):
    """
    să se calculeze suma elementelor din sub-matricile identificate de fieare pereche
    :param matrix: matricea de prelucrat
    :return: suma
    """
    i=a
    j=b
    s=0
    while(i<=c):
        j=b
        while (j<=d):
            s = s + matrix[i][j]
            j=j+1
        i=i+1
    return s

print("EXERCITIUL 9: " + str(ex9([[0, 2, 5, 4, 1],[4, 8, 2, 3, 7], [6, 3, 4, 6, 2],[7, 3, 1, 8, 3], [1, 5, 7, 9, 4]], 1, 1, 3, 3)))
assert(ex9([[0, 2, 5, 4, 1],[4, 8, 2, 3, 7], [6, 3, 4, 6, 2],[7, 3, 1, 8, 3], [1, 5, 7, 9, 4]], 1, 1, 3, 3)==38)
assert(ex9([[0, 2, 5, 4, 1],[4, 8, 2, 3, 7], [6, 3, 4, 6, 2],[7, 3, 1, 8, 3], [1, 5, 7, 9, 4]], 2, 2, 4, 4)==44)

#PROBLEMA 10
"""
Considerându-se o matrice cu n x m elemente binare (0 sau 1) sortate crescător pe linii, 
să se identifice indexul liniei care conține cele mai multe elemente de 1.
De ex. în matricea
[[0,0,0,1,1],
[0,1,1,1,1],
[0,0,1,1,1]]
a doua linie conține cele mai multe elemente 1.
"""

def ex10(matrix, n):
    i=0
    smax=0
    ind=-1
    while i<n:
        if(sum(matrix[i])>smax):
            smax=sum(matrix[i])
            ind=i
        i=i+1
    return ind
print("EXERCITIUL 10: " + str(ex10([[0,0,0,1,1],[0,1,1,1,1],[0,0,1,1,1]], 3)))
assert(ex10([[0,0,0,1,1],[0,1,1,1,1],[0,0,1,1,1]], 3)==1)
assert(ex10([[0,0,0,1,1],[0,1,1,1,1],[1,1,1,1,1]], 3)==2)

#PROBLEMA 11
"""
Considerându-se o matrice cu n x m elemente binare (0 sau 1), să se înlocuiască cu 1 toate aparițiile elementelor egale cu 0 care sunt complet înconjurate de 1.
De ex. matricea \ [[1,1,1,1,0,0,1,1,0,1],
[1,0,0,1,1,0,1,1,1,1],
[1,0,0,1,1,1,1,1,1,1],
[1,1,1,1,0,0,1,1,0,1],
[1,0,0,1,1,0,1,1,0,0],
[1,1,0,1,1,0,0,1,0,1],
[1,1,1,0,1,0,1,0,0,1],
[1,1,1,0,1,1,1,1,1,1]]
*devine *
[[1,1,1,1,0,0,1,1,0,1],
[1,1,1,1,1,0,1,1,1,1],
[1,1,1,1,1,1,1,1,1,1],
[1,1,1,1,1,1,1,1,0,1],
[1,1,1,1,1,1,1,1,0,0],
[1,1,1,1,1,1,1,1,0,1],
[1,1,1,0,1,1,1,0,0,1],
[1,1,1,0,1,1,1,1,1,1]]\
0 1 2 3 4 5
1 x x x x
2
3
4
5
"""