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
               WHERE CONSTRAINT_NAME ='FK_DESCUENTO_COMPRA_COMPRA')
BEGIN
	ALTER TABLE HARAKIRI.DESCUENTO_COMPRA
	ADD CONSTRAINT FK_DESCUENTO_COMPRA_COMPRA FOREIGN KEY(COMPRA_NUMERO) REFERENCES HARAKIRI.COMPRA(COMPRA_NUMERO)
	PRINT('Foreign key entre las tablas HARAKIRI.DESCUENTO_COMPRA y HARAKIRI.COMPRA agregada')
END
GO


IF NOT EXISTS (SELECT * 
    		   FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
               WHERE CONSTRAINT_NAME ='FK_COMPRA_POR_PRODUCTO_COMBRA')
BEGIN
	ALTER TABLE HARAKIRI.COMPRA_POR_PRODUCTO
	ADD CONSTRAINT FK_COMPRA_POR_PRODUCTO_COMBRA FOREIGN KEY(COMPRA_NUMERO) REFERENCES HARAKIRI.COMPRA(COMPRA_NUMERO)
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
END
GO