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
GO/* AGREGANDO CONSTRAINT PK A LA TABLA BI_HECHO_VENTA_PRODUCTO*/
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
GO/*AGREGANDO CONSTRAINTS FK A LA TABLA BI_HECHO_VENTA_PRODUCTO*/
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