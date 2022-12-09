

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
