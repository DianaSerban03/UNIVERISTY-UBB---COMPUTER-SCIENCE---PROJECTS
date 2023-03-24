/*Afisati proiectele care au fost finalizate in ultimii 5 ani*/
/*WHERE*/
SELECT p.denumire, p.pret, p.nr_vanzari FROM PROIECTE p
WHERE p.data_finalizarii IS NOT NULL and  YEAR(SYSDATETIME())-YEAR(p.data_finalizarii)<= 5
