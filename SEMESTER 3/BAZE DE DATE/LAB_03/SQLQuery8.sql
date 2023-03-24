DROP Table Versiuni 
CREATE TABLE Versiuni(
cod_versiune INT PRIMARY KEY IDENTITY,
versiune INT,
do VARCHAR(50),
undo VARCHAR(50),
versiune_curenta INT
);


INSERT INTO Versiuni(versiune,do,undo,versiune_curenta) VALUES
(1,'creareTabelaVacante','deleteTableVacante',0),
(2,'CreateConstrangereImpliciat','DeleteConstrangereImpliciat',0),
(3,'CreateConstragereCheieStraine','RemoveConstragereCheieStraine',0),
(4,'AddCamp','DeleteCamp',0),
(5,'ModifyColumn','ModifyColumnBack',0);

exec selectVersiune @nr_versiune=0
SELECT * FROM Versiuni
