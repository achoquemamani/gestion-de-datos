
----------------------------------------------------------------------------------------------------------
/*CREACION DE ESQUEMA*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'HARAKIRI')
BEGIN
    EXEC ('CREATE SCHEMA HARAKIRI')
	PRINT('Esquema HARAKIRI creado')
END
GO
