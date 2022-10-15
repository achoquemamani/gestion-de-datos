USE GD2C2022
GO

/*BORRADO DE PROCEDURES/

/*
DROP PROCEDURE  HARAKIRI.RELLENAR_TABLA_MARCA
DROP PROCEDURE  HARAKIRI.RELLENAR_TABLA_CATEGORIA
DROP PROCEDURE  HARAKIRI.RELLENAR_TABLA_MATERIAL
DROP PROCEDURE HARAKIRI.RELLENAR_TABLA_TIPO_VARIANTE
DROP PROCEDURE HARAKIRI.RELLENAR_TABLA_VARIANTE
DROP PROCEDURE HARAKIRI.RELLENAR_TABLA_PRODUCTO
*/



-----------------------------------------------------------------------------------------------------
/*Borrado de FKS de las tablas si existen*/


/*BORRO CONSTRAINS FK A LA TABLA LOCALIDAD*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_LOCALIDAD_PROVINCIA')
BEGIN
	ALTER TABLE HARAKIRI.LOCALIDAD DROP CONSTRAINT FK_LOCALIDAD_PROVINCIA
END
GO

/*BORRO CONSTRAINS FK A LA TABLA MEDIO_ENVIO_POR_LOCALIDAD*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_MEDIO_ENVIO_POR_LOCALIDAD_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD DROP CONSTRAINT FK_MEDIO_ENVIO_POR_LOCALIDAD_LOCALIDAD
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_MEDIO_ENVIO_POR_LOCALIDAD_MEDIO_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD DROP CONSTRAINT FK_MEDIO_ENVIO_POR_LOCALIDAD_MEDIO_ENVIO
END
GO


/*BORRO CONSTRAINS FK A LA TABLA COMPRA*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_MEDIO_DE_PAGO_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA DROP CONSTRAINT FK_COMPRA_MEDIO_DE_PAGO_COMPRA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			   WHERE CONSTRAINT_NAME ='FK_COMPRA_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA DROP CONSTRAINT FK_COMPRA_PROVEEDOR
END
GO

/*BORRO CONSTRAINS FK A LA TABLA DESCUENTO_COMPRA*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_COMPRA_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_COMPRA DROP CONSTRAINT FK_DESCUENTO_COMPRA_COMPRA
END
GO

/*BORRO CONSTRAINS FK A LA TABLA PROVEEDOR*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			   WHERE CONSTRAINT_NAME ='FK_PROVEEDOR_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.PROVEEDOR DROP CONSTRAINT FK_PROVEEDOR_LOCALIDAD
END
GO

/*BORRO CONSTRAINS FK A LA TABLA COMPRA_POR_PRODUCTO*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_POR_PRODUCTO_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA_POR_PRODUCTO DROP CONSTRAINT FK_COMPRA_POR_PRODUCTO_COMPRA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_POR_PRODUCTO_PRODUCTO_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA_POR_PRODUCTO DROP CONSTRAINT FK_COMPRA_POR_PRODUCTO_PRODUCTO_VARIANTE
END
GO
/*BORRO CONSTRAINS FK A LA TABLA CLIENTE*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			   WHERE CONSTRAINT_NAME ='FK_CLIENTE_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.CLIENTE DROP CONSTRAINT FK_CLIENTE_LOCALIDAD
END
GO

/*BORRO CONSTRAINS FK A LA TABLA CUPON*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_CUPON_CUPON_TIPO')
BEGIN
	ALTER TABLE HARAKIRI.CUPON DROP CONSTRAINT FK_CUPON_CUPON_TIPO
END
GO

/*BORRO CONSTRAINS FK A LA TABLA VENTA_CUPON*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_CUPON_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_CUPON DROP CONSTRAINT FK_VENTA_POR_CUPON_VENTA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA DROP CONSTRAINT FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO
END
GO

/*BORRO CONSTRAINS FK A LA TABLA DESCUENTO_POR_VENTA*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA DROP CONSTRAINT FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA DROP CONSTRAINT FK_DESCUENTO_POR_VENTA_VENTA
END
GO

/*BORRO CONSTRAINS FK A LA TABLA PRODUCTO*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_MARCA')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO DROP CONSTRAINT FK_PRODUCTO_MARCA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_MATERIAL')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO DROP CONSTRAINT FK_PRODUCTO_MATERIAL
END
GO
/*BORRO CONSTRAINS FK A LA TABLA VENTA*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_CANAL')
BEGIN
	ALTER TABLE HARAKIRI.VENTA DROP CONSTRAINT FK_VENTA_CANAL
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_VENTA_POR_CUPON')
BEGIN
	ALTER TABLE HARAKIRI.VENTA DROP CONSTRAINT FK_VENTA_VENTA_POR_CUPON
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_MEDIO_DE_PAGO_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.VENTA DROP CONSTRAINT FK_VENTA_MEDIO_DE_PAGO_VENTA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_CLIENTE')
BEGIN
	ALTER TABLE HARAKIRI.VENTA DROP CONSTRAINT FK_VENTA_CLIENTE
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_MEDIO_ENVIO_POR_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.VENTA DROP CONSTRAINT FK_VENTA_MEDIO_ENVIO_POR_LOCALIDAD
END
GO


/*BORRO CONSTRAINS FK A LA TABLA PRODUCTO*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_CATEGORIA')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO DROP CONSTRAINT FK_PRODUCTO_CATEGORIA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_MARCA')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO DROP CONSTRAINT FK_PRODUCTO_MATERIAL
END
GO


/*BORRO CONSTRAINS FK A LA TABLA PRODUCTO_VARIANTE*/

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_VARIANTE_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO_VARIANTE DROP CONSTRAINT FK_PRODUCTO_VARIANTE_PRODUCTO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_VARIANTE_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO_VARIANTE DROP CONSTRAINT FK_PRODUCTO_VARIANTE_VARIANTE
END
GO


/*BORRO CONSTRAINS FK A LA TABLA VARIANTE*/

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VARIANTE_TIPO_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.VARIANTE DROP CONSTRAINT FK_VARIANTE_TIPO_VARIANTE
END
GO

/*BORRO CONSTRAINS FK A LA TABLA VENTA_POR_PRODUCTO*/
IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_PRODUCTO_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_PRODUCTO DROP CONSTRAINT FK_VENTA_POR_PRODUCTO_VENTA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_PRODUCTO DROP CONSTRAINT FK_VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE
END
GO

/*BORRO CONSTRAINS FK A LA TABLA VENTA_POR_CUPON*/

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_CUPON_CUPON')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_CUPON DROP CONSTRAINT FK_VENTA_POR_CUPON_CUPON
END
GO
























-----------------------------------------------------------------------------------------------------
/*Borrado de tablas*/

IF OBJECT_ID('HARAKIRI.LOCALIDAD', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.LOCALIDAD
	PRINT('Tabla HARAKIRI.LOCALIDAD eliminada')
END

IF OBJECT_ID('HARAKIRI.PROVINCIA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.PROVINCIA
	PRINT('Tabla HARAKIRI.PROVINCIA eliminada')
END

IF OBJECT_ID('HARAKIRI.PROVEEDOR', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.PROVEEDOR
	PRINT('Tabla HARAKIRI.PROVEEDOR eliminada')
END

IF OBJECT_ID('HARAKIRI.COMPRA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.COMPRA
	PRINT('Tabla HARAKIRI.COMPRA eliminada')
END

IF OBJECT_ID('HARAKIRI.CLIENTE', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.CLIENTE
	PRINT('Tabla HARAKIRI.CLIENTE eliminada')
END

IF OBJECT_ID('HARAKIRI.MATERIAL', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.MATERIAL
	PRINT('Tabla HARAKIRI.MATERIAL eliminada')
END

IF OBJECT_ID('HARAKIRI.CUPON_TIPO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.CUPON_TIPO
	PRINT('Tabla HARAKIRI.CUPON_TIPO eliminada')
END

IF OBJECT_ID('HARAKIRI.CUPON', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.CUPON
	PRINT('Tabla HARAKIRI.CUPON eliminada')
END

IF OBJECT_ID('HARAKIRI.CANAL', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.CANAL
	PRINT('Tabla HARAKIRI.CANAL eliminada')
END

IF OBJECT_ID('HARAKIRI.VENTA_POR_CUPON', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.VENTA_POR_CUPON
	PRINT('Tabla HARAKIRI.VENTA_POR_CUPON eliminada')
END

IF OBJECT_ID('HARAKIRI.DESCUENTO_CONCEPTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.DESCUENTO_CONCEPTO
	PRINT('Tabla HARAKIRI.DESCUENTO_CONCEPTO eliminada')
END

IF OBJECT_ID('HARAKIRI.DESCUENTO_POR_VENTA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.DESCUENTO_POR_VENTA
	PRINT('Tabla HARAKIRI.DESCUENTO_POR_VENTA eliminada')
END
IF OBJECT_ID('HARAKIRI.MEDIO_DE_PAGO_VENTA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.MEDIO_DE_PAGO_VENTA
	PRINT('Tabla HARAKIRI.MEDIO_DE_PAGO_VENTA eliminada')
END


IF OBJECT_ID('HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD
	PRINT('Tabla HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD eliminada')
END


IF OBJECT_ID('HARAKIRI.MEDIO_ENVIO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.MEDIO_ENVIO
	PRINT('Tabla HARAKIRI.MEDIO_ENVIO eliminada')
END

IF OBJECT_ID('HARAKIRI.MEDIO_DE_PAGO_COMPRA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.MEDIO_DE_PAGO_COMPRA
	PRINT('Tabla HARAKIRI.MEDIO_DE_PAGO_COMPRA eliminada')
END

IF OBJECT_ID('HARAKIRI.DESCUENTO_COMPRA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.DESCUENTO_COMPRA
	PRINT('Tabla HARAKIRI.DESCUENTO_COMPRA eliminada')
END

IF OBJECT_ID('HARAKIRI.COMPRA_POR_PRODUCTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.COMPRA_POR_PRODUCTO
	PRINT('Tabla HARAKIRI.COMPRA_POR_PRODUCTO eliminada')
END


IF OBJECT_ID('HARAKIRI.PRODUCTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.PRODUCTO
	PRINT('Tabla HARAKIRI.PRODUCTO eliminada')
END

IF OBJECT_ID('HARAKIRI.PRODUCTO_VARIANTE', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.PRODUCTO_VARIANTE
	PRINT('Tabla HARAKIRI.PRODUCTO_VARIANTE eliminada')
END

IF OBJECT_ID('HARAKIRI.VARIANTE', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.VARIANTE
	PRINT('Tabla HARAKIRI.VARIANTE eliminada')
END

IF OBJECT_ID('HARAKIRI.CATEGORIA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.CATEGORIA
	PRINT('Tabla HARAKIRI.CATEGORIA eliminada')
END

IF OBJECT_ID('HARAKIRI.MARCA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.MARCA
	PRINT('Tabla HARAKIRI.MARCA eliminada')
END

IF OBJECT_ID('HARAKIRI.TIPO_VARIANTE', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.TIPO_VARIANTE
	PRINT('Tabla HARAKIRI.TIPO_VARIANTE eliminada')
END

IF OBJECT_ID('HARAKIRI.VENTA_POR_PRODUCTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.VENTA_POR_PRODUCTO
	PRINT('Tabla HARAKIRI.VENTA_POR_PRODUCTO eliminada')
END

IF OBJECT_ID('HARAKIRI.VENTA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.VENTA
	PRINT('Tabla HARAKIRI.VENTA eliminada')
END




-----------------------------------------------------------------------------------------------------
/*BORRADO DE ESQUEMA*/

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'HARAKIRI')
BEGIN
   DROP SCHEMA HARAKIRI
   PRINT('Esquema HARAKIRI borrado')
END
GO

USE GD2C2022
GO