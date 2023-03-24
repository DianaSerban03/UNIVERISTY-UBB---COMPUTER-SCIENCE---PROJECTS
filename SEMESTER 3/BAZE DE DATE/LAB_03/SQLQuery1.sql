CREATE PROCEDURE creareTabelaVacante
AS
BEGIN
  CREATE TABLE Vacante(
      cod_vacanta INT PRIMARY KEY,
	  nume varchar,
	  data_incepere DATETIME,
	  data_sfarsire DATETIME,
  );
END