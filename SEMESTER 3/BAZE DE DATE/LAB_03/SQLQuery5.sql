CREATE PROCEDURE CreateConstrangereImpliciat
AS
BEGIN
  ALTER TABLE Vacante
  ADD CONSTRAINT df_nume
  DEFAULT 'In Maldive' FOR nume;
END