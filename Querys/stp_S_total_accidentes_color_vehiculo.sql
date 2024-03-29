ALTER PROCEDURE [dbo].[stp_S_total_accidentes_color_vehiculo] 
	@codigo_raccidente int -- 1 fallecido, 2 - lesionado  
as
	
	select 
		 cast(a.color_veh as nvarchar)+ ' - '+ f.descripcion as color_vehiculo
		,sum(e.codigo) as cantidad
	from
		fallecidos_lesionados as a
	inner join vehiculos_involucrados as b on a.num_corre = b.num_corre
	inner join hechos_transito as c on a.num_corre = c.num_corre
	inner join tipo_vehiculo as d on a.tipo_veh = d.codigo
	inner join resultado_accidente as e on a.fall_les = e.codigo
	inner join color_vehiculo as f on a.color_veh = f.codigo
	where
		e.codigo = @codigo_raccidente
	and a.tipo_veh not in (99)
	group by
		a.color_veh,f.descripcion
	order by
		a.color_veh asc