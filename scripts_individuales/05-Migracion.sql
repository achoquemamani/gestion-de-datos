--CREACION DE PROCEDURES

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_PROVINCIA
AS
BEGIN 
  INSERT INTO HARAKIRI.PROVINCIA (PROVINCIA_NOMBRE)
  SELECT DISTINCT CLIENTE_PROVINCIA
  FROM GD_ESQUEMA.MAESTRA
  WHERE CLIENTE_PROVINCIA IS NOT NULL
  UNION
  SELECT DISTINCT PROVEEDOR_PROVINCIA
  FROM GD_ESQUEMA.MAESTRA
  WHERE PROVEEDOR_PROVINCIA IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PROVINCIA)
PRINT('Datos migrados a la tabla HARAKIRI.PROVINCIA. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_LOCALIDAD
AS
BEGIN 
INSERT INTO HARAKIRI.LOCALIDAD (LOCALIDAD_PROVINCIA_CODIGO, LOCALIDAD_NOMBRE, LOCALIDAD_CODIGO_POSTAL)

  SELECT DISTINCT P.PROVINCIA_CODIGO, MA.CLIENTE_LOCALIDAD, MA.CLIENTE_CODIGO_POSTAL
  FROM gd_esquema.Maestra MA JOIN HARAKIRI.PROVINCIA P ON MA.CLIENTE_PROVINCIA = P.PROVINCIA_NOMBRE
  UNION
  SELECT DISTINCT P.PROVINCIA_CODIGO, MA.PROVEEDOR_LOCALIDAD, MA.PROVEEDOR_CODIGO_POSTAL
  FROM gd_esquema.Maestra MA JOIN HARAKIRI.PROVINCIA P ON MA.PROVEEDOR_PROVINCIA = P.PROVINCIA_NOMBRE

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.LOCALIDAD)
PRINT('Datos migrados a la tabla HARAKIRI.LOCALIDAD. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MATERIAL
AS
BEGIN 
  INSERT INTO HARAKIRI.MATERIAL (MATERIAL_NOMBRE)
  SELECT DISTINCT PRODUCTO_MATERIAL
  FROM GD_ESQUEMA.MAESTRA
  WHERE PRODUCTO_MATERIAL IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MATERIAL)
PRINT('Datos migrados a la tabla HARAKIRI.MATERIAL. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_CLIENTE
AS
BEGIN 
  INSERT INTO HARAKIRI.CLIENTE (CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_DNI, CLIENTE_DIRECCION, CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NAC, CLIENTE_LOCALIDAD_CODIGO)
  SELECT DISTINCT CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_DNI, CLIENTE_DIRECCION, CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NAC, L.LOCALIDAD_CODIGO
  FROM GD_ESQUEMA.MAESTRA MA JOIN HARAKIRI.LOCALIDAD L ON MA.CLIENTE_LOCALIDAD = L.LOCALIDAD_NOMBRE AND MA.CLIENTE_CODIGO_POSTAL = L.LOCALIDAD_CODIGO_POSTAL
  WHERE CLIENTE_NOMBRE IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MATERIAL)
PRINT('Datos migrados a la tabla HARAKIRI.MATERIAL. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_PROVEEDOR
AS
BEGIN 
  INSERT INTO HARAKIRI.PROVEEDOR (PROVEEDOR_CUIT, PROVEEDOR_LOCALIDAD_CODIGO, PROVEEDOR_RAZON_SOCIAL, PROVEEDOR_DOMICILIO, PROVEEDOR_MAIL)
  SELECT DISTINCT PROVEEDOR_CUIT, L.LOCALIDAD_CODIGO, PROVEEDOR_RAZON_SOCIAL, PROVEEDOR_DOMICILIO, PROVEEDOR_MAIL
  FROM GD_ESQUEMA.MAESTRA MA JOIN HARAKIRI.LOCALIDAD L ON MA.PROVEEDOR_LOCALIDAD = L.LOCALIDAD_NOMBRE AND MA.PROVEEDOR_CODIGO_POSTAL = L.LOCALIDAD_CODIGO_POSTAL
  WHERE PROVEEDOR_CUIT IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PROVEEDOR)
PRINT('Datos migrados a la tabla HARAKIRI.PROVEEDOR. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_COMPRA
AS
BEGIN 
  INSERT INTO HARAKIRI.COMPRA (COMPRA_NUMERO, COMPRA_MEDIO_DE_PAGO_CODIGO, PROVEEDOR_CUIT, COMPRA_FECHA, COMPRA_TOTAL)
  SELECT DISTINCT COMPRA_NUMERO, MPC.MEDIO_DE_PAGO_COMPRA_CODIGO, PROVEEDOR_CUIT, COMPRA_FECHA, COMPRA_TOTAL
  FROM GD_ESQUEMA.MAESTRA MA JOIN HARAKIRI.MEDIO_DE_PAGO_COMPRA MPC ON MA.COMPRA_MEDIO_PAGO = MPC.MEDIO_DE_PAGO_COMPRA_NOMBRE
  WHERE COMPRA_NUMERO IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.COMPRA)
PRINT('Datos migrados a la tabla HARAKIRI.COMPRA. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO


GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_CUPON_TIPO
AS
BEGIN
INSERT INTO HARAKIRI.CUPON_TIPO (CUPON_TIPO_NOMBRE)
SELECT DISTINCT M.VENTA_CUPON_TIPO
FROM gd_esquema.Maestra M WHERE M.VENTA_CUPON_TIPO IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.CUPON_TIPO)
PRINT('Datos migrados a la tabla HARAKIRI.CUPON_TIPO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_CUPON
AS
BEGIN
INSERT INTO HARAKIRI.CUPON (CUPON_CODIGO, CUPON_TIPO_CODIGO, CUPON_FECHA_DESDE, CUPON_FECHA_HASTA, CUPON_VALOR)
SELECT DISTINCT 
    M.VENTA_CUPON_CODIGO CUPON_CODIGO,
	CT.CUPON_TIPO_CODIGO CUPON_TIPO_CODIGO,
	M.VENTA_CUPON_FECHA_DESDE CUPON_FECHA_DESDE,
	M.VENTA_CUPON_FECHA_HASTA CUPON_FECHA_HASTA,
	M.VENTA_CUPON_VALOR CUPON_VALOR
FROM gd_esquema.Maestra M
JOIN HARAKIRI.CUPON_TIPO CT on CT.CUPON_TIPO_NOMBRE = M.VENTA_CUPON_TIPO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.CUPON)
PRINT('Datos migrados a la tabla HARAKIRI.CUPON. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_VENTA_POR_CUPON
AS
BEGIN
INSERT INTO HARAKIRI.VENTA_POR_CUPON (CUPON_CODIGO, VENTA_CODIGO, CUPON_IMPORTE)
SELECT DISTINCT 
	M.VENTA_CUPON_CODIGO,
	M.VENTA_CODIGO,
	M.VENTA_CUPON_IMPORTE
FROM gd_esquema.Maestra M
WHERE M.VENTA_CUPON_CODIGO IS NOT NULL AND M.VENTA_CODIGO IS NOT NULL AND M.VENTA_CUPON_IMPORTE IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.VENTA_POR_CUPON)
PRINT('Datos migrados a la tabla HARAKIRI.VENTA_POR_CUPON. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_CANAL
AS
BEGIN
INSERT INTO HARAKIRI.CANAL (CANAL_NOMBRE, CANAL_COSTO)
SELECT DISTINCT 
	M.VENTA_CANAL,
	M.VENTA_CANAL_COSTO
FROM gd_esquema.Maestra M
WHERE M.VENTA_CANAL IS NOT NULL AND M.VENTA_CANAL_COSTO IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.CANAL)
PRINT('Datos migrados a la tabla HARAKIRI.CANAL. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_DESCUENTO_POR_VENTA
AS
BEGIN
INSERT INTO HARAKIRI.DESCUENTO_POR_VENTA (DESCUENTO_CONCEPTO_CODIGO, VENTA_CODIGO, DESCUENTO_IMPORTE)
SELECT DISTINCT 
	DC.DESCUENTO_CONCEPTO_CODIGO,
	M.VENTA_CODIGO,
	M.VENTA_DESCUENTO_IMPORTE
FROM gd_esquema.Maestra M
JOIN HARAKIRI.DESCUENTO_CONCEPTO DC on DC.DESCUENTO_CONCEPTO_NOMBRE= M.VENTA_DESCUENTO_CONCEPTO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.DESCUENTO_POR_VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.DESCUENTO_POR_VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_DESCUENTO_CONCEPTO
AS
BEGIN
INSERT INTO HARAKIRI.DESCUENTO_CONCEPTO (DESCUENTO_CONCEPTO_NOMBRE)
SELECT DISTINCT 
	M.VENTA_DESCUENTO_CONCEPTO
FROM gd_esquema.Maestra M
WHERE M.VENTA_DESCUENTO_CONCEPTO IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.DESCUENTO_CONCEPTO)
PRINT('Datos migrados a la tabla HARAKIRI.DESCUENTO_CONCEPTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

EXEC HARAKIRI.MIGRAR_TABLA_CUPON_TIPO
EXEC HARAKIRI.MIGRAR_TABLA_CUPON
EXEC HARAKIRI.MIGRAR_TABLA_VENTA_POR_CUPON
EXEC HARAKIRI.MIGRAR_TABLA_CANAL
EXEC HARAKIRI.MIGRAR_TABLA_DESCUENTO_POR_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_DESCUENTO_CONCEPTO

EXEC HARAKIRI.MIGRAR_TABLA_PROVINCIA
EXEC HARAKIRI.MIGRAR_TABLA_LOCALIDAD
EXEC HARAKIRI.MIGRAR_TABLA_COMPRA
EXEC HARAKIRI.MIGRAR_TABLA_PROVEEDOR
EXEC HARAKIRI.MIGRAR_TABLA_CLIENTE
EXEC HARAKIRI.MIGRAR_TABLA_MATERIAL