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
-----------------------------------------------------------------------------------------------------
/*BORRADO DE FUNCIÓN*/
IF EXISTS (select * from sys.objects where object_id = OBJECT_ID('HARAKIRI.rangoEtario_fx') and type = 'FN')
	DROP FUNCTION HARAKIRI.rangoEtario_fx
GO
USE GD2C2022
GO
----------------------------------------------------------------------------------------------------------
/*CREACION DE ESQUEMA*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'HARAKIRI')
BEGIN
    EXEC ('CREATE SCHEMA HARAKIRI')
	PRINT('Esquema HARAKIRI creado')
END
GO

GO
CREATE FUNCTION HARAKIRI.rangoEtario_fx(@fecha_nac DATE)
RETURNS NVARCHAR(15)
AS
BEGIN
	DECLARE @rango NVARCHAR(15)
	DECLARE @edad INT

SELECT @edad = convert(int,DATEDIFF(d,@fecha_nac, getdate())/365.25)
		

	SELECT @rango = CASE 
        WHEN @edad < 25  THEN '<25'
		WHEN @edad >= 25 AND @edad < 35 THEN '25 - 35'
		WHEN @edad >= 35 AND @edad <= 55 THEN '35 - 55'
		ELSE '>55'
		END

	RETURN @rango
END
GO




----------------------------------------------------------------------------------------------------------
/*CREACION DE TABLAS DEL MODELO BI*/


CREATE TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO(
    VENTA_PRODUCTO_CODIGO decimal(19,0) not null,
    EDAD_CODIGO decimal(19,0),
    TIEMPO_CODIGO decimal(19,0),
    PROVINCIA_CODIGO decimal(18,0),
    CANAL_CODIGO decimal(19,0),
    MEDIO_DE_PAGO_CODIGO decimal(19,0),
    CATEGORIA_CODIGO decimal(18,0),
    PRODUCTO_CODIGO nvarchar(50),
    MEDIO_ENVIO_CODIGO decimal(19,0),
    VENTA_ENVIO_PRECIO decimal(18,2),
    PRODUCTO_PRECIO_TOTAL decimal(18,2),
    VENTA_CODIGO decimal(19,0)
);  
GO

CREATE TABLE HARAKIRI.BI_PROVINCIA(
    PROVINCIA_CODIGO decimal(18,0) not null,
    PROVINCIA_NOMBRE nvarchar(255)
);  
GO

CREATE TABLE HARAKIRI.BI_MEDIO_DE_PAGO(
    MEDIO_DE_PAGO_CODIGO decimal(19,0) not null,
    MEDIO_DE_PAGO_NOMBRE nvarchar(255),
    MEDIO_DE_PAGO_COSTO decimal(19,2)
);
GO

CREATE TABLE HARAKIRI.BI_MEDIO_DE_ENVIO(
    MEDIO_ENVIO_CODIGO decimal(19,0) not null,
    MEDIO_ENVIO_NOMBRE nvarchar(255),
);
GO

CREATE TABLE HARAKIRI.BI_TIPO_DE_DESCUENTO(
    TIPO_DESCUENTO_CODIGO decimal(19,0) not null,
    TIPO_DESCUENTO_NOMBRE nvarchar(50),
);
GO


CREATE TABLE HARAKIRI.BI_VENTA(
    VENTA_CODIGO decimal(19,0) not null,
    VENTA_TOTAL nvarchar(50)
);
GO

CREATE TABLE HARAKIRI.BI_PROVEEDOR(
    PROVEEDOR_CUIT nvarchar(50) not null,
    PROVEEDOR_RAZON_SOCIAL nvarchar(255),
);
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].BI_TIEMPO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.BI_TIEMPO(
		TIEMPO_CODIGO DECIMAL(19,0) NOT NULL IDENTITY(1,1),
		TIEMPO_ANIO INT,
		TIEMPO_MES INT,
	)
	PRINT('Tabla HARAKIRI.BI_TIEMPO creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].BI_RANGO_EDAD') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.BI_RANGO_EDAD(
		EDAD_CODIGO DECIMAL(19,0) NOT NULL IDENTITY(1,1),
		EDAD_CATEGORIA NVARCHAR(15)
	)
	PRINT('Tabla HARAKIRI.BI_RANGO_EDAD creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].BI_HECHO_COMPRA_PRODUCTO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO(
		 COMPRA_PRODUCTO_CODIGO decimal(19,0) not null,
        PROVEEDOR_CUIT NVARCHAR(50),
        TIEMPO_CODIGO decimal(19,0),
        PRODUCTO_CODIGO nvarchar(50),
         PRODUCTO_CANTIDAD decimal(18,0),
        PRODUCTO_PRECIO_UNITARIO decimal(18,2),
       
	)
	PRINT('Tabla HARAKIRI.BI_HECHO_COMPRA_PRODUCTO creada')
END
GO

CREATE TABLE HARAKIRI.BI_CATEGORIA(
    CATEGORIA_CODIGO decimal(18,0) not null,
    CATEGORIA_NOMBRE nvarchar(255)
);  
GO

CREATE TABLE HARAKIRI.BI_PRODUCTO(
    PRODUCTO_CODIGO nvarchar(50) not null,
    PRODUCTO_NOMBRE nvarchar(50)
);  
GO

CREATE TABLE HARAKIRI.BI_CANAL_VENTA(
    CANAL_CODIGO decimal(19,0) not null,
    CANAL_NOMBRE nvarchar(255),
    CANAL_COSTO decimal(18,2)
);  
GO

CREATE TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO(
    BI_HECHO_VENTA_DESCUENTO_CODIGO decimal(19,0) not null,
    TIPO_DESCUENTO_CODIGO decimal(19,0) not null,
    DESCUENTO_IMPORTE decimal(18,2),
    TIEMPO_CODIGO decimal(19,0),
    CANAL_CODIGO decimal(19,0)
);  

----------------------------------------------------------------------------------------------------------
/*CREANDO CONSTRAINT PK PARA LAS TABLAS BI*/


/* AGREGANDO CONSTRAINT PK A LA TABLA BI_HECHO_VENTA_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_HECHO_VENTA_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT PK_BI_HECHO_VENTA_PRODUCTO PRIMARY KEY (VENTA_PRODUCTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_HECHO_VENTA_PRODUCTO agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA BI_PROVINCIA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_PROVINCIA')
BEGIN
	ALTER TABLE HARAKIRI.BI_PROVINCIA
	ADD CONSTRAINT PK_BI_PROVINCIA PRIMARY KEY (PROVINCIA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_PROVINCIA agregada')
END
GO

/** Agregado CONSTRAINT PK A LA TBL BI_MEDIO_DE_PAGO */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_MEDIO_DE_PAGO')
BEGIN
	ALTER TABLE HARAKIRI.BI_MEDIO_DE_PAGO
	ADD CONSTRAINT PK_BI_MEDIO_DE_PAGO PRIMARY KEY (MEDIO_DE_PAGO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_MEDIO_DE_PAGO agregada')
END
GO

/** Agregado CONSTRAINT PK A LA TBL BI_MEDIO_DE_ENVIO */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_MEDIO_DE_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.BI_MEDIO_DE_ENVIO
	ADD CONSTRAINT PK_BI_MEDIO_DE_ENVIO PRIMARY KEY (MEDIO_ENVIO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_MEDIO_DE_ENVIO agregada')
END
GO

/** Agregado CONSTRAINT PK A LA TBL BI_TIPO_DE_DESCUENTO */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_TIPO_DE_DESCUENTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_TIPO_DE_DESCUENTO
	ADD CONSTRAINT PK_BI_TIPO_DE_DESCUENTO PRIMARY KEY (TIPO_DESCUENTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_TIPO_DE_DESCUENTO agregada')
END
GO

/** Agregado CONSTRAINT PK A LA TBL BI_VENTA */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_VENTA
	ADD CONSTRAINT PK_BI_VENTA PRIMARY KEY (VENTA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_VENTA agregada')
END
GO

/** Agregado CONSTRAINT PK A LA TBL BI_PROVEEDOR */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.BI_PROVEEDOR
	ADD CONSTRAINT PK_BI_PROVEEDOR PRIMARY KEY (PROVEEDOR_CUIT)
	PRINT('Primary key de la tabla HARAKIRI.BI_PROVEEDOR agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA BI_TIEMPO */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_TIEMPO
	ADD CONSTRAINT PK_BI_TIEMPO PRIMARY KEY (TIEMPO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_TIEMPO agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA BI_RANGO_EDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_RANGO_EDAD')
BEGIN
	ALTER TABLE HARAKIRI.BI_RANGO_EDAD
	ADD CONSTRAINT PK_BI_RANGO_EDAD PRIMARY KEY (EDAD_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_RANGO_EDAD agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA BI_HECHO_COMPRA_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_HECHO_COMPRA_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO
	ADD CONSTRAINT PK_BI_HECHO_COMPRA_PRODUCTO PRIMARY KEY (COMPRA_PRODUCTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_HECHO_COMPRA_PRODUCTO agregada')
END
GO
/* AGREGANDO CONSTRAINT PK A LA TABLA BI_CATEGORIA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_CATEGORIA')
BEGIN
	ALTER TABLE HARAKIRI.BI_CATEGORIA
	ADD CONSTRAINT PK_BI_CATEGORIA PRIMARY KEY (CATEGORIA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_CATEGORIA agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA BI_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_PRODUCTO
	ADD CONSTRAINT PK_BI_PRODUCTO PRIMARY KEY (PRODUCTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_PRODUCTO agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA BI_CANAL_VENTA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_CANAL_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_CANAL_VENTA
	ADD CONSTRAINT PK_BI_CANAL_VENTA PRIMARY KEY (CANAL_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_CANAL_VENTA agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA BI_HECHO_VENTA_DESCUENTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_HECHO_VENTA_DESCUENTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
	ADD CONSTRAINT PK_BI_HECHO_VENTA_DESCUENTO PRIMARY KEY (BI_HECHO_VENTA_DESCUENTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_HECHO_VENTA_DESCUENTO agregada')
END
GO


----------------------------------------------------------------------------------------------------------
/*CREANDO CONSTRAINT FK PARA LAS TABLAS DE LA BASE DE DATOS */

/*AGREGANDO CONSTRAINTS FK A LA TABLA BI_HECHO_VENTA_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_RANGO_EDAD')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_RANGO_EDAD FOREIGN KEY(EDAD_CODIGO) REFERENCES HARAKIRI.BI_RANGO_EDAD(EDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_RANGO_EDAD agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_TIEMPO FOREIGN KEY(TIEMPO_CODIGO) REFERENCES HARAKIRI.BI_TIEMPO(TIEMPO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_TIEMPO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_PROVINCIA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_PROVINCIA FOREIGN KEY(PROVINCIA_CODIGO) REFERENCES HARAKIRI.BI_PROVINCIA(PROVINCIA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_PROVINCIA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_CANAL_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_CANAL_VENTA FOREIGN KEY(CANAL_CODIGO) REFERENCES HARAKIRI.BI_CANAL_VENTA(CANAL_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_CANAL_VENTA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_PAGO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_PAGO FOREIGN KEY(MEDIO_DE_PAGO_CODIGO) REFERENCES HARAKIRI.BI_MEDIO_DE_PAGO(MEDIO_DE_PAGO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_MEDIO_DE_PAGO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_CATEGORIA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_CATEGORIA FOREIGN KEY(CATEGORIA_CODIGO) REFERENCES HARAKIRI.BI_CATEGORIA(CATEGORIA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_CATEGORIA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_PRODUCTO FOREIGN KEY(PRODUCTO_CODIGO) REFERENCES HARAKIRI.BI_PRODUCTO(PRODUCTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_PRODUCTO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_MEDIO_DE_ENVIO FOREIGN KEY(MEDIO_ENVIO_CODIGO) REFERENCES HARAKIRI.BI_MEDIO_DE_ENVIO(MEDIO_ENVIO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_MEDIO_DE_ENVIO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_PRODUCTO_BI_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_PRODUCTO_BI_VENTA FOREIGN KEY(VENTA_CODIGO) REFERENCES HARAKIRI.BI_VENTA(VENTA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_PRODUCTO y HARAKIRI.BI_VENTA agregada')
END
GO

/*AGREGANDO CONSTRAINTS FK A LA TABLA BI_HECHO_COMPRA_PRODUCTO*/

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_COMPRA_PRODUCTO_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_COMPRA_PRODUCTO_BI_TIEMPO FOREIGN KEY(TIEMPO_CODIGO) REFERENCES HARAKIRI.BI_TIEMPO(TIEMPO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_COMPRA_PRODUCTO y HARAKIRI.BI_TIEMPO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_COMPRA_PRODUCTO_BI_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_COMPRA_PRODUCTO_BI_PRODUCTO FOREIGN KEY(PRODUCTO_CODIGO) REFERENCES HARAKIRI.BI_PRODUCTO(PRODUCTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_COMPRA_PRODUCTO y HARAKIRI.BI_PRODUCTO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_COMPRA_PRODUCTO_BI_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_COMPRA_PRODUCTO
	ADD CONSTRAINT FK_BI_HECHO_COMPRA_PRODUCTO_BI_PROVEEDOR FOREIGN KEY(PROVEEDOR_CUIT) REFERENCES HARAKIRI.BI_PROVEEDOR(PROVEEDOR_CUIT)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_COMPRA_PRODUCTO y HARAKIRI.BI_PROVEEDOR agregada')
END
GO



/*AGREGANDO CONSTRAINTS FK A LA TABLA BI_HECHO_VENTA_DESCUENTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_TIPO_DE_DESCUENTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_TIPO_DE_DESCUENTO FOREIGN KEY(TIPO_DESCUENTO_CODIGO) REFERENCES HARAKIRI.BI_TIPO_DE_DESCUENTO(TIPO_DESCUENTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_DESCUENTO y HARAKIRI.BI_TIPO_DE_DESCUENTO agregada')
END
GO


IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_TIEMPO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_TIEMPO FOREIGN KEY(TIEMPO_CODIGO) REFERENCES HARAKIRI.BI_TIEMPO(TIEMPO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_DESCUENTO y HARAKIRI.BI_TIEMPO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_CANAL_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_CANAL_VENTA FOREIGN KEY(CANAL_CODIGO) REFERENCES HARAKIRI.BI_CANAL_VENTA(CANAL_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_DESCUENTO y HARAKIRI.BI_CANAL_VENTA agregada')
END
GO
----------------------------------------------------------------------------------------------------------
/* MIGRACION DE TABLAS */

/* MIGRACION DE TABLA BI_TIEMPO */
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_TIEMPO
AS
BEGIN
	INSERT INTO HARAKIRI.BI_TIEMPO(TIEMPO_ANIO, TIEMPO_MES)
	(
		SELECT YEAR(V.VENTA_FECHA) AS TIEMPO_ANIO, MONTH(V.VENTA_FECHA) AS TIEMPO_MES
		FROM HARAKIRI.VENTA V
		GROUP BY YEAR(V.VENTA_FECHA), MONTH(V.VENTA_FECHA)

		UNION
 	    SELECT YEAR(C.COMPRA_FECHA) AS TIEMPO_ANIO, MONTH(C.COMPRA_FECHA) AS TIEMPO_MES
		FROM HARAKIRI.COMPRA C
		GROUP BY YEAR(C.COMPRA_FECHA), MONTH(C.COMPRA_FECHA)

	)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_TIEMPO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_TIEMPO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

/*MIGRACION TABLA RANGO_EDAD*/
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
AS
BEGIN
	INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('<25')
  INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('25 - 35')
  INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('35 - 55')
  INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('>55')

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_RANGO_EDAD)
PRINT('Datos migrados a la tabla HARAKIRI.BI_RANGO_EDAD. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_VENTA_PRODUCTO (VENTA_PRODUCTO_CODIGO, EDAD_CODIGO, TIEMPO_CODIGO, PROVINCIA_CODIGO, CANAL_CODIGO, MEDIO_DE_PAGO_CODIGO, CATEGORIA_CODIGO, PRODUCTO_CODIGO, MEDIO_ENVIO_CODIGO, VENTA_ENVIO_PRECIO, PRODUCTO_PRECIO_TOTAL, VENTA_CODIGO)
SELECT DISTINCT VPP.VENTA_POR_PRODUCTO_CODIGO, RE.EDAD_CODIGO, T.TIEMPO_CODIGO, P.PROVINCIA_CODIGO, CA.CANAL_CODIGO, MDPV.MEDIO_DE_PAGO_CODIGO, CAT.CATEGORIA_CODIGO, PROD.PRODUCTO_CODIGO, ME.MEDIO_ENVIO_CODIGO, MDEPL.VENTA_ENVIO_PRECIO, VPP.PRODUCTO_PRECIO_TOTAL, V.VENTA_CODIGO
FROM HARAKIRI.VENTA_POR_PRODUCTO VPP
JOIN HARAKIRI.VENTA V ON VPP.VENTA_CODIGO = V.VENTA_CODIGO
JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = VPP.PRODUCTO_VARIANTE_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN O ES VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE_CODIGO Y CORREGIR EN EL DER EN ESE CASO
JOIN HARAKIRI.PRODUCTO PROD ON PROD.PRODUCTO_CODIGO = PV.PRODUCTO_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN O ES PRODUCTO_VARIANTE_PRODUCTO_CODIGO Y CORREGIR EN EL DER EN ESE CASO
JOIN HARAKIRI.CLIENTE CLI ON V.VENTA_CLIENTE_CODIGO = CLI.CLIENTE_CODIGO
--JOIN HARAKIRI.LOCALIDAD L ON CLI.CLIENTE_LOCALIDAD_CODIGO = L.LOCALIDAD_CODIGO -- SAQUE ESTE JOIN PARA AHORRARLO Y APROVECHAR EL MEDIO ENVIO POR LOCALIDAD
JOIN HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD MDEPL ON MDEPL.MEDIO_ENVIO_POR_LOCALIDAD_CODIGO = V.VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO
JOIN HARAKIRI.LOCALIDAD L ON L.LOCALIDAD_CODIGO = MDEPL.LOCALIDAD_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN
JOIN HARAKIRI.PROVINCIA P ON L.LOCALIDAD_PROVINCIA_CODIGO = P.PROVINCIA_CODIGO
JOIN HARAKIRI.CANAL CA ON V.VENTA_CANAL_CODIGO = CA.CANAL_CODIGO
JOIN HARAKIRI.MEDIO_DE_PAGO_VENTA MDPV ON MDPV.MEDIO_DE_PAGO_CODIGO = V.VENTA_MEDIO_DE_PAGO_CODIGO
JOIN HARAKIRI.CATEGORIA CAT ON CAT.CATEGORIA_CODIGO = PROD.PRODUCTO_CATEGORIA_CODIGO
JOIN HARAKIRI.MEDIO_ENVIO ME ON ME.MEDIO_ENVIO_CODIGO = MDEPL.MEDIO_ENVIO_CODIGO
JOIN HARAKIRI.BI_RANGO_EDAD RE ON RE.EDAD_CATEGORIA = HARAKIRI.rangoEtario_fx(CLI.CLIENTE_FECHA_NAC) -- VER EL NOMBRE QUE SE VA A USAR Y VER QUE RETORNE UN NVARCHAR
JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(V.VENTA_FECHA) AND T.TIEMPO_MES = month(V.VENTA_FECHA)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_HECHO_VENTA_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA
AS
BEGIN
INSERT INTO HARAKIRI.BI_PROVINCIA (PROVINCIA_CODIGO, PROVINCIA_NOMBRE)
SELECT DISTINCT PROVINCIA_CODIGO, PROVINCIA_NOMBRE FROM HARAKIRI.PROVINCIA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_PROVINCIA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_PROVINCIA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO
AS
BEGIN
INSERT INTO HARAKIRI.BI_MEDIO_DE_PAGO (MEDIO_DE_PAGO_CODIGO, MEDIO_DE_PAGO_NOMBRE, MEDIO_DE_PAGO_COSTO)
SELECT DISTINCT MEDIO_DE_PAGO_CODIGO, MEDIO_DE_PAGO_NOMBRE, MEDIO_DE_PAGO_COSTO FROM HARAKIRI.MEDIO_DE_PAGO_VENTA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_MEDIO_DE_PAGO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_MEDIO_DE_PAGO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA
AS
BEGIN
INSERT INTO HARAKIRI.BI_CATEGORIA (CATEGORIA_CODIGO, CATEGORIA_NOMBRE)
  SELECT
    C.CATEGORIA_CODIGO,
    C.CATEGORIA_NOMBRE
  FROM HARAKIRI.CATEGORIA C

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_CATEGORIA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_CATEGORIA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_PRODUCTO (PRODUCTO_CODIGO, PRODUCTO_NOMBRE)
  SELECT
    P.PRODUCTO_CODIGO,
    P.PRODUCTO_NOMBRE
  FROM HARAKIRI.PRODUCTO P


DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA
AS
BEGIN
INSERT INTO HARAKIRI.BI_CANAL_VENTA (CANAL_CODIGO, CANAL_COSTO, CANAL_NOMBRE)
  SELECT
    C.CANAL_CODIGO,
    C.CANAL_COSTO,
	C.CANAL_NOMBRE
  FROM HARAKIRI.CANAL C

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_CANAL_VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_CANAL_VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_COMPRA_PRODUCTO (COMPRA_PRODUCTO_CODIGO, PROVEEDOR_CUIT, TIEMPO_CODIGO, PRODUCTO_CODIGO, PRODUCTO_CANTIDAD,PRODUCTO_PRECIO_UNITARIO)
SELECT DISTINCT CPP.COMPRA_POR_PRODUCTO_CODIGO, PRO.PROVEEDOR_CUIT, T.TIEMPO_CODIGO, P.PRODUCTO_CODIGO,CPP.PRODUCTO_CANTIDAD, CPP.PRODUCTO_PRECIO_TOTAL/CPP.PRODUCTO_CANTIDAD
FROM HARAKIRI.COMPRA_POR_PRODUCTO CPP
JOIN HARAKIRI.COMPRA C ON CPP.COMPRA_NUMERO = C.COMPRA_NUMERO
JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = CPP.PRODUCTO_VARIANTE_CODIGO 
JOIN HARAKIRI.PRODUCTO P ON P.PRODUCTO_CODIGO = PV.PRODUCTO_CODIGO 
JOIN HARAKIRI.PROVEEDOR PRO ON C.PROVEEDOR_CUIT = PRO.PROVEEDOR_CUIT
JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(C.COMPRA_FECHA) AND T.TIEMPO_MES = month(C.COMPRA_FECHA)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_HECHO_COMPRA_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_HECHO_COMPRA_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO
AS
BEGIN
INSERT INTO HARAKIRI.BI_MEDIO_DE_ENVIO (MEDIO_ENVIO_CODIGO, MEDIO_ENVIO_NOMBRE)
SELECT DISTINCT MEDIO_ENVIO_CODIGO, MEDIO_ENVIO_NOMBRE FROM HARAKIRI.MEDIO_ENVIO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_MEDIO_DE_ENVIO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_MEDIO_DE_ENVIO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_VENTA
AS
BEGIN
INSERT INTO HARAKIRI.BI_VENTA (VENTA_CODIGO, VENTA_TOTAL)
SELECT DISTINCT VENTA_CODIGO, VENTA_TOTAL FROM HARAKIRI.VENTA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR
AS
BEGIN
INSERT INTO HARAKIRI.BI_PROVEEDOR (PROVEEDOR_CUIT, PROVEEDOR_RAZON_SOCIAL)
SELECT DISTINCT PROVEEDOR_CUIT, PROVEEDOR_RAZON_SOCIAL FROM HARAKIRI.PROVEEDOR

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_PROVEEDOR)
PRINT('Datos migrados a la tabla HARAKIRI.BI_PROVEEDOR. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_TIPO_DE_DESCUENTO (TIPO_DESCUENTO_CODIGO, TIPO_DESCUENTO_NOMBRE)
SELECT DISTINCT DESCUENTO_CONCEPTO_CODIGO, DESCUENTO_CONCEPTO_NOMBRE FROM HARAKIRI.DESCUENTO_CONCEPTO
UNION SELECT 4, 'Cupon'
DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_TIPO_DE_DESCUENTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_TIPO_DE_DESCUENTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

/*CREATE PROCEDURE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_VENTA_DESCUENTO (TIPO_DESCUENTO_CODIGO, DESCUENTO_IMPORTE, TIEMPO_CODIGO, CANAL_CODIGO)
  SELECT
    1,
    DV.DESCUENTO_IMPORTE,
	C.CANAL_NOMBRE
  FROM HARAKIRI.DESCUENTO_POR_VENTA DV
  INNER JOIN HARAKIRI.BI_TIPO_DESCUENTO TD ON TD.TIPO_DESCUENTO_CODIGO = V.VENTA_CODIGO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_HECHO_VENTA_DESCUENTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_HECHO_VENTA_DESCUENTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)*/

/*END
GO*/

--Execs
EXEC HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA
EXEC HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO
EXEC HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO
EXEC HARAKIRI.MIGRAR_TABLA_BI_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR
EXEC HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_TIEMPO
EXEC HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA
EXEC HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO

-------------------------------------



IF OBJECT_ID('HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES
    PRINT('Vista HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES eliminado')
END
GO

CREATE VIEW HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES
AS
SELECT  E.EDAD_CATEGORIA,T.TIEMPO_ANIO,T.TIEMPO_MES,vp.CATEGORIA_CODIGO,COUNT(vp.CATEGORIA_CODIGO)  as [VECES_VENDIDA_CATEGORIA]
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
JOIN HARAKIRI.BI_CATEGORIA C ON C.CATEGORIA_CODIGO = VP.CATEGORIA_CODIGO
JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
JOIN HARAKIRI.BI_RANGO_EDAD E ON VP.EDAD_CODIGO = E.EDAD_CODIGO
WHERE vp.CATEGORIA_CODIGO in(SELECT TOP 5 vp.CATEGORIA_CODIGO FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO vp	GROUP BY vp.CATEGORIA_CODIGO ORDER BY COUNT(DISTINCT vp.CATEGORIA_CODIGO) DESC)

GROUP BY  E.EDAD_CATEGORIA,T.TIEMPO_ANIO,T.TIEMPO_MES,vp.CATEGORIA_CODIGO

GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES)
PRINT('View TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES creada. Cant filas: ' + @CANTIDAD_REGISTROS)




