
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

/*AGREGANDO CONSTRAINS FK A LA TABLA MEDIO_ENVIO_POR_LOCALIDAD*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_MEDIO_ENVIO_POR_LOCALIDAD_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD
	ADD CONSTRAINT FK_MEDIO_ENVIO_POR_LOCALIDAD_LOCALIDAD FOREIGN KEY(LOCALIDAD_CODIGO) REFERENCES HARAKIRI.LOCALIDAD(LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD y HARAKIRI.LOCALIDAD agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_MEDIO_ENVIO_POR_LOCALIDAD_MEDIO_ENVIO')
BEGIN
	ALTER TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD
	ADD CONSTRAINT FK_MEDIO_ENVIO_POR_LOCALIDAD_MEDIO_ENVIO FOREIGN KEY(MEDIO_ENVIO_CODIGO) REFERENCES HARAKIRI.MEDIO_ENVIO(MEDIO_ENVIO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD y HARAKIRI.MEDIO_ENVIO agregada')
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
	ADD CONSTRAINT FK_VENTA_POR_CUPON_CUPON FOREIGN KEY(CUPON_CODIGO) REFERENCES HARAKIRI.CUPON(CUPON_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA_POR_CUPON y HARAKIRI.CUPON agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_CUPON_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_CUPON
	ADD CONSTRAINT FK_VENTA_POR_CUPON_VENTA FOREIGN KEY(VENTA_CODIGO) REFERENCES HARAKIRI.VENTA(VENTA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA_POR_CUPON y HARAKIRI.VENTA agregada')
END
GO


/*AGREGANDO CONSTRAINS FK A LA TABLA DESCUENTO_POR_VENTA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA
	ADD CONSTRAINT FK_DESCUENTO_POR_VENTA_DESCUENTO_CONCEPTO FOREIGN KEY(DESCUENTO_CONCEPTO_CODIGO) REFERENCES HARAKIRI.DESCUENTO_CONCEPTO(DESCUENTO_CONCEPTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.DESCUENTO_POR_VENTA y HARAKIRI.DESCUENTO_CONCEPTO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_POR_VENTA_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_POR_VENTA
	ADD CONSTRAINT FK_DESCUENTO_POR_VENTA_VENTA FOREIGN KEY(VENTA_CODIGO) REFERENCES HARAKIRI.VENTA(VENTA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.DESCUENTO_POR_VENTA y HARAKIRI.VENTA agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA DESCUENTO_COMPRA*/
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
	ADD CONSTRAINT FK_COMPRA_POR_PRODUCTO_PRODUCTO_VARIANTE FOREIGN KEY(PRODUCTO_VARIANTE_CODIGO) REFERENCES HARAKIRI.PRODUCTO_VARIANTE (PRODUCTO_VARIANTE_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.COMPRA_POR_PRODUCTO y HARAKIRI.PRODUCTO_VARIANTE agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA PROVEEDOR*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			   WHERE CONSTRAINT_NAME ='FK_PROVEEDOR_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.PROVEEDOR
	ADD CONSTRAINT FK_PROVEEDOR_LOCALIDAD FOREIGN KEY(PROVEEDOR_LOCALIDAD_CODIGO) REFERENCES HARAKIRI.LOCALIDAD(LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.LOCALIDAD y HARAKIRI.PROVEEDOR agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA CLIENTE*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_CLIENTE_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.CLIENTE
	ADD CONSTRAINT FK_CLIENTE_LOCALIDAD FOREIGN KEY(CLIENTE_LOCALIDAD_CODIGO) REFERENCES HARAKIRI.LOCALIDAD(LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.CLIENTE y HARAKIRI.LOCALIDAD agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA PRODUCTO*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_MARCA')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO
	ADD CONSTRAINT FK_PRODUCTO_MARCA FOREIGN KEY(PRODUCTO_MARCA_CODIGO) REFERENCES HARAKIRI.MARCA(MARCA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.PRODUCTO y HARAKIRI.MARCA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_CATEGORIA')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO
	ADD CONSTRAINT FK_PRODUCTO_CATEGORIA FOREIGN KEY(PRODUCTO_CATEGORIA_CODIGO) REFERENCES HARAKIRI.CATEGORIA(CATEGORIA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.PRODUCTO y HARAKIRI.CATEGORIA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_MATERIAL')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO
	ADD CONSTRAINT FK_PRODUCTO_MATERIAL FOREIGN KEY(PRODUCTO_MATERIAL_CODIGO) REFERENCES HARAKIRI.MATERIAL(MATERIAL_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.PRODUCTO y HARAKIRI.MATERIAL agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA PRODUCTO_VARIANTE*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_VARIANTE_PRODUCTO')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO_VARIANTE
	ADD CONSTRAINT FK_PRODUCTO_VARIANTE_PRODUCTO FOREIGN KEY(PRODUCTO_CODIGO) REFERENCES HARAKIRI.PRODUCTO(PRODUCTO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.PRODUCTO_VARIANTE y HARAKIRI.PRODUCTO agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_PRODUCTO_VARIANTE_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.PRODUCTO_VARIANTE
	ADD CONSTRAINT FK_PRODUCTO_VARIANTE_VARIANTE FOREIGN KEY(VARIANTE_CODIGO) REFERENCES HARAKIRI.VARIANTE(VARIANTE_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.PRODUCTO_VARIANTE y HARAKIRI.VARIANTE agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA VARIANTE*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VARIANTE_TIPO_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.VARIANTE
	ADD CONSTRAINT FK_VARIANTE_TIPO_VARIANTE FOREIGN KEY(VARIANTE_TIPO_VARIANTE_CODIGO) REFERENCES HARAKIRI.TIPO_VARIANTE(TIPO_VARIANTE_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VARIANTE y HARAKIRI.TIPO_VARIANTE agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA VENTA_POR_PRODUCTO*/

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_PRODUCTO
	ADD CONSTRAINT FK_VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE FOREIGN KEY(PRODUCTO_VARIANTE_CODIGO) REFERENCES HARAKIRI.PRODUCTO_VARIANTE(PRODUCTO_VARIANTE_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA_POR_PRODUCTO y HARAKIRI.PRODUCTO_VARIANTE agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_POR_PRODUCTO_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.VENTA_POR_PRODUCTO
	ADD CONSTRAINT FK_VENTA_POR_PRODUCTO_VENTA FOREIGN KEY(VENTA_CODIGO) REFERENCES HARAKIRI.VENTA(VENTA_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA_POR_PRODUCTO y HARAKIRI.VENTA agregada')
END
GO

/*AGREGANDO CONSTRAINS FK A LA TABLA VENTA*/
IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_CANAL')
BEGIN
	ALTER TABLE HARAKIRI.VENTA
	ADD CONSTRAINT FK_VENTA_CANAL FOREIGN KEY(VENTA_CANAL_CODIGO) REFERENCES HARAKIRI.CANAL(CANAL_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA y HARAKIRI.CANAL agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_MEDIO_DE_PAGO_VENTA')
BEGIN
	ALTER TABLE HARAKIRI.VENTA
	ADD CONSTRAINT FK_VENTA_MEDIO_DE_PAGO_VENTA FOREIGN KEY(VENTA_MEDIO_DE_PAGO_CODIGO) REFERENCES HARAKIRI.MEDIO_DE_PAGO_VENTA(MEDIO_DE_PAGO_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA y HARAKIRI.MEDIO_DE_PAGO_VENTA agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_CLIENTE')
BEGIN
	ALTER TABLE HARAKIRI.VENTA
	ADD CONSTRAINT FK_VENTA_CLIENTE FOREIGN KEY(VENTA_CLIENTE_CODIGO) REFERENCES HARAKIRI.CLIENTE(CLIENTE_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA y HARAKIRI.CLIENTE agregada')
END
GO

IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_VENTA_MEDIO_ENVIO_POR_LOCALIDAD')
BEGIN
	ALTER TABLE HARAKIRI.VENTA
	ADD CONSTRAINT FK_VENTA_MEDIO_ENVIO_POR_LOCALIDAD FOREIGN KEY(VENTA_CANAL_CODIGO) REFERENCES HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD(MEDIO_ENVIO_POR_LOCALIDAD_CODIGO)
	PRINT('Foreign key entre las tablas HARAKIRI.VENTA y HARAKIRI.LOCALIDAD agregada')
END
GO
