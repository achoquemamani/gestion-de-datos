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
INSERT INTO HARAKIRI.BI_HECHO_VENTA_PRODUCTO (EDAD_CODIGO, TIEMPO_CODIGO, PROVINCIA_CODIGO, CANAL_CODIGO, MEDIO_DE_PAGO_CODIGO, CATEGORIA_CODIGO, PRODUCTO_CODIGO, MEDIO_ENVIO_CODIGO, ENVIO_PRECIO_MES_PROV_MDE, CANT_ENVIO_MES_PROV_MDE,CANT_ENVIO_MES_MDP_CV, PRODUCTO_PRECIO_TOTAL)
SELECT
	VISTA.EDAD_CODIGO,
	VISTA.TIEMPO_CODIGO,
	VISTA.PROVINCIA_CODIGO,
	VISTA.CANAL_CODIGO,
	VISTA.MEDIO_DE_PAGO_CODIGO,
	VISTA.CATEGORIA_CODIGO,
	VISTA.PRODUCTO_CODIGO,
	VISTA.MEDIO_ENVIO_CODIGO,
	(
		SELECT 
			SUM(VMEPL.VENTA_ENVIO_PRECIO)
		FROM HARAKIRI.VENTA V
		INNER JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(V.VENTA_FECHA) AND T.TIEMPO_MES = month(V.VENTA_FECHA)
		INNER JOIN HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD VMEPL ON VMEPL.MEDIO_ENVIO_POR_LOCALIDAD_CODIGO = V.VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO
		INNER JOIN HARAKIRI.LOCALIDAD L ON L.LOCALIDAD_CODIGO = VMEPL.LOCALIDAD_CODIGO
		INNER JOIN HARAKIRI.PROVINCIA P ON P.PROVINCIA_CODIGO = L.LOCALIDAD_PROVINCIA_CODIGO
		INNER JOIN HARAKIRI.BI_PROVINCIA BI_P ON BI_P.PROVINCIA_NOMBRE = P.PROVINCIA_NOMBRE
		INNER JOIN HARAKIRI.MEDIO_ENVIO ME ON ME.MEDIO_ENVIO_CODIGO = VMEPL.MEDIO_ENVIO_CODIGO
		INNER JOIN HARAKIRI.BI_MEDIO_DE_ENVIO BI_ME ON BI_ME.MEDIO_ENVIO_NOMBRE = ME.MEDIO_ENVIO_NOMBRE
		WHERE 
			T.TIEMPO_CODIGO = VISTA.TIEMPO_CODIGO AND
			BI_P.PROVINCIA_CODIGO = VISTA.PROVINCIA_CODIGO AND
			BI_ME.MEDIO_ENVIO_CODIGO = VISTA.MEDIO_ENVIO_CODIGO
	) ENVIO_PRECIO_MES_PROV_MDE,
	(
		SELECT COUNT(*)
		FROM HARAKIRI.VENTA V
		INNER JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(V.VENTA_FECHA) AND T.TIEMPO_MES = month(V.VENTA_FECHA)
		INNER JOIN HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD VMEPL ON VMEPL.MEDIO_ENVIO_POR_LOCALIDAD_CODIGO = V.VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO
		INNER JOIN HARAKIRI.LOCALIDAD L ON L.LOCALIDAD_CODIGO = VMEPL.LOCALIDAD_CODIGO
		INNER JOIN HARAKIRI.PROVINCIA P ON P.PROVINCIA_CODIGO = L.LOCALIDAD_PROVINCIA_CODIGO
		INNER JOIN HARAKIRI.BI_PROVINCIA BI_P ON BI_P.PROVINCIA_NOMBRE = P.PROVINCIA_NOMBRE
		INNER JOIN HARAKIRI.MEDIO_ENVIO ME ON ME.MEDIO_ENVIO_CODIGO = VMEPL.MEDIO_ENVIO_CODIGO
		INNER JOIN HARAKIRI.BI_MEDIO_DE_ENVIO BI_ME ON BI_ME.MEDIO_ENVIO_NOMBRE = ME.MEDIO_ENVIO_NOMBRE
	 	WHERE 
			T.TIEMPO_CODIGO = VISTA.TIEMPO_CODIGO AND
			BI_P.PROVINCIA_CODIGO = VISTA.PROVINCIA_CODIGO AND
			BI_ME.MEDIO_ENVIO_CODIGO = VISTA.MEDIO_ENVIO_CODIGO
	) CANT_ENVIO_MES_PROV_MDE,
	(
		SELECT COUNT(*)
		FROM HARAKIRI.VENTA V
		INNER JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(V.VENTA_FECHA) AND T.TIEMPO_MES = month(V.VENTA_FECHA)
		
		INNER JOIN HARAKIRI.MEDIO_DE_PAGO_VENTA MPV ON MPV.MEDIO_DE_PAGO_CODIGO = V.VENTA_MEDIO_DE_PAGO_CODIGO
		INNER JOIN HARAKIRI.BI_MEDIO_DE_PAGO BI_MP ON BI_MP.MEDIO_DE_PAGO_NOMBRE = MPV.MEDIO_DE_PAGO_NOMBRE
		INNER JOIN HARAKIRI.CANAL C ON C.CANAL_CODIGO = V.VENTA_CANAL_CODIGO
		INNER JOIN HARAKIRI.BI_CANAL_VENTA BI_CV ON BI_CV.CANAL_NOMBRE = C.CANAL_NOMBRE
		WHERE 
			T.TIEMPO_CODIGO = VISTA.TIEMPO_CODIGO AND
		    BI_MP.MEDIO_DE_PAGO_CODIGO = VISTA.MEDIO_DE_PAGO_CODIGO AND
			BI_CV.CANAL_CODIGO = VISTA.CANAL_CODIGO
	) CANT_ENVIO_MES_MDP_CV,
	SUM(VISTA.PRODUCTO_PRECIO_TOTAL) PRODUCTO_PRECIO_TOTAL
FROM
(
	SELECT DISTINCT 
		RE.EDAD_CODIGO,
		T.TIEMPO_CODIGO,
		P.PROVINCIA_CODIGO,
		CA.CANAL_CODIGO,
		MDPV.MEDIO_DE_PAGO_CODIGO,
		CAT.CATEGORIA_CODIGO,
		PROD.PRODUCTO_CODIGO,
		ME.MEDIO_ENVIO_CODIGO,
		VPP.PRODUCTO_PRECIO_TOTAL
	FROM HARAKIRI.VENTA_POR_PRODUCTO VPP
	JOIN HARAKIRI.VENTA V ON VPP.VENTA_CODIGO = V.VENTA_CODIGO
	JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = VPP.PRODUCTO_VARIANTE_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN O ES VENTA_POR_PRODUCTO_PRODUCTO_VARIANTE_CODIGO Y CORREGIR EN EL DER EN ESE CASO
	JOIN HARAKIRI.PRODUCTO PROD ON PROD.PRODUCTO_CODIGO = PV.PRODUCTO_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN O ES PRODUCTO_VARIANTE_PRODUCTO_CODIGO Y CORREGIR EN EL DER EN ESE CASO
	JOIN HARAKIRI.CLIENTE CLI ON V.VENTA_CLIENTE_CODIGO = CLI.CLIENTE_CODIGO
	JOIN HARAKIRI.MEDIO_ENVIO_POR_LOCALIDAD MDEPL ON MDEPL.MEDIO_ENVIO_POR_LOCALIDAD_CODIGO = V.VENTA_MEDIO_ENVIO_POR_LOCALIDAD_CODIGO
	JOIN HARAKIRI.LOCALIDAD L ON L.LOCALIDAD_CODIGO = MDEPL.LOCALIDAD_CODIGO -- VER SI EL NOMBRE DE LA FK ESTÁ BIEN
	JOIN HARAKIRI.PROVINCIA P ON L.LOCALIDAD_PROVINCIA_CODIGO = P.PROVINCIA_CODIGO
	JOIN HARAKIRI.CANAL CA ON V.VENTA_CANAL_CODIGO = CA.CANAL_CODIGO
	JOIN HARAKIRI.MEDIO_DE_PAGO_VENTA MDPV ON MDPV.MEDIO_DE_PAGO_CODIGO = V.VENTA_MEDIO_DE_PAGO_CODIGO
	JOIN HARAKIRI.CATEGORIA CAT ON CAT.CATEGORIA_CODIGO = PROD.PRODUCTO_CATEGORIA_CODIGO
	JOIN HARAKIRI.MEDIO_ENVIO ME ON ME.MEDIO_ENVIO_CODIGO = MDEPL.MEDIO_ENVIO_CODIGO
	JOIN HARAKIRI.BI_RANGO_EDAD RE ON RE.EDAD_CATEGORIA = HARAKIRI.rangoEtario_fx(CLI.CLIENTE_FECHA_NAC) -- VER EL NOMBRE QUE SE VA A USAR Y VER QUE RETORNE UN NVARCHAR
	JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(V.VENTA_FECHA) AND T.TIEMPO_MES = month(V.VENTA_FECHA)
) VISTA
GROUP BY 
	VISTA.EDAD_CODIGO,
	VISTA.TIEMPO_CODIGO,
	VISTA.PROVINCIA_CODIGO,
	VISTA.CANAL_CODIGO,
	VISTA.MEDIO_DE_PAGO_CODIGO,
	VISTA.CATEGORIA_CODIGO,
	VISTA.PRODUCTO_CODIGO,
	VISTA.MEDIO_ENVIO_CODIGO
ORDER BY VISTA.TIEMPO_CODIGO, VISTA.PROVINCIA_CODIGO, VISTA.MEDIO_ENVIO_CODIGO


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

CREATE PROCEDURE HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
AS
BEGIN
INSERT INTO HARAKIRI.BI_HECHO_COMPRA_PRODUCTO (PROVEEDOR_CUIT, TIEMPO_CODIGO, PRODUCTO_CODIGO, PRODUCTO_CANTIDAD,PRODUCTO_PRECIO_UNITARIO)
SELECT
	VISTA.PROVEEDOR_CUIT,
	VISTA.TIEMPO_CODIGO,
	VISTA.PRODUCTO_CODIGO, 
	SUM(VISTA.PRODUCTO_CANTIDAD) PRODUCTO_CANTIDAD,
	AVG(VISTA.PRODUCTO_PRECIO_UNITARIO) PRODUCTO_PRECIO_UNITARIO
FROM (
	SELECT DISTINCT
		CPP.COMPRA_POR_PRODUCTO_CODIGO,
		PRO.PROVEEDOR_CUIT,
		T.TIEMPO_CODIGO,
		P.PRODUCTO_CODIGO,
		CPP.PRODUCTO_CANTIDAD,
		CPP.PRODUCTO_PRECIO_TOTAL/CPP.PRODUCTO_CANTIDAD PRODUCTO_PRECIO_UNITARIO
	FROM HARAKIRI.COMPRA_POR_PRODUCTO CPP
	JOIN HARAKIRI.COMPRA C ON CPP.COMPRA_NUMERO = C.COMPRA_NUMERO
	JOIN HARAKIRI.PRODUCTO_VARIANTE PV ON PV.PRODUCTO_VARIANTE_CODIGO = CPP.PRODUCTO_VARIANTE_CODIGO 
	JOIN HARAKIRI.PRODUCTO P ON P.PRODUCTO_CODIGO = PV.PRODUCTO_CODIGO 
	JOIN HARAKIRI.PROVEEDOR PRO ON C.PROVEEDOR_CUIT = PRO.PROVEEDOR_CUIT
	JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_ANIO = year(C.COMPRA_FECHA) AND T.TIEMPO_MES = month(C.COMPRA_FECHA)
) VISTA
GROUP BY PROVEEDOR_CUIT, TIEMPO_CODIGO, PRODUCTO_CODIGO


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
INSERT INTO HARAKIRI.BI_HECHO_VENTA_DESCUENTO (TIPO_DESCUENTO_CODIGO,  TIEMPO_CODIGO, CANAL_CODIGO, MEDIO_DE_PAGO_CODIGO, DESCUENTO_IMPORTE)
   SELECT
	VISTA.TIPO_DESCUENTO_CODIGO,
	VISTA.TIEMPO_CODIGO,
	VISTA.CANAL_CODIGO,
	VISTA.MEDIO_DE_PAGO_CODIGO,
	SUM(VISTA.DESCUENTO_IMPORTE) DESCUENTO_IMPORTE 
FROM 
  (SELECT
    BTD.TIPO_DESCUENTO_CODIGO,
    BT.TIEMPO_CODIGO,
    BCV.CANAL_CODIGO,
	MDP.MEDIO_DE_PAGO_CODIGO,
	DPV.DESCUENTO_IMPORTE
  FROM HARAKIRI.VENTA V
  INNER JOIN HARAKIRI.DESCUENTO_POR_VENTA DPV on DPV.VENTA_CODIGO = V.VENTA_CODIGO
  INNER JOIN HARAKIRI.DESCUENTO_CONCEPTO DC on DC.DESCUENTO_CONCEPTO_CODIGO = DPV.DESCUENTO_CONCEPTO_CODIGO
  INNER JOIN HARAKIRI.CANAL C on C.CANAL_CODIGO = V.VENTA_CANAL_CODIGO
  INNER JOIN HARAKIRI.BI_TIPO_DE_DESCUENTO BTD on BTD.TIPO_DESCUENTO_CODIGO = DC.DESCUENTO_CONCEPTO_CODIGO
  INNER JOIN HARAKIRI.BI_TIEMPO BT ON BT.TIEMPO_ANIO = year(V.VENTA_FECHA) AND BT.TIEMPO_MES = month(V.VENTA_FECHA)
  INNER JOIN HARAKIRI.BI_CANAL_VENTA BCV on BCV.CANAL_CODIGO = C.CANAL_CODIGO
  INNER JOIN HARAKIRI.BI_MEDIO_DE_PAGO MDP ON MDP.MEDIO_DE_PAGO_CODIGO =V.VENTA_MEDIO_DE_PAGO_CODIGO
  UNION
  ( SELECT
    4,
    BT.TIEMPO_CODIGO,
    BCV.CANAL_CODIGO,
	MP.MEDIO_DE_PAGO_CODIGO,
	VPC.CUPON_IMPORTE DESCUENTO_IMPORTE
  FROM HARAKIRI.VENTA V
  INNER JOIN HARAKIRI.VENTA_POR_CUPON VPC on VPC.VENTA_CODIGO = V.VENTA_CODIGO
  INNER JOIN HARAKIRI.CANAL C on C.CANAL_CODIGO = V.VENTA_CANAL_CODIGO
  INNER JOIN HARAKIRI.BI_TIEMPO BT ON BT.TIEMPO_ANIO = year(V.VENTA_FECHA) AND BT.TIEMPO_MES = month(V.VENTA_FECHA)
  INNER JOIN HARAKIRI.BI_CANAL_VENTA BCV on BCV.CANAL_CODIGO = C.CANAL_CODIGO
  INNER JOIN HARAKIRI.BI_MEDIO_DE_PAGO MP on MP.MEDIO_DE_PAGO_CODIGO = MP.MEDIO_DE_PAGO_CODIGO )) AS VISTA
  
GROUP BY  VISTA.TIPO_DESCUENTO_CODIGO, VISTA.TIEMPO_CODIGO,VISTA.CANAL_CODIGO, VISTA.MEDIO_DE_PAGO_CODIGO
ORDER BY VISTA.TIPO_DESCUENTO_CODIGO, VISTA.TIEMPO_CODIGO,VISTA.CANAL_CODIGO,MEDIO_DE_PAGO_CODIGO


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
EXEC HARAKIRI.MIGRAR_TABLA_BI_TIPO_DE_DESCUENTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_TIEMPO
EXEC HARAKIRI.MIGRAR_TABLA_BI_PROVINCIA
EXEC HARAKIRI.MIGRAR_TABLA_BI_RANGO_EDAD
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_COMPRA_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_PRODUCTO
EXEC HARAKIRI.MIGRAR_TABLA_BI_HECHO_VENTA_DESCUENTO

-------------------------------------