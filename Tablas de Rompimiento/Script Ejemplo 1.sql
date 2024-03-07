create table productos (
	codigo int not null,
	nombre varchar(50) not null,
	stock int not null,
	constraint productos_pk primary key (codigo)

)

create table proveedores (
	codigo int not null,
	nombre varchar(50) not null,
	telefono char(10) not null,
	constraint proveedores_pk primary key (codigo)
)

create table productos_por_proveedor(
	pp_codigo_producto int not null,
	pp_codigo_proveedor int not null,
	pp_precio money not null,
	constraint producto_fk foreign key (pp_codigo_producto) references productos (codigo),
	constraint proveedor_fk foreign key (pp_codigo_proveedor) references proveedores (codigo),
	constraint productos1_pk primary key (pp_codigo_producto,pp_codigo_proveedor)
)

-- Insert 1
INSERT INTO productos (codigo, nombre, stock) 
VALUES  (100, 'Doritos', 100),
		(200, 'Kachitos', 200),
		(300, 'Papas',300),
		(400, 'Takis', 0)
select * from productos

insert into proveedores (codigo,nombre,telefono)
values 	(1,'Snacks SA','0999863287'),
		(2,'Distrisnacks','0987272721')

select * from proveedores

insert into productos_por_proveedor (pp_codigo_producto, pp_codigo_proveedor,pp_precio)
values 	(300,1,'0.48')

insert into productos_por_proveedor (pp_codigo_producto, pp_codigo_proveedor,pp_precio)
values 	(200,2,'0.58')

insert into productos_por_proveedor (pp_codigo_producto, pp_codigo_proveedor,pp_precio)
values 	(100,1,'0.38')

insert into productos_por_proveedor (pp_codigo_producto, pp_codigo_proveedor,pp_precio)
values 	(400,1,'0.50');
insert into productos_por_proveedor (pp_codigo_producto, pp_codigo_proveedor,pp_precio)
values 	(300,1,'0.50');

select * from productos_por_proveedor

select * from productos prod ,proveedores prov, productos_por_proveedor pp where pp.pp_codigo_producto = prod.codigo and pp.pp_codigo_proveedor = prov.codigo

