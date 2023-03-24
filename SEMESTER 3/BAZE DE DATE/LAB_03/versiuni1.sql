INSERT INTO Versiuni(versiune,do,undo,versiune_curenta) VALUES
(1,'creareTabelaVacante','deleteTableVacante',0),
(2,'CreateConstrangereImpliciat','DeleteConstrangereImpliciat',0),
(3,'CreateConstragereCheieStraine','RemoveConstragereCheieStraine',0),
(4,'AddCamp','DeleteCamp',0),
(5,'ModifyColumn','ModifyColumnBack',0);

exec selectVersiune @nr_versiune=1