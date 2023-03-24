CREATE PROCEDURE selectVersiune @nr_versiune INT
 AS
 BEGIN
	IF (@nr_versiune >=0 AND @nr_versiune<=5)
	BEGIN

	DECLARE @procedure_name varchar(512);
	DECLARE @i INT;
	IF @nr_versiune > (SELECT versiune_curenta FROM Versiuni Where versiune=1)   
	BEGIN 
			SET @i = (SELECT versiune_curenta FROM Versiuni Where versiune=1)+1
			WHILE  @i <= @nr_versiune
			BEGIN
				SET @procedure_name = (Select do from Versiuni Where versiune = @i);
				EXEC @procedure_name

				SET @i = @i +1
			END
	END
	ELSE
	BEGIN
	If @nr_versiune != (SELECT versiune_curenta FROM Versiuni Where versiune=1)   
	BEGIN
	SET @i = (SELECT versiune_curenta FROM Versiuni Where versiune=1)
			WHILE @i > @nr_versiune
			BEGIN
				SET @procedure_name = (Select undo from Versiuni Where versiune = @i);
				EXEC @procedure_name

				SET @i = @i -1
			END
	END
	END
	
DROP Table Versiuni 
CREATE TABLE Versiuni(
cod_versiune INT PRIMARY KEY IDENTITY,
versiune INT,
do VARCHAR(50),
undo VARCHAR(50),
versiune_curenta INT
);


INSERT INTO Versiuni(versiune,do,undo,versiune_curenta) VALUES
(1,'creareTabelaVacante','CreateConstrangereImpliciat',@nr_versiune),
(2,'CreateConstrangereImpliciat','DeleteConstrangereImpliciat',@nr_versiune),
(3,'CreateConstragereCheieStraine','RemoveConstragereCheieStraine',@nr_versiune),
(4,'AddCamp','DeleteCamp',@nr_versiune),
(5,'ModifyColumn','ModifyColumnBack',@nr_versiune);


END
END