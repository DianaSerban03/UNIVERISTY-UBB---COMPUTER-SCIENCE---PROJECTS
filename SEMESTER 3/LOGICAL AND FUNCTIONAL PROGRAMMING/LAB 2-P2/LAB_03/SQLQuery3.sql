CREATE PROCEDURE ModifyColumn
AS
BEGIN
   ALTER TABLE Vacante
   ALTER COLUMN data_incepere data;
END