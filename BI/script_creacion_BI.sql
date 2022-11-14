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


-----------------------------------------------------------------------------------------------------
/*BORRADO DE ESQUEMA*/

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'HARAKIRI')
BEGIN
   DROP SCHEMA HARAKIRI
   PRINT('Esquema HARAKIRI borrado')
END
GO


IF EXISTS (select * from sys.objects where object_id = OBJECT_ID('HARAKIRI.rangoEtario_fx') and type = 'FN')
	DROP FUNCTION HARAKIRI.rangoEtario_fx
END
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
    CANAL_CODIGO decimal(19,0) not null,
    CANA_NOMBRE nvarchar(50),
    CANAL_CODIGO decimal(18,2) not null,
);
GO

CREATE TABLE HARAKIRI.BI_PROVEEDOR(
    PROVEEDOR_CIUT decimal(18,0) not null,
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
		EDAD_CODIGO INT NOT NULL IDENTITY(1,1),
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
    TIPO_DESCUENTO_CODIGO nvarchar(50),
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
	ADD CONSTRAINT PK_BI_VENTA PRIMARY KEY (CANAL_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.BI_VENTA agregada')
END
GO

/** Agregado CONSTRAINT PK A LA TBL BI_PROVEEDOR */
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.BI_PROVEEDOR
	ADD CONSTRAINT PK_BI_PROVEEDOR PRIMARY KEY (PROVEEDOR_CIUT)
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
               WHERE CONSTRAINT_NAME ='FK_BI_HECHO_VENTA_DESCUENTO_BI_TIPO_DE_DESCUENTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_DESCUENTO
	ADD CONSTRAINT FK_BI_HECHO_VENTA_DESCUENTO_BI_TIPO_DE_DESCUENTO FOREIGN KEY(TIPO_DESCUENTO_CODIGO) REFERENCES HARAKIRI.BI_TIPO_DE_DESCUENTO(TIPO_DESCUENTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.BI_HECHO_VENTA_DESCUENTO y HARAKIRI.BI_TIPO_DE_DESCUENTO agregada')
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