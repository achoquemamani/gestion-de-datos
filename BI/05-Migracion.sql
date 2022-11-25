----------------------------------------------------------------------------------------------------------
/* MIGRACION DE TABLAS */

/* MIGRACION DE TABLA BI_TIEMPO */
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_TIEMPO
AS
BEGIN
	INSERT INTO HARAKIRI.BI_TIEMPO(TIEMPO_ANIO, TIEMPO_MES)
	(
		SELECT YEAR(V.VENTA_FECHA) AS TIEMPO_ANIO, MONTH(V.VENTA_FECHA) AS TIEMPO_MES
		FROM HARAKIRI.VENTA V
		GROUP BY YEAR(V.VENTA_FECHA), MONTH(V.VENTA_FECHA)

		UNION
 	    SELECT YEAR(C.COMPRA_FECHA) AS TIEMPO_ANIO, MONTH(C.COMPRA_FECHA) AS TIEMPO_MES
		FROM HARAKIRI.COMPRA C
		GROUP BY YEAR(C.COMPRA_FECHA), MONTH(C.COMPRA_FECHA)

	)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_TIEMPO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_TIEMPO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

/*MIGRACION TABLA RANGO_EDAD*/
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
AS
BEGIN
	INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('<25')
  INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('25 - 35')
  INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('35 - 55')
  INSERT INTO HARAKIRI.BI_RANGO_EDAD(EDAD_CATEGORIA)
    VALUES('>55')

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_RANGO_EDAD)
PRINT('Datos migrados a la tabla HARAKIRI.BI_RANGO_EDAD. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_VENTA_PRODUCTO (VENTA_PRODUCTO_CODIGO, EDAD_CODIGO, TIEMPO_CODIGO, PROVINCIA_CODIGO, CANAL_CODIGO, MEDIO_DE_PAGO_CODIGO, CATEGORIA_CODIGO, PRODUCTO_CODIGO, MEDIO_ENVIO_CODIGO, VENTA_ENVIO_PRECIO, PRODUCTO_PRECIO_TOTAL, VENTA_CODIGO)
SELECT DISTINCT VPP.VENTA_POR_PRODUCTO_CODIGO, RE.EDAD_CODIGO, T.TIEMPO_CODIGO, P.PROVINCIA_CODIGO, CA.CANAL_CODIGO, MDPV.MEDIO_DE_PAGO_CODIGO, CAT.CATEGORIA_CODIGO, PROD.PRODUCTO_CODIGO, ME.MEDIO_ENVIO_CODIGO, MDEPL.VENTA_ENVIO_PRECIO, VPP.PRODUCTO_PRECIO_TOTAL, V.VENTA_CODIGO
FROM HARAKIRI.VENTA_POR_PRODUCTO VPP
JOIN HARAKIRI.VENTA V ON VPP.VENTA_CODIGO = V.VENTA_CODIGO
JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = VPP.PRODUCTO_VARIANTE_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN O ES VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE_CODIGO Y CORREGIR EN EL DER EN ESE CASO
JOIN HARAKIRI.PRODUCTO PROD ON PROD.PRODUCTO_CODIGO = PV.PRODUCTO_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN O ES PRODUCTO_VARIANTE_PRODUCTO_CODIGO Y CORREGIR EN EL DER EN ESE CASO
JOIN HARAKIRI.CLIENTE CLI ON V.VENTA_CLIENTE_CODIGO = CLI.CLIENTE_CODIGO
--JOIN HARAKIRI.LOCALIDAD L ON CLI.CLIENTE_LOCALIDAD_CODIGO = L.LOCALIDAD_CODIGO -- SAQUE ESTE JOIN PARA AHORRARLO Y APROVECHAR EL MEDIO ENVIO POR LOCALIDAD
JOIN HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD MDEPL ON MDEPL.MEDIO_ENVIO_POR_LOCALIDAD_CODIGO = V.VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO
JOIN HARAKIRI.LOCALIDAD L ON L.LOCALIDAD_CODIGO = MDEPL.LOCALIDAD_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN
JOIN HARAKIRI.PROVINCIA P ON L.LOCALIDAD_PROVINCIA_CODIGO = P.PROVINCIA_CODIGO
JOIN HARAKIRI.CANAL CA ON V.VENTA_CANAL_CODIGO = CA.CANAL_CODIGO
JOIN HARAKIRI.MEDIO_DE_PAGO_VENTA MDPV ON MDPV.MEDIO_DE_PAGO_CODIGO = V.VENTA_MEDIO_DE_PAGO_CODIGO
JOIN HARAKIRI.CATEGORIA CAT ON CAT.CATEGORIA_CODIGO = PROD.PRODUCTO_CATEGORIA_CODIGO
JOIN HARAKIRI.MEDIO_ENVIO ME ON ME.MEDIO_ENVIO_CODIGO = MDEPL.MEDIO_ENVIO_CODIGO
JOIN HARAKIRI.BI_RANGO_EDAD RE ON RE.EDAD_CATEGORIA = HARAKIRI.rangoEtario_fx(CLI.CLIENTE_FECHA_NAC) -- VER EL NOMBRE QUE SE VA A USAR Y VER QUE RETORNE UN NVARCHAR
JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(V.VENTA_FECHA) AND T.TIEMPO_MES = month(V.VENTA_FECHA)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_HECHO_VENTA_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA
AS
BEGIN
INSERT INTO HARAKIRI.BI_PROVINCIA (PROVINCIA_CODIGO, PROVINCIA_NOMBRE)
SELECT DISTINCT PROVINCIA_CODIGO, PROVINCIA_NOMBRE FROM HARAKIRI.PROVINCIA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_PROVINCIA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_PROVINCIA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO
AS
BEGIN
INSERT INTO HARAKIRI.BI_MEDIO_DE_PAGO (MEDIO_DE_PAGO_CODIGO, MEDIO_DE_PAGO_NOMBRE, MEDIO_DE_PAGO_COSTO)
SELECT DISTINCT MEDIO_DE_PAGO_CODIGO, MEDIO_DE_PAGO_NOMBRE, MEDIO_DE_PAGO_COSTO FROM HARAKIRI.MEDIO_DE_PAGO_VENTA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_MEDIO_DE_PAGO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_MEDIO_DE_PAGO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO
CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA
AS
BEGIN
INSERT INTO HARAKIRI.BI_CATEGORIA (CATEGORIA_CODIGO, CATEGORIA_NOMBRE)
  SELECT
    C.CATEGORIA_CODIGO,
    C.CATEGORIA_NOMBRE
  FROM HARAKIRI.CATEGORIA C

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_CATEGORIA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_CATEGORIA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_PRODUCTO (PRODUCTO_CODIGO, PRODUCTO_NOMBRE)
  SELECT
    P.PRODUCTO_CODIGO,
    P.PRODUCTO_NOMBRE
  FROM HARAKIRI.PRODUCTO P


DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA
AS
BEGIN
INSERT INTO HARAKIRI.BI_CANAL_VENTA (CANAL_CODIGO, CANAL_COSTO, CANAL_NOMBRE)
  SELECT
    C.CANAL_CODIGO,
    C.CANAL_COSTO,
	C.CANAL_NOMBRE
  FROM HARAKIRI.CANAL C

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_CANAL_VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_CANAL_VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_COMPRA
AS
BEGIN
INSERT INTO HARAKIRI.BI_COMPRA (COMPRA_CODIGO, COMPRA_TOTAL)
SELECT DISTINCT COMPRA_NUMERO, COMPRA_TOTAL FROM HARAKIRI.COMPRA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_COMPRA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_COMPRA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_COMPRA_PRODUCTO (COMPRA_PRODUCTO_CODIGO, PROVEEDOR_CUIT, TIEMPO_CODIGO, PRODUCTO_CODIGO, PRODUCTO_CANTIDAD,PRODUCTO_PRECIO_UNITARIO, COMPRA_CODIGO )
SELECT DISTINCT CPP.COMPRA_POR_PRODUCTO_CODIGO, PRO.PROVEEDOR_CUIT, T.TIEMPO_CODIGO, P.PRODUCTO_CODIGO,CPP.PRODUCTO_CANTIDAD, CPP.PRODUCTO_PRECIO_TOTAL/CPP.PRODUCTO_CANTIDAD, COMPRA_NUMERO
FROM HARAKIRI.COMPRA_POR_PRODUCTO CPP
JOIN HARAKIRI.COMPRA C ON CPP.COMPRA_NUMERO = C.COMPRA_NUMERO
JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = CPP.PRODUCTO_VARIANTE_CODIGO 
JOIN HARAKIRI.PRODUCTO P ON P.PRODUCTO_CODIGO = PV.PRODUCTO_CODIGO 
JOIN HARAKIRI.PROVEEDOR PRO ON C.PROVEEDOR_CUIT = PRO.PROVEEDOR_CUIT
JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(C.COMPRA_FECHA) AND T.TIEMPO_MES = month(C.COMPRA_FECHA)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_HECHO_COMPRA_PRODUCTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_HECHO_COMPRA_PRODUCTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO
AS
BEGIN
INSERT INTO HARAKIRI.BI_MEDIO_DE_ENVIO (MEDIO_ENVIO_CODIGO, MEDIO_ENVIO_NOMBRE)
SELECT DISTINCT MEDIO_ENVIO_CODIGO, MEDIO_ENVIO_NOMBRE FROM HARAKIRI.MEDIO_ENVIO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_MEDIO_DE_ENVIO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_MEDIO_DE_ENVIO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_VENTA
AS
BEGIN
INSERT INTO HARAKIRI.BI_VENTA (VENTA_CODIGO, VENTA_TOTAL)
SELECT DISTINCT VENTA_CODIGO, VENTA_TOTAL FROM HARAKIRI.VENTA

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_VENTA)
PRINT('Datos migrados a la tabla HARAKIRI.BI_VENTA. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR
AS
BEGIN
INSERT INTO HARAKIRI.BI_PROVEEDOR (PROVEEDOR_CUIT, PROVEEDOR_RAZON_SOCIAL)
SELECT DISTINCT PROVEEDOR_CUIT, PROVEEDOR_RAZON_SOCIAL FROM HARAKIRI.PROVEEDOR

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_PROVEEDOR)
PRINT('Datos migrados a la tabla HARAKIRI.BI_PROVEEDOR. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO


CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_TIPO_DE_DESCUENTO (TIPO_DESCUENTO_CODIGO, TIPO_DESCUENTO_NOMBRE)
SELECT DISTINCT DESCUENTO_CONCEPTO_CODIGO, DESCUENTO_CONCEPTO_NOMBRE FROM HARAKIRI.DESCUENTO_CONCEPTO
UNION SELECT 4, 'Cupon'
DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_TIPO_DE_DESCUENTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_TIPO_DE_DESCUENTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_DESCUENTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_VENTA_DESCUENTO (TIPO_DESCUENTO_CODIGO, DESCUENTO_IMPORTE, TIEMPO_CODIGO, CANAL_CODIGO)
  SELECT
    BTD.TIPO_DESCUENTO_CODIGO,
    DPV.DESCUENTO_IMPORTE,
    BT.TIEMPO_CODIGO,
    BCV.CANAL_CODIGO
  FROM HARAKIRI.VENTA V
  INNER JOIN HARAKIRI.DESCUENTO_POR_VENTA DPV on DPV.VENTA_CODIGO = V.VENTA_CODIGO
  INNER JOIN HARAKIRI.DESCUENTO_CONCEPTO DC on DC.DESCUENTO_CONCEPTO_CODIGO = DPV.DESCUENTO_CONCEPTO_CODIGO
  INNER JOIN HARAKIRI.CANAL C on C.CANAL_CODIGO = V.VENTA_CANAL_CODIGO
  INNER JOIN HARAKIRI.BI_TIPO_DE_DESCUENTO BTD on BTD.TIPO_DESCUENTO_CODIGO = DC.DESCUENTO_CONCEPTO_CODIGO
  INNER JOIN HARAKIRI.BI_TIEMPO BT ON BT.TIEMPO_ANIO = year(V.VENTA_FECHA) AND BT.TIEMPO_MES = month(V.VENTA_FECHA)
  INNER JOIN HARAKIRI.BI_CANAL_VENTA BCV on BCV.CANAL_CODIGO = C.CANAL_CODIGO
  UNION
  ( SELECT
    4,
    VPC.CUPON_IMPORTE DESCUENTO_IMPORTE,
    BT.TIEMPO_CODIGO,
    BCV.CANAL_CODIGO
  FROM HARAKIRI.VENTA V
  INNER JOIN HARAKIRI.VENTA_POR_CUPON VPC on VPC.VENTA_CODIGO = V.VENTA_CODIGO
  INNER JOIN HARAKIRI.CANAL C on C.CANAL_CODIGO = V.VENTA_CANAL_CODIGO
  INNER JOIN HARAKIRI.BI_TIEMPO BT ON BT.TIEMPO_ANIO = year(V.VENTA_FECHA) AND BT.TIEMPO_MES = month(V.VENTA_FECHA)
  INNER JOIN HARAKIRI.BI_CANAL_VENTA BCV on BCV.CANAL_CODIGO = C.CANAL_CODIGO)

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.BI_HECHO_VENTA_DESCUENTO)
PRINT('Datos migrados a la tabla HARAKIRI.BI_HECHO_VENTA_DESCUENTO. Nuevas filas: ' + @CANTIDAD_REGISTROS)

END
GO

--Execs
EXEC HARAKIRI.MIGRAR_TABLA_BI_CATEGORIA
EXEC HARAKIRI.MIGRAR_TABLA_BI_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_CANAL_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_PAGO
EXEC HARAKIRI.MIGRAR_TABLA_BI_MEDIO_DE_ENVIO
EXEC HARAKIRI.MIGRAR_TABLA_BI_VENTA
EXEC HARAKIRI.MIGRAR_TABLA_BI_PROVEEDOR
EXEC HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_TIEMPO
EXEC HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA
EXEC HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
EXEC HARAKIRI.MIGRAR_TABLA_BI_COMPRA
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_DESCUENTO
-------------------------------------
