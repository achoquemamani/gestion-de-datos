
----------------------------------------------------------------------------------------------------------
/*CREANDO CONSTRAINT PK PARA LAS TABLAS DE LA BASE DE DATOS*/

/*AGREGANDO CONSTRAINT PK A LA TABLA LOCALIDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.LOCALIDAD
	ADD CONSTRAINT PK_LOCALIDAD PRIMARY KEY (LOCALIDAD_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.LOCALIDAD agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA PROVINCIA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_PROVINCIA')
BEGIN
	ALTER TABLE HARAKIRI.PROVINCIA
	ADD CONSTRAINT PK_PROVINCIA PRIMARY KEY (PROVINCIA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.PROVINCIA agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA MEDIO_DE_PAGO_VENTA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_MEDIO_DE_PAGO_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_DE_PAGO_VENTA
	ADD CONSTRAINT PK_MEDIO_DE_PAGO_VENTA PRIMARY KEY (MEDIO_DE_PAGO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.MEDIO_DE_PAGO_VENTA agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA MEDIO_DE_ENVIO_POR_LOCALIDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_MEDIO_ENVIO_POR_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD
	ADD CONSTRAINT PK_MEDIO_ENVIO_POR_LOCALIDAD PRIMARY KEY (MEDIO_ENVIO_POR_LOCALIDAD_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA MEDIO_DE_ENVIO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_MEDIO_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO
	ADD CONSTRAINT PK_MEDIO_ENVIO PRIMARY KEY (MEDIO_ENVIO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.MEDIO_ENVIO agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA MEDIO_DE_PAGO_COMPRA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_MEDIO_DE_PAGO_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_DE_PAGO_COMPRA
	ADD CONSTRAINT PK_MEDIO_DE_PAGO_COMPRA PRIMARY KEY (MEDIO_DE_PAGO_COMPRA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.MEDIO_DE_PAGO_COMPRA agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA DESCUENTO_COMPRA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_DESCUENTO_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_COMPRA
	ADD CONSTRAINT PK_DESCUENTO_COMPRA PRIMARY KEY (DESCUENTO_COMPRA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.DESCUENTO_COMPRA agregada')
END
GO

/* AGREGANDO CONSTRAINT PK A LA TABLA COMPRA_POR_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_COMPRA_POR_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA_POR_PRODUCTO
	ADD CONSTRAINT PK_COMPRA_POR_PRODUCTO PRIMARY KEY (COMPRA_NUMERO, PRODUCTO_VARIANTE_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.COMPRA_POR_PRODUCTO agregada')
END
GO
/*AGREGANDO CONSTRAINT PK A LA TABLA COMPRA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA
	ADD CONSTRAINT PK_COMPRA PRIMARY KEY (COMPRA_NUMERO)
	PRINT('Primary key de la tabla HARAKIRI.COMPRA agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA CLIENTE*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_CLIENTE')
BEGIN
	ALTER TABLE HARAKIRI.CLIENTE
	ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (CLIENTE_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.CLIENTE agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA MATERIAL*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_MATERIAL')
BEGIN
	ALTER TABLE HARAKIRI.MATERIAL
	ADD CONSTRAINT PK_MATERIAL PRIMARY KEY (MATERIAL_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.MATERIAL agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA CUPON_TIPO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_CUPON_TIPO')
BEGIN
	ALTER TABLE HARAKIRI.CUPON_TIPO
	ADD CONSTRAINT PK_CUPON_TIPO PRIMARY KEY (CUPON_TIPO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.CUPON_TIPO agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA CUPON*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_CUPON')
BEGIN
	ALTER TABLE HARAKIRI.CUPON
	ADD CONSTRAINT PK_CUPON PRIMARY KEY (CUPON_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.CUPON agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA CANAL*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_CANAL')
BEGIN
	ALTER TABLE HARAKIRI.CANAL
	ADD CONSTRAINT PK_CANAL PRIMARY KEY (CANAL_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.CANAL agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA VENTA_POR_CUPON*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_VENTA_POR_CUPON')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_CUPON
	ADD CONSTRAINT PK_VENTA_POR_CUPON PRIMARY KEY (CUPON_CODIGO, VENTA_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.VENTA_POR_CUPON agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA DESCUENTO_CONCEPTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_DESCUENTO_CONCEPTO')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_CONCEPTO
	ADD CONSTRAINT PK_DESCUENTO_CONCEPTO PRIMARY KEY (DESCUENTO_CONCEPTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.DESCUENTO_CONCEPTO agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA DESCUENTO_POR_VENTA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_DESCUENTO_POR_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA
	ADD CONSTRAINT PK_DESCUENTO_POR_VENTA PRIMARY KEY (DESCUENTO_CODIGO)
	PRINT('Primary key de la tabla HARAKIRI.DESCUENTO_POR_VENTA agregada')
END
GO

/*AGREGANDO CONSTRAINT PK A LA TABLA PROVEEDOR*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_NAME ='PK_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.PROVEEDOR
	ADD CONSTRAINT PK_PROVEEDOR PRIMARY KEY (PROVEEDOR_CUIT)
	PRINT('Primary key de la tabla HARAKIRI.PROVEEDOR agregada')
END
GO
