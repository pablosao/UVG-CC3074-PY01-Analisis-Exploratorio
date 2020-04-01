
alter PROCEDURE [dbo].[stp_S_accidentes_por_grupo_hora] 
	@codigo_raccidente int -- 1 fallecido, 2 - lesionado  
AS   
--=====================================================
-- Creo: Pablo Sao
-- Descripcion: obtiene cantidad de lesionados o
--              fallecidos en un grupo de hora por
--				color
--=====================================================
	DECLARE 
		@columns  NVARCHAR(MAX) = '',
		@columns2 NVARCHAR(MAX) = '',
		@query    NVARCHAR(MAX) = '';


	SELECT 
		@columns2 += QUOTENAME(descripcion) + ','
	FROM 
		color_vehiculo
	ORDER BY 
		descripcion desc;


	SELECT 
		@columns += 'ISNULL(' + QUOTENAME(descripcion) +',0) AS ' + QUOTENAME(descripcion) + ', '
	FROM 
		color_vehiculo
	ORDER BY 
		descripcion desc;


	-- Removiendo ultima Coma

	SET @columns = LEFT(@columns, LEN(@columns) - 1);

	SET @columns2 = LEFT(@columns2, LEN(@columns2) - 1);
 

	set @query = '

	SELECT 
		  cast(codigo_hora as varchar) + ' + char(39) +' - ' + char(39) + ' + grupo_hora as Grupo, ' + @columns + 
	'FROM  
	(
		select 
			 a.g_hora as codigo_hora
			,d.descripcion as grupo_hora

			,f.descripcion as color_vehiculo
			,e.codigo as fallecidos_lesionados
		from
			fallecidos_lesionados as a
		inner join vehiculos_involucrados as b on a.num_corre = b.num_corre
		inner join hechos_transito as c on a.num_corre = c.num_corre
		inner join grupo_hora as d on a.g_hora = d.codigo
		inner join resultado_accidente as e on a.fall_les = e.codigo
		inner join color_vehiculo as f on a.color_veh = f.codigo
		where
			e.codigo = '+ cast(@codigo_raccidente as nvarchar) +'
		and a.tipo_veh not in (99)
		

	) AS tabla_datos	
	PIVOT  
	(  
		SUM(fallecidos_lesionados)  
		FOR 
			color_vehiculo in ('+ @columns2 +')

	) AS tabla_pivote
	order by tabla_pivote.codigo_hora'



	
	EXECUTE sp_executesql @query;





