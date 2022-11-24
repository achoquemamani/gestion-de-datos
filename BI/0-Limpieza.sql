USE GD2C2022
GO

/*BORRADO DE PROCEDURES*/

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA eliminado')
END
GO


IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO eliminado')
END
GO
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

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_TIPO_DE_DESCUENTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO DROP CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_TIPO_DE_DESCUENTO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO DROP CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_TIEMPO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_CANAL_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO DROP CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_CANAL_VENTA
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_COMPRA_PRODUCTO_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_COMPRA_PRODUCTO_BI_TIEMPO
END
GO

IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_COMPRA_PRODUCTO_BI_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_COMPRA_PRODUCTO_BI_PROVEEDOR
END
GO


IF EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_COMPRA_PRODUCTO_BI_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO DROP CONSTRAINT FK_BI_HECHO_COMPRA_PRODUCTO_BI_PRODUCTO
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

IF OBJECT_ID('HARAKIRI.BI_MEDIO_DE_PAGO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_MEDIO_DE_PAGO
	PRINT('Tabla HARAKIRI.BI_MEDIO_DE_PAGO eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_MEDIO_DE_ENVIO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_MEDIO_DE_ENVIO
	PRINT('Tabla HARAKIRI.BI_MEDIO_DE_ENVIO eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_TIPO_DE_DESCUENTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_TIPO_DE_DESCUENTO
	PRINT('Tabla HARAKIRI.BI_TIPO_DE_DESCUENTO eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_VENTA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_VENTA
	PRINT('Tabla HARAKIRI.BI_VENTA eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_PROVEEDOR', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_PROVEEDOR
	PRINT('Tabla HARAKIRI.BI_PROVEEDOR eliminada')
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

IF OBJECT_ID('HARAKIRI.BI_CATEGORIA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_CATEGORIA
	PRINT('Tabla HARAKIRI.BI_CATEGORIA eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_PRODUCTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_PRODUCTO
	PRINT('Tabla HARAKIRI.BI_PRODUCTO eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_CANAL_VENTA', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_CANAL_VENTA
	PRINT('Tabla HARAKIRI.BI_CANAL_VENTA eliminada')
END

IF OBJECT_ID('HARAKIRI.BI_HECHO_VENTA_DESCUENTO', 'U') IS NOT NULL
BEGIN
	DROP TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
	PRINT('Tabla HARAKIRI.BI_HECHO_VENTA_DESCUENTO eliminada')
END

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO eliminado')
END
GO
IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_VENTA') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_VENTA
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_VENTA eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_TIEMPO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_TIEMPO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_TIEMPO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_DESCUENTO') IS NOT NULL
BEGIN
	DROP PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_DESCUENTO
	PRINT('Procedure HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_DESCUENTO eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES
    PRINT('Vista HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES eliminado')
END
GO

IF OBJECT_ID('HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL
    PRINT('Vista HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL eliminado')
END
GO

-----------------------------------------------------------------------------------------------------
/*BORRADO DE FUNCIÓN*/
IF EXISTS (select * from sys.objects where object_id = OBJECT_ID('HARAKIRI.rangoEtario_fx') and type = 'FN')
	DROP FUNCTION HARAKIRI.rangoEtario_fx
GO
