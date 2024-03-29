
alter PROCEDURE [dbo].[stp_S_total_accidentes_tipo_vehiculo]  
as
	
	select 
		 cast(a.tipo_veh as nvarchar)+ ' - '+ f.descripcion as vehiculo
		,sum(e.codigo) as cantidad
	from
		fallecidos_lesionados as a
	inner join vehiculos_involucrados as b on a.num_corre = b.num_corre
	inner join hechos_transito as c on a.num_corre = c.num_corre
	inner join tipo_vehiculo as d on a.tipo_veh = d.codigo
	inner join resultado_accidente as e on a.fall_les = e.codigo
	inner join tipo_vehiculo as f on a.tipo_veh = f.codigo

	group by
		a.tipo_veh,f.descripcion
	order by
		a.tipo_veh asc

