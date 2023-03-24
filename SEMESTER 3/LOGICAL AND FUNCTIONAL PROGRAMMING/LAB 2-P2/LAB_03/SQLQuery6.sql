CREATE PROCEDURE DeleteConstrangereImpliciat
AS
BEGIN
  ALTER TABLE Vacante
  DROP CONSTRAINT df_nume
END