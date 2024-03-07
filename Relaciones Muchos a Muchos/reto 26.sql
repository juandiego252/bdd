---Tablas Muchos a Muchos
-----1 
---RELACION MUCHOS A MUCHOS ENTRE USUARIOS Y GRUPO
drop table usuarios
create table usuarios (
	id_usuarios int,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	fecha_nacimiento date,
	constraint usuarios_PK primary key (id_usuarios)
)

create table grupo(
	id_grupo int,
	nombre varchar(25) not null,
	descripcion varchar(75),
	fecha_creacion date,
	constraint grupo_pk primary key (id_grupo)
)

create table usuario_grupo (
	us_id int not null,
	gr_id int not null,
	constraint usuario_fk foreign key (us_id) references usuarios (id_usuarios),
	constraint grupo_fk foreign key (gr_id) references grupo (id_grupo),
	constraint usuario_grupo_pk primary key(us_id,gr_id)
)


insert into usuarios values (1,'Marilyn','Sagñay','05/11/2023'),
							(2,'Romel','Chamba','06/11/2023'),
							(3,'Mario','Guzñay','05/11/2023'),
							(4,'Johann','Domo','07/11/2023'),
							(5,'Monserrate','Vera','05/11/2023'),
							(6,'Lucio','Vargas','05/11/2023'),
							(7,'Martín','Arizaga','05/11/2023'),
							(8,'Fricson','Erazo','05/11/2023'),
							(9,'Jairo','Obando','05/11/2023'),
							(10,'Berni','Tomalá','05/11/2023');
							
							
insert into grupo values (1,'Maternal 1','Grupo de maternal matutino','08/03/2020'),
						 (2,'Maternal 2','Grupo de maternal vepertino','08/03/2020'),
						 (3,'Maternal 3','Grupo de maternal nocturno','08/03/2020'),
						 (4,'Incial 1 ','Grupo de inicial matutino','15/03/2021'),
						 (5,'Incial 2','Grupo de  inicial vespertino','15/03/2021'),
						 (6,'Incial 3','Grupo de  inicial  nocturno','15/03/2021'),
						 (7,'Incial intensivo','Grupo de inicial días sabados','15/03/2021'),
						 (8,'Maternal intensivo 1','Grupo de maternal matutino días sabados','15/03/2022'),
						 (9,'Maternal intensivo 2','Grupo de maternal vespertino días sabados','15/03/2022'),
						 (10,'Maternal intensivo 3','Grupo de maternal nocturno días sabados','15/03/2022');


insert into usuario_grupo values (1,8),
								 (2,3),
								 (3,8),
								 (4,9),
								 (5,1),
								 (6,2),
								 (7,8),
								 (8,8),
								 (9,10),
								 (10,1);
								 
----- Consultas -------
-- 1 
select usr.nombre, gr.nombre from usuarios usr, grupo gr, usuario_grupo where usr.id_usuarios = usuario_grupo.us_id and gr.id_grupo = usuario_grupo.gr_id
-- 2
SELECT nombre
FROM usuarios
WHERE id_usuarios IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 1);}
-- 3
select count(ug.us_id), gr.nombre from grupo gr, usuario_grupo ug where gr.id_grupo = ug.gr_id group by gr.nombre
-- 4
select usr.nombre, gr.nombre from usuarios usr, grupo gr, usuario_grupo ug where usr.id_usuarios = ug.us_id and gr.id_grupo = ug.gr_id and gr.nombre like '%intensivo%'
-- 5
SELECT nombre
FROM usuarios
WHERE id_usuarios IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 2);
-- 6
select max(ug.us_id),gr.nombre from grupo gr, usuario_grupo ug where gr.id_grupo = ug.gr_id group by gr.nombre
-- 7
select usr.nombre, gr.fecha_creacion from usuarios usr, grupo gr, usuario_grupo ug where usr.id_usuarios = ug.us_id
and gr.id_grupo = ug.gr_id  
and gr.fecha_creacion between '2020-03-08' and '2022-03-08';
-- 8
SELECT nombre
FROM usuarios
WHERE id_usuarios IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 3);
-- 9
select count(ug.us_id) ,gr.descripcion from grupo gr, usuario_grupo ug where gr.id_grupo = ug.gr_id
and gr.descripcion like '%matutino%' group by gr.descripcion 
------2------------
--RELACION MUCHOS A MUCHOS HABITACIONES Y HUESPEDES

create table habitaciones (
	habitacion_numero int,
	precio_por_noche float not null,
	piso int not null,
	max_personas int,
	constraint habitaciones_pk primary key (habitacion_numero)
)

create table huespedes (
	id_huespedes int,
	nombre varchar(45) not null,
	apellidos varchar(45) not null,
	telefono char(10),
	correo varchar(45),
	direccion varchar(45),
	ciudad varchar(45),
	pais varchar(45),
	constraint huespedes_pk primary key (id_huespedes)
)

create table reservas(
	inicio_fecha date,
	fin_fecha date,
	habitacion int not null,
	huesped_id int not null,
	constraint habitacion_fk foreign key (habitacion) references habitaciones (habitacion_numero),
	constraint huesped_fk foreign key (huesped_id) references huespedes (id_huespedes),
	constraint reservas_pk primary key (habitacion,huesped_id)
)

 insert into habitaciones values (1,40.0,4,4),
 								 (2,20.0,4,2),
								 (3,40.0,4,4),
								 (4,40.0,3,4),
								 (5,20.0,3,2),
								 (6,20.0,3,2),
								 (7,20.0,2,2),
								 (8,20.0,2,2),
								 (9,20.0,2,2),
								 (10,15.0,1,1),
								 (11,15.0,1,1),
								 (12,15.0,1,1);
								 

insert into huespedes values    (1,'Ricardo','Montero',0980658774,'Ricmontero@gmail.com'),
								(2,'Sofía','Martinez',09887563205,'Sofimar@gmail.com'),
								(3,'Yamilteh','Guami',0998763298,'YAMGUAM@gmail.com'),
								(4,'Esther','Contreras',0995783602,'Esthcontro@gmail.com'),
								(5,'Wiliam','Mantilla',09858796320,'wmANTILLA@gmail.com'),
								(6,'Carmen','Noguera',0995876321,'Cnoguera@gmail.com'),
								(7,'Anika','Jimenez',0978965432,'AniJimenez@gmail.com'),
								(8,'Belen','Orejuela',0996365748,'BOrejuela@gmail.com'),
								(9,'Diana','Monroy',0987963214,'DianaMroy@gmail.com'),
								(10,'Bryan','Moncada',0986325741,'BrMoncada@gmail.com');
												
								
insert into reservas values ('11/05/2023','12/05/2023',2,10),
						    ('11/05/2023','12/05/2023',2,9),
							('22/06/2023','23/06/2023',1,1),
							('22/06/2023','23/06/2023',1,2),
							('22/06/2023','23/06/2023',1,3),
							('22/06/2023','23/06/2023',1,4),
							('01/01/2023','02/01/2023',12,5),
							('11/08/2023','12/08/2023',11,6),
							('11/05/2023','12/05/2023',10,7),
							('11/05/2023','12/05/2023',9,8);
--- Consultas ---
-- 1
select ha.habitacion_numero, hue.nombre, hue.apellidos from habitaciones ha,huespedes hue, reservas re
where ha.habitacion_numero = re.habitacion 
and hue.id_huespedes = re.huesped_id
-- 2
SELECT nombre, apellidos
FROM huespedes
WHERE id_huespedes IN (SELECT huesped_id FROM reservas WHERE habitacion = 2);
-- 3
select count(re.huesped_id),ha.habitacion_numero from habitaciones ha, reservas re
where ha.habitacion_numero = re.habitacion 
group by ha.habitacion_numero
-- 4
select ha.habitacion_numero, ha.piso, hue.nombre, hue.apellidos from habitaciones ha, huespedes hue, reservas re
where ha.piso = 4 and ha.habitacion_numero = re.habitacion
and hue.id_huespedes = re.huesped_id
-- 5 
SELECT nombre, apellidos
FROM huespedes
WHERE id_huespedes IN (SELECT huesped_id FROM reservas WHERE habitacion = 3);
-- 6
select AVG(re.huesped_id),ha.habitacion_numero from habitaciones ha, reservas re
where ha.habitacion_numero = re.habitacion 
group by ha.habitacion_numero
-- 7
select ha.habitacion_numero, hue.nombre, hue.apellidos from habitaciones ha, huespedes hue, reservas re
where ha.habitacion_numero = re.habitacion and hue.id_huespedes = re.huesped_id
-- 8
SELECT nombre, apellidos
FROM huespedes
WHERE id_huespedes IN (SELECT huesped_id FROM reservas WHERE habitacion = 14);
-- 9
select SUM(ha.precio_por_noche),ha.habitacion_numero from habitaciones ha, reservas re
where ha.habitacion_numero = re.habitacion group by ha.habitacion_numero
-------------3
--RELACION MUCHOS A MUCHOS MUNICIPIO Y PROYECTOS

create table ciudad (
	id_ciudad int,
	nombre varchar(45) not null,
	constraint ciudad_pk primary key (id_ciudad)
)

create table municipio (
	id_municipio int,
	nombre varchar (45),
	ciudad_id int,
	constraint municipio_pk primary key (id_municipio),
	constraint ciudad_fk foreign key (ciudad_id) references ciudad (id_ciudad)
)

create table proyecto (
	id_proyecto int,
	proyecto varchar(50) not null,
	monto money not null,
	fecha_inicio date,
	fecha_entrega date,
	constraint proyecto_pk primary key (id_proyecto)
)

create table proyecto_municipio (
	municipio_id int not null,
	proyecto_id int not null,
	constraint municipio_fk foreign key (municipio_id) references municipio (id_municipio),
	constraint proyecto_fk foreign key (proyecto_id) references proyecto (id_proyecto),
	constraint proyecto_municipio_pk primary key (municipio_id,proyecto_id)
)

insert into ciudad values   (1,'Quito'),
							(2,'Ambato'),
							(3,'Guayaquil'),
							(4,'Machala'),
							(5,'Manta'),
							(6,'Loja'),
							(7,'Otavalo'),
							(8,'Cuenca'),
							(9,'Latacunga'),
							(10,'Tena');


insert into municipio values (1,'GAD MUNICIPAL QUITO',1),
							 (2,'GAD MUNICIPAL DE CUENCA',8),
							 (3,'GAD MUNICIPALIDAD DE AMBATO',2),
							 (4,'MUNICIPALIDAD DE MACAHALA ',4),
							 (5,'MUNIUCIPIO DE GUAYAQUIL',3),
							 (6,'MUNICIPIO DE OTAVALO',7),
							 (7,'MUNICIPIO DE LOJA',6),
							 (8,'MUNICIPIO DE MANTA',5),
							 (9,'MUNICIPIO DE LATACUNGA',9),
							 (10,'MUNICIPIO DE TENA',10);


insert into proyecto values (1,'Proyectos de Gestión Ambiental',9543.327,'10/02/2022','10/02/2023'),
							(2,'Proyectos en Fomento y Desarrollo Productivo',26553.264,'25/06/2022','10/08/2022'),
							(3,'Proyectos en Cambio Climático',1292.194,'01/02/2021','10/12/2023');
							
select * from proyecto
select * from municipio
select * from proyecto_municipio
insert into proyecto_municipio values (5,1),
									  (5,3),
									  (2,1),
									  (1,2),
									  (4,1),
									  (9,2),
									  (10,1),
									  (6,3),
									  (3,1),
									  (7,2);
-- Cosultas --
-- 1
select mu.nombre, pr.proyecto from municipio mu, proyecto pr, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id and pr.id_proyecto = pm.proyecto_id
-- 2
SELECT proyecto
FROM proyecto
WHERE id_proyecto IN (SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 1);
-- 3
select count(pm.proyecto_id),mu.nombre from municipio mu, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id group by mu.nombre
-- 4
select mu.nombre, pr.proyecto from municipio mu, proyecto pr, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id and pr.id_proyecto = pm.proyecto_id
and mu.nombre like '%GAD%'
-- 5
select MIN(pm.proyecto_id),mu.nombre from municipio mu, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id group by mu.nombre
-- 6
select mu.nombre, ci.nombre from municipio mu, ciudad ci 
where mu.ciudad_id = ci.id_ciudad
-- 7
SELECT *
FROM proyecto
WHERE id_proyecto IN (SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 3);
-- 8
select MAX(pm.proyecto_id),mu.nombre from municipio mu, proyecto_municipio pm
where mu.id_municipio = pm.municipio_id group by mu.nombre


