CREATE PROCEDURE ModifyColumnBack
AS
BEGIN
   ALTER TABLE Vacante
   ALTER COLUMN data_incepere datetime;
END