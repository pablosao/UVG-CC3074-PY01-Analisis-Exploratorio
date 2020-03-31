create table grupo_hora(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
	)

go

create table grupo_tiempo(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go


create table mes_ocurrencia(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table dia_ocurrencia(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table departamento(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table municipio(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go


create table sexo(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go


create table grupo_edad(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table estado_conductor(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table tipo_vehiculo(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table color_vehiculo(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table tipo_evento(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go


create table resultado_accidente(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go

create table resultado_accidentado(
	codigo int not null,
	descripcion varchar(50),
	primary key(codigo)
)

go
