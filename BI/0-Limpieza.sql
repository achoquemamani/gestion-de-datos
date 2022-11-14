/*BORRADO DE PROCEDURES*/


-----------------------------------------------------------------------------------------------------

/*Borrado de FKS de las tablas si existen*/

/*BORRO CONSTRAINTS FK A LA TABLA BI_HECHO_VENTA_PRODUCTO*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_RANGO_EDAD')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_RANGO_EDAD
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_TIEMPO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_PROVINCIA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_PROVINCIA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_CANAL_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_CANAL_VENTA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_PAGO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_PAGO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_CATEGORIA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_CATEGORIA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_PRODUCTO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_ENVIO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_VENTA
END
GO

-----------------------------------------------------------------------------------------------------

/*Borrado de tablas*/

IF OBJECT_ID('HARAKIRI.BI_HECHO_VENTA_PRODUCTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	PRINT('Tabla HARAKIRI.BI_HECHO_VENTA_PRODUCTO eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_PROVINCIA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_PROVINCIA
	PRINT('Tabla HARAKIRI.BI_PROVINCIA eliminada')
END


IF OBJECT_ID('HARAKIRI.BI_TIEMPO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_TIEMPO
	PRINT('Tabla HARAKIRI.BI_TIEMPO eliminada')
END


IF OBJECT_ID('HARAKIRI.BI_RANGO_EDAD', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_RANGO_EDAD
	PRINT('Tabla HARAKIRI.BI_RANGO_EDAD eliminada')
END


IF OBJECT_ID('HARAKIRI.BI_HECHO_COMPRA_PRODUCTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO
	PRINT('Tabla HARAKIRI.BI_HECHO_COMPRA_PRODUCTO eliminada')
END




-----------------------------------------------------------------------------------------------------
/*BORRADO DE ESQUEMA*/

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'HARAKIRI')
BEGIN
   DROP SCHEMA HARAKIRI
   PRINT('Esquema HARAKIRI borrado')
END
GO