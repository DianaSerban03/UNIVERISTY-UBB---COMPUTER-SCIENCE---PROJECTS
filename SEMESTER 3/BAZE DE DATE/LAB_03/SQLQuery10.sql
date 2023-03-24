CREATE PROCEDURE RemoveConstragereCheieStraine
AS
BEGIN
  ALTER TABLE Vacante
  DROP CONSTRAINT id_angajat
END