

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




CREATE VIEW HARAKIRI.GANANCIAS_MENSUALES_X_MES
AS
SELECT  C.VENTA_CODIGO,T.TIEMPO_ANIO,T.TIEMPO_MES,COUNT(vp.CATEGORIA_CODIGO)  as [VECES_VENDIDA_CATEGORIA]
FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO VP 
JOIN HARAKIRI.BI_CATEGORIA C ON C.CATEGORIA_CODIGO = VP.CATEGORIA_CODIGO
JOIN HARAKIRI.BI_TIEMPO T ON VP.TIEMPO_CODIGO = T.TIEMPO_CODIGO 
JOIN HARAKIRI.BI_RANGO_EDAD E ON VP.EDAD_CODIGO = E.EDAD_CODIGO
WHERE vp.CATEGORIA_CODIGO in(SELECT TOP 5 vp.CATEGORIA_CODIGO FROM HARAKIRI.BI_HECHO_VENTA_PRODUCTO vp	GROUP BY vp.CATEGORIA_CODIGO ORDER BY COUNT(DISTINCT vp.CATEGORIA_CODIGO) DESC)

GROUP BY  E.EDAD_CATEGORIA,T.TIEMPO_ANIO,T.TIEMPO_MES,vp.CATEGORIA_CODIGO

GO

DECLARE @CANTIDAD_REGISTROS NVARCHAR(255)
SET @CANTIDAD_REGISTROS = (SELECT COUNT(*) FROM HARAKIRI.GANANCIAS_MENSUALES_X_MES)
PRINT('View GANANCIAS_MENSUALES_X_MES creada. Cant filas: ' + @CANTIDAD_REGISTROS)



