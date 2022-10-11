USE GD2C2022
GO  
----------------------------------------------------------------------------------------------------------
/*CREACION DE TABLAS*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].PROVEEDOR') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.PROVEEDOR (
		
        PROVEEDOR_CUIT nvarchar(50) NOT NULL,
        PROVEEDOR_LOCALIDAD_CODIGO decimal(18,0) NOT NULL, --FK A LOCALIDAD
        PROVEEDOR_RAZON_SOCIAL nvarchar(50) NOT NULL, 
        PROVEEDOR_DOMICILIO nvarchar(50) NOT NULL, 
        PROVEEDOR_MAIL nvarchar(50) NOT NULL
	)
	PRINT('Tabla HARAKIRI.PROVEEDOR creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].LOCALIDAD') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.LOCALIDAD (
		
        LOCALIDAD_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1),
        LOCALIDAD_PROVINCIA_CODIGO decimal(18,0) NOT NULL,
        LOCALIDAD_NOMBRE NVARCHAR(255) NOT NULL,
        LOCALIDAD_CODIGO_POSTAL decimal(18,0) NOT NULL
	)
	PRINT('Tabla HARAKIRI.LOCALIDAD creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].PROVINCIA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.PROVINCIA (
		
        PROVINCIA_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1),
        PROVINCIA_NOMBRE NVARCHAR(255) NOT NULL
	)
	PRINT('Tabla HARAKIRI.PROVINCIA creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].COMPRA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.COMPRA (
		
        COMPRA_NUMERO decimal(19,0) NOT NULL,
        COMPRA_MEDIO_DE_PAGO_CODIGO decimal(19,0), --FK
        PROVEEDOR_CUIT nvarchar(50), --FK
        COMPRA_FECHA date,
        COMPRA_TOTAL decimal(18,2)
	)
	PRINT('Tabla HARAKIRI.COMPRA creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].VENTA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.VENTA (
		
        VENTA_CODIGO decimal(19,0) NOT NULL,
        VENTA_CANAL_CODIGO decimal(19,0)
        VENTA_CUPON_CODIGO nvarchar(255)
        VENTA_MEDIO_DE_PAGO_CODIGO decimal(19, 0)
        VENTA_CLIENTE_CODIGO decimal(19, 0)
        VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO decimal(19, 0)
        VENTA_FECHA date
        VENTA_TOTAL decimal(18, 2)
	)
	PRINT('Tabla HARAKIRI.VENTA creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].MEDIO_DE_PAGO_VENTA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.MEDIO_DE_PAGO_VENTA (

        MEDIO_DE_PAGO_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1) ,
        MEDIO_DE_PAGO_NOMBRE NVARCHAR(255) NOT NULL,
        MEDIO_DE_PAGO_COSTO decimal(18,2) NOT NULL
	)
	PRINT('Tabla HARAKIRI.MEDIO_DE_PAGO_VENTA creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].MEDIO_ENVIO_POR_LOCALIDAD') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD (

        MEDIO_ENVIO_POR_LOCALIDAD_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1),
        LOCALIDAD_CODIGO decimal(18,0) NOT NULL,
        MEDIO_DE_ENVIO_CODIGO decimal(19,0) NOT NULL,
        VENTA_ENVIO_PRECIO decimal(18,2) NOT NULL
	)
	PRINT('Tabla HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].MEDIO_ENVIO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.MEDIO_ENVIO (

        MEDIO_ENVIO_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1) ,
        MEDIO_ENVIO_NOMBRE NVARCHAR(255) NOT NULL
	)
	PRINT('Tabla HARAKIRI.MEDIO_ENVIO creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].CLIENTE') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.CLIENTE (

	CLIENTE_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1),
        CLIENTE_NOMBRE nvarchar(255) NOT NULL,
        CLIENTE_APELLIDO nvarchar(255) NOT NULL ,
        CLIENTE_DNI decimal(18,0) NOT NULL,
        CLIENTE_DIRECCION nvarchar(255) NOT NULL,
        CLIENTE_TELEFONO decimal(18,0) NOT NULL,
        CLIENTE_MAIL nvarchar(255) NOT NULL,
        CLIENTE_FECHA_NAC date NOT NULL,
        CLIENTE_LOCALIDAD_CODIGO decimal(18,0) NOT NULL
        )
	PRINT('Tabla HARAKIRI.CLIENTE creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].MATERIAL') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.MATERIAL (
                
	MATERIAL_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1),
        MATERIAL_NOMBRE nvarchar(50) NOT NULL
        )
	PRINT('Tabla HARAKIRI.MATERIAL creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].CUPON_TIPO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.CUPON_TIPO (

        CUPON_TIPO_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1),
        CUPON_TIPO_NOMBRE nvarchar(50) NOT NULL
        )
	PRINT('Tabla HARAKIRI.CUPON_TIPO creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].CUPON') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.CUPON (

        CUPON_CODIGO nvarchar(255) NOT NULL,
        CUPON_TIPO_CODIGO decimal(19,0),
        CUPON_FECHA_DESDE date,
        CUPON_FECHA_HASTA date,
        CUPON_IMPORTE decimal(18,2),
        CUPON_VALOR decimal(18,2)
        )
	PRINT('Tabla HARAKIRI.CUPON creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].CANAL') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.CANAL (

        CANAL_CODIGO nvarchar(255) NOT NULL,
        CANAL_NOMBRE nvarchar(2555),
        CANAL_COSTO decimal(18,2)
        )
	PRINT('Tabla HARAKIRI.CANAL creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].VENTA_POR_CUPON') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.VENTA_POR_CUPON (
                
        CUPON_CODIGO nvarchar(255) NOT NULL,
        VENTA_CODIGO decimal(19,0) NOT NULL,
        CUPON_IMPORTE decimal(18,2) NOT NULL
        )
	PRINT('Tabla HARAKIRI.VENTA_POR_CUPON creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].DESCUENTO_CONCEPTO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.DESCUENTO_CONCEPTO (
        DESCUENTO_CONCEPTO_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1),
        DESCUENTO_CONCEPTO_NOMBRE nvarchar(255) NOT NULL
        )
	PRINT('Tabla HARAKIRI.DESCUENTO_CONCEPTO creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].DESCUENTO_POR_VENTA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.DESCUENTO_POR_VENTA (
        DESCUENTO_POR_VENTA_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1)
        DESCUENTO_CONCEPTO_CODIGO decimal(19,0) NOT NULL,
        VENTA_CODIGO decimal(19,0) NOT NULL,
        DESCUENTO_IMPORTE decimal(18,2) NOT NULL
        )
	PRINT('Tabla HARAKIRI.DESCUENTO_POR_VENTA creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].MEDIO_DE_PAGO_COMPRA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.MEDIO_DE_PAGO_COMPRA (

        MEDIO_DE_PAGO_COMPRA_CODIGO decimal(19,0) NOT NULL IDENTITY(1,1),
        MEDIO_DE_PAGO_COMPRA_NOMBRE NVARCHAR(255) NOT NULL
	)
	PRINT('Tabla HARAKIRI.MEDIO_DE_PAGO_COMPRA creada')
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].DESCUENTO_COMPRA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.DESCUENTO_COMPRA (

        DESCUENTO_COMPRA_CODIGO decimal(19,0) NOT NULL,
        COMPRA_NUMERO decimal(19,0) NOT NULL,
        DESCUENTO_COMPRA_VALOR decimal(18,2) NOT NULL
	)
	PRINT('Tabla HARAKIRI.DESCUENTO_COMPRA creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].COMPRA_POR_PRODUCTO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.COMPRA_POR_PRODUCTO (

        COMPRA_NUMERO decimal(19,0) NOT NULL,
        PRODUCTO_VARIANTE_CODIGO NVARCHAR(50) NOT NULL,
        PRODUCTO_CANTIDAD decimal(18,0) NOT NULL,
        PRODUCTO_PRECIO_TOTAL decimal(18,2) NOT NULL
	)
	PRINT('Tabla HARAKIRI.COMPRA_POR_PRODUCTO creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].CATEGORIA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.CATEGORIA (
                
	CATEGORIA_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1),
        CATEGORIA_NOMBRE nvarchar(50) NOT NULL
        )
	PRINT('Tabla HARAKIRI.CATEGORIA creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].MARCA') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.MARCA (
                
	MARCA_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1),
        MARCA_NOMBRE nvarchar(50) NOT NULL
        )
	PRINT('Tabla HARAKIRI.MARCA creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].PRODUCTO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.PRODUCTO (
	PRODUCTO_CODIGO nvarchar(50) NOT NULL,
        PRODUCTO_MARCA_CODIGO decimal(18,0) NOT NULL,
        PRODUCTO_MATERIAL_CODIGO decimal(18,0) NOT NULL,
        PRODUCTO_CATEGORIA_CODIGO decimal(18,0) NOT NULL ,
        PRODUCTO_NOMBRE nvarchar(50)  NOT NULL ,
        PRODUCTO_DESCRIPCION nvarchar(50) NOT NULL
        )
	PRINT('Tabla HARAKIRI.PRODUCTO creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].PRODUCTO_VARIANTE') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.PRODUCTO_VARIANTE (
	PRODUCTO_VARIANTE_CODIGO nvarchar(50) NOT NULL,
        PRODUCTO_CODIGO nvarchar(50) NOT NULL,
        VARIANTE_CODIGO decimal (18,0) NOT NULL,
        PRECIO_ACTUAL_COMPRA decimal(18,2) NOT NULL,
        PRECIO_ACTUAL_VENTA decimal(18,2)  
        )
	PRINT('Tabla HARAKIRI.PRODUCTO_VARIANTE creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].VARIANTE') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.VARIANTE (
	VARIANTE_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1) ,
        VARIANTE_TIPO_VARIANTE_CODIGO decimal(18,0) NOT NULL,
        VARIANTE_NOMBRE nvarchar (50) NOT NULL,
     
        )
	PRINT('Tabla HARAKIRI.VARIANTE creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].TIPO_VARIANTE') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.TIPO_VARIANTE (
	TIPO_VARIANTE_CODIGO decimal(18,0) NOT NULL IDENTITY(1,1) ,
        TIPO_VARIANTE_VALOR nvarchar (50) NOT NULL,
     
        )
	PRINT('Tabla HARAKIRI.TIPO_VARIANTE creada')
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id= OBJECT_ID(N'[HARAKIRI].VENTA_POR_PRODUCTO') AND type = 'U')
BEGIN
	CREATE TABLE HARAKIRI.VENTA_POR_PRODUCTO (
                
        PRODUCTO_VARIANTE_CODIGO nvarchar(50) NOT NULL,
        VENTA_CODIGO decimal(19,0) NOT NULL,
        PRODUCTO_CANTIDAD decimal(18,0) NOT NULL,
        PRODUCTO_PRECIO_TOTAL decimal(18,2) NOT NULL
        )
	PRINT('Tabla HARAKIRI.VENTA_POR_PRODUCTO creada')
END
GO