
----------------------------------------------------------------------------------------------------------
/*CREANDO CONSTRAINT PK PARA LAS TABLAS BI*/


/* AGREGANDO CONSTRAINT PK A LA TABLA BI_HECHO_VENTA_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_BI_HECHO_VENTA_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.BI_HECHO_VENTA_PRODUCTO
	ADD CONSTRAINT PK_BI_HECHO_VENTA_PRODUCTO PRIMARY KEY (HECHO_VENTA_PRODUCTO_CODIGO)
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
	ADD CONSTRAINT PK_BI_HECHO_COMPRA_PRODUCTO PRIMARY KEY (BI_HECHO_COMPRA_PRODUCTO_CODIGO)
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
