-- Acá van los create de los procedures y los EXEC de ellos
USE GD2C2022
GO
---------------------------------------------------------------------------------------



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_VARIANTE
AS
BEGIN
INSERT INTO HARAKIRI.VARIANTE (VARIANTE_TIPO_VARIANTE_CODIGO,VARIANTE_NOMBRE )
SELECT DISTINCT T.TIPO_VARIANTE_CODIGO,PRODUCTO_VARIANTE
FROM  gd_esquema.Maestra M JOIN HARAKIRI.TIPO_VARIANTE T ON M.PRODUCTO_TIPO_VARIANTE = T.TIPO_VARIANTE_VALOR WHERE PRODUCTO_VARIANTE IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.VARIANTE)
PRINT('Datos migrados a la tabla HARAKIRI.VARIANTE. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_TIPO_VARIANTE
AS
BEGIN
INSERT INTO HARAKIRI.TIPO_VARIANTE (TIPO_VARIANTE_VALOR)
SELECT DISTINCT PRODUCTO_TIPO_VARIANTE AS TIPO_VARIANTE_VALOR
FROM gd_esquema.Maestra WHERE PRODUCTO_TIPO_VARIANTE IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.TIPO_VARIANTE)
PRINT('Datos migrados a la tabla HARAKIRI.TIPO_VARIANTE. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MARCA
AS
BEGIN
INSERT INTO HARAKIRI.MARCA (MARCA_NOMBRE)
SELECT DISTINCT PRODUCTO_MARCA AS MARCA_NOMBRE
FROM gd_esquema.Maestra WHERE PRODUCTO_MARCA IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MARCA)
PRINT('Datos migrados a la tabla HARAKIRI.MARCA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_CLIENTE
AS
BEGIN 
  INSERT INTO HARAKIRI.CLIENTE (CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_DNI, CLIENTE_DIRECCION, CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NAC, CLIENTE_LOCALIDAD_CODIGO)
  SELECT DISTINCT CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_DNI, CLIENTE_DIRECCION, CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NAC, L.LOCALIDAD_CODIGO
  FROM GD_ESQUEMA.MAESTRA MA JOIN HARAKIRI.LOCALIDAD L ON MA.CLIENTE_LOCALIDAD = L.LOCALIDAD_NOMBRE AND MA.CLIENTE_CODIGO_POSTAL = L.LOCALIDAD_CODIGO_POSTAL
  WHERE CLIENTE_NOMBRE IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.CLIENTE)
PRINT('Datos migrados a la tabla HARAKIRI.CLIENTE. Nuevas filas: ' + @CANTIDAD_REGISTROS)

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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_CATEGORIA
AS
BEGIN
INSERT INTO HARAKIRI.CATEGORIA (CATEGORIA_NOMBRE)
SELECT DISTINCT PRODUCTO_CATEGORIA AS CATEGORIA_NOMBRE
FROM gd_esquema.Maestra WHERE PRODUCTO_CATEGORIA IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.CATEGORIA)
PRINT('Datos migrados a la tabla HARAKIRI.MARCA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MATERIAL
AS
BEGIN
INSERT INTO HARAKIRI.MATERIAL (MATERIAL_NOMBRE)
SELECT DISTINCT PRODUCTO_MATERIAL AS MATERIAL_NOMBRE
FROM gd_esquema.Maestra WHERE PRODUCTO_MATERIAL IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MATERIAL)
PRINT('Datos migrados a la tabla HARAKIRI.MATERIAL. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.PRODUCTO
SELECT DISTINCT MA.PRODUCTO_CODIGO AS PRODUCTO_CODIGO,
 M.MARCA_CODIGO AS PRODUCTO_MARCA_CODIGO,MT.MATERIAL_CODIGO AS  PRODUCTO_MATERIAL_CODIGO ,
  CA.CATEGORIA_CODIGO AS  PRODUCTO_CATEGORIA_CODIGO ,
 MA.PRODUCTO_NOMBRE AS PRODUCTO_NOMBRE, MA.PRODUCTO_DESCRIPCION AS  PRODUCTO_DESCRIPCION
FROM gd_esquema.Maestra MA JOIN HARAKIRI.MARCA M ON MA.PRODUCTO_MARCA = M.MARCA_NOMBRE 
JOIN HARAKIRI.MATERIAL MT ON MA.PRODUCTO_MATERIAL = MT.MATERIAL_NOMBRE 
JOIN HARAKIRI.CATEGORIA CA ON MA.PRODUCTO_CATEGORIA = CA.CATEGORIA_NOMBRE 
WHERE PRODUCTO_CODIGO IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_PRODUCTO_VARIANTE
AS
BEGIN
INSERT INTO HARAKIRI.PRODUCTO_VARIANTE
SELECT DISTINCT MA.PRODUCTO_VARIANTE_CODIGO AS PRODUCTO_VARIANTE_CODIGO,
 P.PRODUCTO_CODIGO AS PRODUCTO_CODIGO,V.VARIANTE_CODIGO AS  VARIANTE_CODIGO ,
 max(COMPRA_PRODUCTO_PRECIO) AS PRECIO_ACTUAL_COMPRA
,max(VENTA_PRODUCTO_PRECIO) AS PRECIO_ACTUAL_VENTA
FROM gd_esquema.Maestra MA JOIN HARAKIRI.PRODUCTO P ON MA.PRODUCTO_CODIGO = P.PRODUCTO_CODIGO 
JOIN HARAKIRI.VARIANTE V ON V.VARIANTE_NOMBRE = MA.PRODUCTO_VARIANTE 
WHERE PRODUCTO_VARIANTE_CODIGO IS NOT NULL
group by PRODUCTO_VARIANTE_CODIGO ,P.PRODUCTO_CODIGO,V.VARIANTE_CODIGO
order by PRODUCTO_VARIANTE_CODIGO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PRODUCTO_VARIANTE)
PRINT('Datos migrados a la tabla HARAKIRI.PRODUCTO_VARIANTE. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_VENTA_POR_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.VENTA_POR_PRODUCTO (PRODUCTO_VARIANTE_CODIGO, VENTA_CODIGO, PRODUCTO_CANTIDAD, PRODUCTO_PRECIO_TOTAL)
SELECT  P.PRODUCTO_VARIANTE_CODIGO AS PRODUCTO_VARIANTE_CODIGO,
 V.VENTA_CODIGO AS VENTA_CODIGO, 
 MA.VENTA_PRODUCTO_CANTIDAD AS PRODUCTO_CANTIDAD
,MA.VENTA_PRODUCTO_CANTIDAD*MA.VENTA_PRODUCTO_PRECIO AS PRODUCTO_PRECIO_TOTAL
FROM gd_esquema.Maestra MA JOIN HARAKIRI.VENTA V ON MA.VENTA_CODIGO = V.VENTA_CODIGO 
JOIN HARAKIRI.PRODUCTO_VARIANTE P ON P.PRODUCTO_VARIANTE_CODIGO = MA.PRODUCTO_VARIANTE_CODIGO 
order by VENTA_CODIGO,PRODUCTO_VARIANTE_CODIGO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.VENTA_POR_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.VENTA_POR_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
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



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MEDIO_DE_PAGO_VENTA
AS
BEGIN 
  INSERT INTO HARAKIRI.MEDIO_DE_PAGO_VENTA (MEDIO_DE_PAGO_NOMBRE, MEDIO_DE_PAGO_COSTO)
  SELECT DISTINCT VENTA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO
  FROM GD_ESQUEMA.MAESTRA
  WHERE VENTA_MEDIO_PAGO IS NOT NULL AND VENTA_MEDIO_PAGO_COSTO IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MEDIO_DE_PAGO_VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.MEDIO_DE_PAGO_VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_VENTA
AS
BEGIN 
  INSERT INTO HARAKIRI.VENTA (VENTA_CODIGO, VENTA_CANAL_CODIGO, VENTA_MEDIO_DE_PAGO_CODIGO, VENTA_CLIENTE_CODIGO, VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO, VENTA_FECHA, VENTA_TOTAL)
  SELECT DISTINCT
    M.VENTA_CODIGO,
    C.CANAL_CODIGO VENTA_CANAL_CODIGO,
    MPV.MEDIO_DE_PAGO_CODIGO VENTA_MEDIO_DE_PAGO_CODIGO,
    CL.CLIENTE_CODIGO VENTA_CLIENTE_CODIGO,
    MEPC.MEDIO_ENVIO_POR_LOCALIDAD_CODIGO VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO,
    M.VENTA_FECHA,
    M.VENTA_TOTAL
  FROM gd_esquema.Maestra M
  JOIN HARAKIRI.CANAL C on C.CANAL_NOMBRE = M.VENTA_CANAL 
  JOIN HARAKIRI.MEDIO_DE_PAGO_VENTA MPV on MPV.MEDIO_DE_PAGO_NOMBRE = M.VENTA_MEDIO_PAGO
  JOIN HARAKIRI.CLIENTE CL on CL.CLIENTE_DNI = M.CLIENTE_DNI AND CL.CLIENTE_APELLIDO = M.CLIENTE_APELLIDO
  JOIN HARAKIRI.LOCALIDAD L on L.LOCALIDAD_NOMBRE = M.CLIENTE_LOCALIDAD AND L.LOCALIDAD_CODIGO_POSTAL = M.CLIENTE_CODIGO_POSTAL
  JOIN HARAKIRI.MEDIO_ENVIO ME on ME.MEDIO_ENVIO_NOMBRE = M.VENTA_MEDIO_ENVIO
  JOIN HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD MEPC on MEPC.LOCALIDAD_CODIGO = L.LOCALIDAD_CODIGO AND MEPC.MEDIO_ENVIO_CODIGO = ME.MEDIO_ENVIO_CODIGO
  WHERE M.VENTA_CODIGO IS NOT NULL
DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MEDIO_ENVIO
AS
BEGIN 
  INSERT INTO HARAKIRI.MEDIO_ENVIO (MEDIO_ENVIO_NOMBRE)
  SELECT DISTINCT 
	M.VENTA_MEDIO_ENVIO MEDIO_ENVIO_NOMBRE
  FROM gd_esquema.Maestra M
  WHERE M.VENTA_MEDIO_ENVIO IS NOT NULL 

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MEDIO_ENVIO)
PRINT('Datos migrados a la tabla HARAKIRI.MEDIO_ENVIO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MEDIO_DE_PAGO_COMPRA
AS
BEGIN 
  INSERT INTO HARAKIRI.MEDIO_DE_PAGO_COMPRA (MEDIO_DE_PAGO_COMPRA_NOMBRE)
  SELECT DISTINCT 
	M.COMPRA_MEDIO_PAGO MEDIO_DE_PAGO_COMPRA_NOMBRE
  FROM gd_esquema.Maestra M
  WHERE M.COMPRA_MEDIO_PAGO IS NOT NULL 

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MEDIO_DE_PAGO_COMPRA)
PRINT('Datos migrados a la tabla HARAKIRI.MEDIO_DE_PAGO_COMPRA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_DESCUENTO_COMPRA
AS
BEGIN 
  INSERT INTO HARAKIRI.DESCUENTO_COMPRA (DESCUENTO_COMPRA_CODIGO, COMPRA_NUMERO, DESCUENTO_COMPRA_VALOR)
  SELECT DISTINCT 
    M.DESCUENTO_COMPRA_CODIGO,
    M.COMPRA_NUMERO,
	  M.DESCUENTO_COMPRA_VALOR 
  FROM gd_esquema.Maestra M
  WHERE DESCUENTO_COMPRA_CODIGO IS NOT NULL AND COMPRA_NUMERO IS NOT NULL AND DESCUENTO_COMPRA_VALOR IS NOT NULL

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.DESCUENTO_COMPRA)
PRINT('Datos migrados a la tabla HARAKIRI.DESCUENTO_COMPRA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_COMPRA_POR_PRODUCTO
AS
BEGIN
  INSERT INTO HARAKIRI.COMPRA_POR_PRODUCTO (COMPRA_NUMERO, PRODUCTO_VARIANTE_CODIGO, PRODUCTO_CANTIDAD,PRODUCTO_PRECIO_TOTAL)
  SELECT  C.COMPRA_NUMERO AS COMPRA_NUMERO,
    PV.PRODUCTO_VARIANTE_CODIGO AS PRODUCTO_VARIANTE_CODIGO,
    MA.COMPRA_PRODUCTO_CANTIDAD AS PRODUCTO_CANTIDAD
    ,MA.COMPRA_PRODUCTO_CANTIDAD*MA.COMPRA_PRODUCTO_PRECIO AS PRODUCTO_PRECIO_TOTAL
  FROM gd_esquema.Maestra MA JOIN HARAKIRI.COMPRA C ON MA.COMPRA_NUMERO = C.COMPRA_NUMERO 
  JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = MA.PRODUCTO_VARIANTE_CODIGO 
  order by COMPRA_NUMERO,PRODUCTO_VARIANTE_CODIGO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.COMPRA_POR_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.COMPRA_POR_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO



CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_MEDIO_ENVIO_POR_LOCALIDAD
AS
BEGIN
  INSERT INTO HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD (LOCALIDAD_CODIGO, MEDIO_ENVIO_CODIGO, VENTA_ENVIO_PRECIO)
  SELECT DISTINCT 
    L.LOCALIDAD_CODIGO,
    ME.MEDIO_ENVIO_CODIGO,
    M.VENTA_ENVIO_PRECIO
  FROM gd_esquema.Maestra M
  JOIN HARAKIRI.LOCALIDAD L ON L.LOCALIDAD_NOMBRE = M.CLIENTE_LOCALIDAD AND L.LOCALIDAD_CODIGO_POSTAL = M.CLIENTE_CODIGO_POSTAL
  JOIN HARAKIRI.MEDIO_ENVIO ME ON ME.MEDIO_ENVIO_NOMBRE = M.VENTA_MEDIO_ENVIO
  WHERE M.VENTA_MEDIO_ENVIO IS NOT NULL 

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD)
PRINT('Datos migrados a la tabla HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD. Nuevas filas: ' + @CANTIDAD_REGISTROS)
END
GO


EXEC HARAKIRI.MIGRAR_TABLA_CUPON_TIPO
EXEC HARAKIRI.MIGRAR_TABLA_CUPON
EXEC HARAKIRI.MIGRAR_TABLA_CANAL
EXEC HARAKIRI.MIGRAR_TABLA_PROVINCIA
EXEC HARAKIRI.MIGRAR_TABLA_LOCALIDAD
EXEC HARAKIRI.MIGRAR_TABLA_PROVEEDOR
EXEC HARAKIRI.MIGRAR_TABLA_CLIENTE
EXEC HARAKIRI.MIGRAR_TABLA_MATERIAL
EXEC HARAKIRI.MIGRAR_TABLA_MEDIO_DE_PAGO_COMPRA
EXEC HARAKIRI.MIGRAR_TABLA_COMPRA
EXEC HARAKIRI.MIGRAR_TABLA_MEDIO_ENVIO
EXEC HARAKIRI.MIGRAR_TABLA_MEDIO_DE_PAGO_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_MEDIO_ENVIO_POR_LOCALIDAD
EXEC HARAKIRI.MIGRAR_TABLA_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_VENTA_POR_CUPON
EXEC HARAKIRI.MIGRAR_TABLA_DESCUENTO_COMPRA
EXEC HARAKIRI.MIGRAR_TABLA_MARCA
EXEC HARAKIRI.MIGRAR_TABLA_CATEGORIA
EXEC HARAKIRI.MIGRAR_TABLA_TIPO_VARIANTE
EXEC HARAKIRI.MIGRAR_TABLA_VARIANTE
EXEC HARAKIRI.MIGRAR_TABLA_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_PRODUCTO_VARIANTE
EXEC HARAKIRI.MIGRAR_TABLA_COMPRA_POR_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_DESCUENTO_CONCEPTO
EXEC HARAKIRI.MIGRAR_TABLA_VENTA_POR_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_DESCUENTO_POR_VENTA
