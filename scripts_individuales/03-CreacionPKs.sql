
----------------------------------------------------------------------------------------------------------
/*CREANDO CONSTRAINT PK PARA LAS TABLAS DE LA BASE DE DATOS*/

/*AGREGANDO CONSTRAINT PK A LA TABLA LOCALIDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_LOCALIDAD_LOCALIDAD_CODIGO')
BEGIN
	ALTER TABLE HARAKIRI.LOCALIDAD
	ADD CONSTRAINT PK_LOCALIDAD_LOCALIDAD_CODIGO PRIMARY KEY (LOCALIDAD_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.LOCALIDAD agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA PROVINCIA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_PROVINCIA_PROVINCIA_CODIGO')
BEGIN
	ALTER TABLE HARAKIRI.PROVINCIA
	ADD CONSTRAINT PK_PROVINCIA_PROVINCIA_CODIGO PRIMARY KEY (PROVINCIA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.PROVINCIA agregada')
END
GO
