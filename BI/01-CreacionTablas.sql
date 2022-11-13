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
GO
