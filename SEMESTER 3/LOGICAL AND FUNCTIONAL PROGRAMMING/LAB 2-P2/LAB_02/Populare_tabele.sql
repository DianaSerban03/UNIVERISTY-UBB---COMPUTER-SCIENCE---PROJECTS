INSERT INTO DEPARTAMENTE(denumire) VALUES ('Administrare');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Tehniv');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Software');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Marketing');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Testare');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Financiar');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Resurse Umane');
INSERT INTO DEPARTAMENTE(denumire) VALUES ('Intretinere')

INSERT INTO SEDII(denumire, contact,email,adresa) VALUES ('Sediul Principal','402839374','CrimeShieldSecurity1@gmail.com','Cluj-Napoca,Calea Dorobantilor')
INSERT INTO SEDII(denumire, contact,email,adresa) VALUES ('Sediul Secundar','405482375','CrimeShieldSecurity2@gmail.com','Cluj-Napoca, Str. Inocentiu Klein')
INSERT INTO SEDII(denumire, contact,email,adresa) VALUES ('Sediul Tertiar','403836583','CrimeShieldSecurity3@gmail.com','Cluj-Napoca, Str. Horea');

INSERT INTO CUMPARATORI(nume, contact, data_cumparare) VALUES ('Mihai Nastasescu','8834195','2004-10-26 00:00:00.000'),
                                                              ('IT DEVELOP SRL','237643','2002-05-28 00:00:00.000'),
															  ('DATA TECH','73424','2016-03-13 00:00:00.000');

INSERT INTO PARTENERI(denumire,contact,adresa) VALUES ('NET COMPUTER SRL','3965491','Calea Bucuresti, Brasov'),
                                                      ('ASK IT SRL','7346915','Bulevardul Onix, Brasov'),
													  ('ASTARO BUSINESS','736195356','Str. Cuza Voda, Bucuresti'),
													  ('CG&GC IT EXPERT','9387915','Str. Sidrurgistilor, Galati'),
													  ('DIAPHORA CONSULTING SRL','5656587','Str. Gheorghe Dima, Timisoara'),
													  ('CONSULTING IT SRL','7845681','Strada Primaverii, Oradea');

INSERT INTO COMPANII(denumrie, contact) VALUES ('Banca Transilvania','7834681'),
                                               ('BCR','834204'),
											   ('Epic Games','737642'),
											   ('EMAG','378374'),
											   ('B&G SRL','736953');

INSERT INTO PROIECTE(denumire, data_inceperii,data_finalizarii,descriere,id_partener,id_cumparator) VALUES ('GravityZoneElite','2000-08-18 00:00:00.000','2000-10-18 00:00:00.000','NULL','1','1','130000','NULL'),
                                                                                                           ('Managed Detection and Response','2001-06-15 00:00:00.000','2001-08-12 00:00:00.000','NULL','2','3','200','148'),
																										   ('Network Traffic Security Analitics','2012-03-27 00:00:00.000','2015-06-27 00:00:00.000','NULL','3','2','150','83');

INSERT INTO ANGAJATI(nume,prenume,functie,data_angajarii,salar,telefon,email,descriere,id_departamente,id_sediu, data_concediere) VALUES ('Cristescu','Anastasia','Director General Executiv','2000-07-01 00:00:00.000','3800','3759235','anastasia_crist@gmail.com','Directorul general executiv si fondatorul CrimeShield Security este un antreprenor cu viziune care lucreaza de 20 ani in domeniul solutiior high-tech de securitate penrtru companii','1','1','NULL'),
                                                                                                                                         ('Tanase','Mihai','Director Financiar','2000-08-25 00:00:00.000','3500','382453','mihai_tanase@gmail.com','Tanase Mihai conduce toate operatiunile financiare, fiind angajat al companiei din august 2000 si are o experienta de vasta in conducerea companiilor publice performante, de toate dimensiunile','4','1','NULL'),
																																		 ('Dumitru Bogdan','Mihai','Consultant Finaciar','2001-08-23 00:00:00.000','1800','4583952','dumi@gmail.com','NULL','6','1','NULL'),
																																		 ('Baciu','Raluca','Vicepresedinte Marketing','2002-10-30 00:00:00.000','2600','37569253','ralu@gmail.com','NULL','4','1','NULL'),
																																		 ('Chelariu','Romeo','Security Strategist','2003-03-28 00:00:00.000','2500','2853953','romeo@gmial.com','In calitate de Security Strategist, Chelariu Romeo stimuleaza progresul tehnologic al companiei si este responsabil de asistarea organelor locale si internationale de aplicare a legii in lupta impotriva criminalitatii cibernetice','9','2','NULL'),
																																		 ('Comstantin','Emil','Vicepresedinte al Solutiilor pentru Consumatori','2003-11-26 00:00:00.000','2100','2839235','emil@gmail.com','Constantin Emil raspunde de trasarea viitorului portofoliu de produse de consum si realizarea concreta a acestuia','7','3','2022-10-18 00:00:00.000'),
																																		 ('Constantinescu','Maria','secretar','2003-12-25 00:00:00.000','1700','726532','maria@gmail.com','NULL','2','2','NULL'),
																																		 ('Danciu','Ana','IT','2000-06-17 00:00:00.000','2800','7463235','NULL','NULL','2','2','NULL');
																													
INSERT INTO CLIENTI(nume, prenume, telefon, email, id_computer) VALUES ('Maier','Stelian','74563825','stelian_maier@gmail.com','1'),
                                                                       ('Macovei','Gerogiana','932745','georgi_macovei@gmail.com','2'),
																	   ('Maguran','Mihai','8437834','mihai_mag@gmail.com','3'),
																	   ('Manea','Vasile','8934295','vasi_manea@gmail.com','4'),
																	   ('Marinescu','Mariana','34693532','mari_mari@gmail.com','5'),
																	   ('Miculescu','Florin','9835392','florin_micu@gmail.com','NULL'),
																	   ('Moraru','Dana','37951737','NULL','NULL'),
																	   ('Muresan','Andrei','9581784','andrei_muresan@gmail.com','3');

INSERT INTO INCIDENTE(denumrie,data_inceput,tip_sistem_afectat,data_finalizare,descriere,cod_malware,id_angajat,id_client_ VALUES ('Sality','2001-02-13 00:00:00.000','Linux','2001-02-15 00:00:00.000','In data de 13 februarie se constata virusarea dispozitivului cu Sality, in urma erorii "x.exe corupt file','34126','5','1'),
                                                                                                                                  ('Downadup','2020-08-15 00:00:00.000','Unix','2021-03-28 00:00:00.000','NULL','1772','8','2'),
																																  ('Nivdort','2004-08-14 00:00:00.000','Windows','NULL','NULL','1365','8','4'),
																																  ('Zeus','2005-10-26 00:00:00.000','Windows','2002-07-25 00:00:00.000','NULL','1354','10','3'),
																																  ('Zeus','2005-10-26 00:00:00.000','Windows','2005-11-01 00:00:00.000','NULL','1354','14','5'),
																																  ('Botnet','2018-10-04 00:00:00.000','Linux','NU;;','NULL','4096','17','6');

INSERT INTO SERVICII(denumire,data_incep,data_sf,tip_produs_testat,descriere,id_client) VALUES ('Penetration Testing','2004-02-04 00:00:00.000','2004-02-05 00:00:00.000','web site','NULL','1'),
                                                                                               ('Penetration Testing','2020-04-04 00:00:00.000','2020-04-04 00:00:00.000','baza de date','NULL','2'),
																							   ('Penetration Testing','2004-01-04 00:00:00.000','2004-01-04 00:00:00.000','web site','NULL','3'),
																							   ('Penetration Testing','2006-04-05 00:00:00.000','2006-04-05 00:00:00.000','web site','NULL','4'),
																							   ('Vulnerability Assesment','2005-05-05 00:00:00.000','2005-05-05 00:00:00.000','web site','NULL','6'),
																							   ('Vulnerability Assesment','2005-01-04 00:00:00.000','2005-01-04 00:00:00.000','web site','NULL','7'),
																							   ('Vulnerability Assesment','2008-05-05 00:00:00.000','2008-05-05 00:00:00.000','web site','NULL','9'),
																							   ('Vulnerability Assesment','2007-12-08 00:00:00.000','2007-12-08 00:00:00.000','app','NULL','9');

INSERT INTO COLABORARi(cord_serv,id_angajat) VALUES ('1','16'),('4','5'),('5','8'),('6','8'),('10','16'),('11','17'),('12','5'),('13','16');

INSERT INTO DISTRIBUIRI(cod,id_angajat) VALUES ('1','5'),('2','8'),('3','9'),('4','3'),('5','3'),('6','10'),('7','11')('8','14');
