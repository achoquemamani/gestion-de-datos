USE GD2C2022;
GO

----------------------------------------------------------------------------------------------------------
/*CREANDO CONSTRAINT FK PARA LAS TABLAS DE LA BASE DE DATOS */

/*AGREGANDO CONSTRAINS FK A LA TABLA LOCALIDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_LOCALIDAD_PROVINCIA')
BEGIN
	ALTER TABLE HARAKIRI.LOCALIDAD
	ADD CONSTRAINT FK_LOCALIDAD_PROVINCIA FOREIGN KEY(LOCALIDAD_PROVINCIA_CODIGO) REFERENCES HARAKIRI.PROVINCIA(PROVINCIA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.LOCALIDAD y HARAKIRI.PROVINCIA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_MEDIO_ENVIO_POR_LOCALIDAD_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD
	ADD CONSTRAINT FK_MEDIO_ENVIO_POR_LOCALIDAD_LOCALIDAD FOREIGN KEY(LOCALIDAD_CODIGO) REFERENCES HARAKIRI.LOCALIDAD(LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD y HARAKIRI.LOCALIDAD agregada')
END
GO
/*AGREGANDO CONSTRAINS FK A LA TABLA COMPRA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_MEDIO_DE_PAGO')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA
	ADD CONSTRAINT FK_COMPRA_MEDIO_DE_PAGO FOREIGN KEY(COMPRA_MEDIO_DE_PAGO_CODIGO) REFERENCES HARAKIRI.MEDIO_DE_PAGO_COMPRA(MEDIO_DE_PAGO_COMPRA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.COMPRA y HARAKIRI.MEDIO_DE_PAGO agregada')
END
GO
/*AGREGANDO CONSTRAINS FK A LA TABLA  MEDIO_ENVIO_POR_LOCALIDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_MEDIO_ENVIO_POR_LOCALIDAD_MEDIO_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD
	ADD CONSTRAINT FK_MEDIO_ENVIO_POR_LOCALIDAD_MEDIO_ENVIO FOREIGN KEY(MEDIO_ENVIO_CODIGO) REFERENCES HARAKIRI.MEDIO_ENVIO(MEDIO_ENVIO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD y HARAKIRI.MEDIO_ENVIO agregada')
END
GO
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			   WHERE CONSTRAINT_NAME ='FK_COMPRA_PROVEEDOR')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA
	ADD CONSTRAINT FK_COMPRA_PROVEEDOR FOREIGN KEY(PROVEEDOR_CUIT) REFERENCES HARAKIRI.PROVEEDOR(PROVEEDOR_CUIT)
	PRINT('Foreign key entre las tablas HARAKIRI.COMPRA y HARAKIRI.PROVEEDOR agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA CUPON*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_CUPON_CUPON_TIPO')
BEGIN
	ALTER TABLE HARAKIRI.CUPON
	ADD CONSTRAINT FK_CUPON_CUPON_TIPO FOREIGN KEY(CUPON_TIPO_CODIGO) REFERENCES HARAKIRI.CUPON_TIPO(CUPON_TIPO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.CUPON y HARAKIRI.CUPON_TIPO agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA VENTA_POR_CUPON*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_CUPON_CUPON')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_CUPON
	ADD CONSTRAINT FK_VENTA_POR_CUPON_CODIGO FOREIGN KEY(CUPON_CODIGO) REFERENCES HARAKIRI.CUPON(CUPON_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA_POR_CUPON y HARAKIRI.CUPON agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA VENTA_POR_CUPON*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_CUPON_VENTA_CODIGO')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_CUPON
	ADD CONSTRAINT FK_VENTA_POR_CUPON_VENTA_CODIGO FOREIGN KEY(VENTA_CODIGO) REFERENCES HARAKIRI.VENTA(VENTA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA_POR_CUPON y HARAKIRI.VENTA agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA DESCUENTO_POR_VENTA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO_CODIGO')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA
	ADD CONSTRAINT FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO_CODIGO FOREIGN KEY(DESCUENTO_CONCEPTO_CODIGO) REFERENCES HARAKIRI.DESCUENTO_CONCEPTO(DESCUENTO_CONCEPTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.DESCUENTO_POR_VENTA y HARAKIRI.DESCUENTO_CONCEPTO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA
	ADD CONSTRAINT FK_DESCUENTO_POR_VENTA_VENTA_CODIGO FOREIGN KEY(VENTA_CODIGO) REFERENCES HARAKIRI.VENTA(VENTA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.DESCUENTO_POR_VENTA y HARAKIRI.VENTA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_COMPRA_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_COMPRA
	ADD CONSTRAINT FK_DESCUENTO_COMPRA_COMPRA FOREIGN KEY(COMPRA_NUMERO) REFERENCES HARAKIRI.COMPRA(COMPRA_NUMERO)
	PRINT('Foreign key entre las tablas HARAKIRI.DESCUENTO_COMPRA y HARAKIRI.COMPRA agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA COMPRA_POR_PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_POR_PRODUCTO_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA_POR_PRODUCTO
	ADD CONSTRAINT FK_COMPRA_POR_PRODUCTO_COMPRA FOREIGN KEY(COMPRA_NUMERO) REFERENCES HARAKIRI.COMPRA(COMPRA_NUMERO)
	PRINT('Foreign key entre las tablas HARAKIRI.COMPRA_POR_PRODUCTO y HARAKIRI.COMPRA agregada')
END
GO


IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_POR_PRODUCTO_PRODUCTO_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA_POR_PRODUCTO
	ADD CONSTRAINT FK_COMPRA_POR_PRODUCTO_PRODUCTO_VARIANTE FOREIGN KEY(PRODUCTO_VARIANTE_CODIGO) REFERENCES HARAKIRI.COMPRA(PRODUCTO_VARIANTE_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.COMPRA_POR_PRODUCTO y HARAKIRI.PRODUCTO_VARIANTE agregada')

/*AGREGANDO CONSTRAINS FK A LA TABLA PROVEEDOR*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			   WHERE CONSTRAINT_NAME ='FK_PROVEEDOR_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.PROVEEDOR
	ADD CONSTRAINT FK_PROVEEDOR_LOCALIDAD FOREIGN KEY(PROVEEDOR_LOCALIDAD_CODIGO) REFERENCES HARAKIRI.PROVEEDOR(LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.LOCALIDAD y HARAKIRI.PROVEEDOR agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_CLIENTE_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.CLIENTE
	ADD CONSTRAINT FK_CLIENTE_LOCALIDAD FOREIGN KEY(CLIENTE_LOCALIDAD_CODIGO) REFERENCES HARAKIRI.PROVEEDOR(LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.LOCALIDAD y HARAKIRI.CLIENTE agregada')
END
GO
