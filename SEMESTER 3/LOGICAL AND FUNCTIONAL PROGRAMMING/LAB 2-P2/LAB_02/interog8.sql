/*Afisati partenerii care au contribuit la proiectele cumparate si cumparatorii lor */
/*>2 tabele*/
SELECT PARTENERI.denumire, PROIECTE.denumire, CUMPARATORI.nume
FROM PARTENERI
JOIN PROIECTE ON PROIECTE.id_partener=PARTENERI.id_partener
JOIN CUMPARATORI ON CUMPARATORI.id_cumparator=PROIECTE.id_cumparator
ORDER BY PARTENERI.denumire