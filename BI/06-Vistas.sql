USE GD2C2022
GO

/*Creación de vistas*/
IF OBJECT_ID('HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES
    PRINT('Vista HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES eliminado')
END
GO

CREATE VIEW HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES
AS
SELECT  E.EDAD_CATEGORIA,T.TIEMPO_ANIO,T.TIEMPO_MES,vp.CATEGORIA_CODIGO,COUNT(vp.CATEGORIA_CODIGO)  as [VECES_VENDIDA_CATEGORIA]
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
JOIN HARAKIRI.BI_CATEGORIA C ON C.CATEGORIA_CODIGO = VP.CATEGORIA_CODIGO
JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
JOIN HARAKIRI.BI_RANGO_EDAD E ON VP.EDAD_CODIGO = E.EDAD_CODIGO
WHERE vp.CATEGORIA_CODIGO in(SELECT TOP 5 vp.CATEGORIA_CODIGO FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO vp	GROUP BY vp.CATEGORIA_CODIGO ORDER BY COUNT(DISTINCT vp.CATEGORIA_CODIGO) DESC)
GROUP BY  E.EDAD_CATEGORIA,T.TIEMPO_ANIO,T.TIEMPO_MES,vp.CATEGORIA_CODIGO
GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES)
PRINT('View TOP_5_CATEGORIAS_VENDIDAS_X_RANGO_ETARIO_CLIENTES_X_MES creada. Cant filas: ' + @CANTIDAD_REGISTROS)

---vista4 -------------------------------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('HARAKIRI.INGRESOS_TOTALES_X_MEDIODEPAGO_X_MES') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.INGRESOS_TOTALES_X_MEDIODEPAGO_X_MES
    PRINT('Vista HARAKIRI.INGRESOS_TOTALES_X_MEDIODEPAGO_X_MES eliminado')
END
GO


CREATE VIEW HARAKIRI.INGRESOS_TOTALES_X_MEDIODEPAGO_X_MES
AS
SELECT SUM(V.VENTA_TOTAL-MDP.MEDIO_DE_PAGO_COSTO) AS INGRESOS_TOTALES , T.TIEMPO_ANIO , T.TIEMPO_MES ,MDP.MEDIO_DE_PAGO_NOMBRE
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
JOIN HARAKIRI.BI_MEDIO_DE_PAGO MDP ON MDP.MEDIO_DE_PAGO_CODIGO = VP.MEDIO_DE_PAGO_CODIGO
JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO
JOIN HARAKIRI.BI_VENTA V ON V.VENTA_CODIGO = VP.VENTA_CODIGO
GROUP BY T.TIEMPO_ANIO , T.TIEMPO_MES,MDP.MEDIO_DE_PAGO_NOMBRE 
GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.INGRESOS_TOTALES_X_MEDIODEPAGO_X_MES)
PRINT('View HARAKIRI.INGRESOS_TOTALES_X_MEDIODEPAGO_X_MES creada. Cant filas: ' + @CANTIDAD_REGISTROS)

IF OBJECT_ID('HARAKIRI.PRODUCTOS_CON_MAYOR_RENTABILIDAD_ANUAL') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.PRODUCTOS_CON_MAYOR_RENTABILIDAD_ANUAL
    PRINT('Vista HARAKIRI.PRODUCTOS_CON_MAYOR_RENTABILIDAD_ANUAL eliminada')
END
GO

CREATE VIEW HARAKIRI.PRODUCTOS_CON_MAYOR_RENTABILIDAD_ANUAL
AS
SELECT TOP 5 * FROM (
SELECT T.TIEMPO_ANIO, P.PRODUCTO_NOMBRE, (SUM(HVP.PRODUCTO_PRECIO_TOTAL) - SUM(HCP.PRODUCTO_CANTIDAD * HCP.PRODUCTO_PRECIO_UNITARIO))/SUM(HVP.PRODUCTO_PRECIO_TOTAL) * 100 AS PORCENTAJE_RENTABILIDAD
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO HVP
JOIN HARAKIRI.BI_PRODUCTO P ON P.PRODUCTO_CODIGO = HVP.PRODUCTO_CODIGO
JOIN HARAKIRI.BI_HECHO_COMPRA_PRODUCTO HCP ON HCP.PRODUCTO_CODIGO = P.PRODUCTO_CODIGO
JOIN HARAKIRI.BI_TIEMPO T ON T.TIEMPO_CODIGO = HVP.TIEMPO_CODIGO
GROUP BY T.TIEMPO_ANIO, P.PRODUCTO_NOMBRE
) RENTABILIDADES
GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PRODUCTOS_CON_MAYOR_RENTABILIDAD_ANUAL)
PRINT('View PRODUCTOS_CON_MAYOR_RENTABILIDAD_ANUAL creada. Cant filas: ' + @CANTIDAD_REGISTROS)



IF OBJECT_ID('HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES
    PRINT('Vista HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES eliminado')
END
GO

CREATE VIEW HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES
AS
SELECT  T.TIEMPO_ANIO,T.TIEMPO_MES,C.CANAL_NOMBRE,TD.TIPO_DESCUENTO_NOMBRE,SUM(VD.DESCUENTO_IMPORTE) AS [Importe Total]
FROM HARAKIRI.BI_HECHO_VENTA_DESCUENTO VD 
JOIN HARAKIRI.BI_CANAL_VENTA C ON C.CANAL_CODIGO = VD.CANAL_CODIGO
JOIN HARAKIRI.BI_TIEMPO T ON VD.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
JOIN HARAKIRI.BI_TIPO_DE_DESCUENTO TD ON VD.TIPO_DESCUENTO_CODIGO = TD.TIPO_DESCUENTO_CODIGO
GROUP BY  T.TIEMPO_ANIO,T.TIEMPO_MES,C.CANAL_NOMBRE,TD.TIPO_DESCUENTO_NOMBRE
GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES)
PRINT('View IMPORTE_TOTAL_DESCUENTOS_SEGUN_TIPO_DE_DESCUENTO_X_CANAL_VENTA_X_MES creada. Cant filas: ' + @CANTIDAD_REGISTROS)



IF OBJECT_ID('HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL
    PRINT('Vista HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL eliminado')
END
GO

CREATE VIEW HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL
AS
SELECT
    P.PROVEEDOR_RAZON_SOCIAL,
    T.TIEMPO_ANIO,
    (
        MAX(CP.PRODUCTO_PRECIO_UNITARIO) - 
        MIN(CP.PRODUCTO_PRECIO_UNITARIO)
    ) / MIN(CP.PRODUCTO_PRECIO_UNITARIO) PRECIO_PROMEDIO
FROM HARAKIRI.BI_HECHO_COMPRA_PRODUCTO CP
INNER JOIN HARAKIRI.BI_TIEMPO T ON CP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
INNER JOIN HARAKIRI.BI_PROVEEDOR P ON CP.PROVEEDOR_CUIT = P.PROVEEDOR_CUIT
GROUP BY T.TIEMPO_ANIO, P.PROVEEDOR_RAZON_SOCIAL
GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL)
PRINT('View AUMENTO_DE_PRECIOS_X_PROVEEDOR_ANUAL creada. Cant filas: ' + @CANTIDAD_REGISTROS)



IF OBJECT_ID('HARAKIRI.PORCENTAJE_DE_ENVIOS_PROVINCIA_X_MES') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.PORCENTAJE_DE_ENVIOS_PROVINCIA_X_MES
    PRINT('Vista HARAKIRI.PORCENTAJE_DE_ENVIOS_PROVINCIA_X_MES eliminado')
END
GO

CREATE VIEW HARAKIRI.PORCENTAJE_DE_ENVIOS_PROVINCIA_X_MES
AS
SELECT T.TIEMPO_ANIO,T.TIEMPO_MES, P.PROVINCIA_NOMBRE, (round(COUNT(P.PROVINCIA_NOMBRE) * 100.00/ 
(
 SELECT COUNT(*)
	FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP2 
	JOIN HARAKIRI.BI_TIEMPO T2 ON VP2.TIEMPO_CODIGO = T2.TIEMPO_CODIGO 
	where T2.TIEMPO_ANIO=T.TIEMPO_ANIO AND T2.TIEMPO_MES = T.TIEMPO_MES 
), 2)) AS [PORCENTAJE]
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
JOIN HARAKIRI.BI_PROVINCIA P ON P.PROVINCIA_CODIGO = VP.PROVINCIA_CODIGO
GROUP BY T.TIEMPO_ANIO,T.TIEMPO_MES,P.PROVINCIA_NOMBRE 

GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PORCENTAJE_DE_ENVIOS_PROVINCIA_X_MES)
PRINT('View PORCENTAJE_DE_ENVIOS_PROVINCIA_X_MES creada. Cant filas: ' + @CANTIDAD_REGISTROS)



IF OBJECT_ID('HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL') IS NOT NULL
BEGIN
	DROP VIEW HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL
    PRINT('Vista HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL eliminado')
END
GO

CREATE VIEW HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL
AS
SELECT T.TIEMPO_ANIO, P.PROVINCIA_NOMBRE, MEDIO_ENVIO_NOMBRE, AVG(VP.VENTA_ENVIO_PRECIO) PROMEDIO_ENVIO_PRECIO
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
JOIN HARAKIRI.BI_PROVINCIA P ON P.PROVINCIA_CODIGO = VP.PROVINCIA_CODIGO
JOIN HARAKIRI.BI_MEDIO_DE_ENVIO MDE ON MDE.MEDIO_ENVIO_CODIGO=VP.MEDIO_ENVIO_CODIGO
GROUP BY T.TIEMPO_ANIO, P.PROVINCIA_NOMBRE, MDE.MEDIO_ENVIO_NOMBRE
GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL)
PRINT('View PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL creada. Cant filas: ' + @CANTIDAD_REGISTROS)

/** 
Las ganancias mensuales de cada canal de venta. Se entiende por ganancias al total de las ventas, menos el total de las compras,
menos los costos de transacción totales aplicados asociados los medios de pagos utilizados en las mismas.
*/

-- IF OBJECT_ID('HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL') IS NOT NULL
-- BEGIN
-- 	DROP VIEW HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL
--     PRINT('Vista HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL eliminado')
-- END
-- GO

-- CREATE VIEW HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL
-- AS
-- SELECT T.TIEMPO_ANIO, P.PROVINCIA_NOMBRE, MEDIO_ENVIO_NOMBRE, AVG(VP.VENTA_ENVIO_PRECIO) PROMEDIO_ENVIO_PRECIO
-- FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
-- JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
-- JOIN HARAKIRI.BI_PROVINCIA P ON P.PROVINCIA_CODIGO = VP.PROVINCIA_CODIGO
-- JOIN HARAKIRI.BI_MEDIO_DE_ENVIO MDE ON MDE.MEDIO_ENVIO_CODIGO=VP.MEDIO_ENVIO_CODIGO
-- GROUP BY T.TIEMPO_ANIO, P.PROVINCIA_NOMBRE, MDE.MEDIO_ENVIO_NOMBRE
-- GO

-- DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
-- SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL)
-- PRINT('View PROMEDIO_DE_ENVIO_PROVINCIA_X_MEDIO_DE_ENVIO_ANUAL creada. Cant filas: ' + @CANTIDAD_REGISTROS)
