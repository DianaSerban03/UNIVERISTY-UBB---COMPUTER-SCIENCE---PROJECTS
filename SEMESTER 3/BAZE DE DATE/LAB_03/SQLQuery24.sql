USE [CrimeShield Security - Companie de securitate cibernetica]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCamp]    Script Date: 16.11.2022 10:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeleteCamp]
AS
BEGIN
  ALTER TABLE Vacante
  DROP COLUMN nr_zile
END