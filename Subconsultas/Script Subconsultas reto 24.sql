drop table productos
create table productos (
	codigo int not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)

select * from cuentas

create table cuentas(
	numero_cuenta varchar(5) not null,
	cedula_propietario varchar(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	constraint cuentas_pk primary key(numero_cuenta)
)
select * from estudiantes
create table estudiantes (
	cedula varchar(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	email varchar(50)  not null,
	fecha_nacimiento date not null,
	constraint estudiantes_pk primary key (cedula)
)

create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado varchar(10) not null,
	fecha date not null,
	hota time not null,
	constraint registro_entrada_pk primary key (codigo_registro)
)

create table videojuegos (
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valoracion int not null,
	constraint videojuegos_pk primary key(codigo)
	
)

create table transacciones (
	codigo int not null,
	numero_cuenta varchar(5) not null,
	monto money not null,
	tipo varchar(1) not null,
	fecha date not null,
	hora time not null,
	constraint transacciones_pk primary key (codigo)
)


select * from usuario
drop table usuario
create table usuario (
	cedula_usuario char(10),
	nombre varchar(25),
	apellido varchar(25),
	tipo_cuenta varchar(20),
	limite_credito decimal(10,2),
	constraint usuario_pk primary key(cedula_usuario)
)

INSERT INTO usuario (cedula_usuario, nombre, apellido, tipo_cuenta, limite_credito)
VALUES
('12345', 'Juan', 'Perez', 'Corriente', 1000.00),
('98765', 'Maria', 'Gonzalez', 'Ahorros', 2000.00),
('55555', 'Pedro', 'Lopez', 'Corriente', 1500.00),
('11111', 'Ana', 'Martinez', 'Ahorros', 3000.00),
('99999', 'Luis', 'Rodriguez', 'Corriente', 500.00);


select * from cuentas
delete from cuentas
alter table cuentas add constraint cedula_propietario_fk foreign key (cedula_propietario) references usuario (cedula_usuario)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values ('22111','12345','20/05/2024','250');
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values ('22678','98765','20/02/2024','255');

select * from clientes

create table compras (
	id_compra int,
	cedula char(10),
	fecha_compra date,
	monto decimal(10,2),
	constraint compras_pk primary key (id_compra)
)
alter table compras add constraint cedula_fk foreign key (cedula) references clientes (cedula)

select * from compras

insert into clientes (cedula,nombre,apellido,edad)
values ('1755014238','Juan','Lopez',20);
insert into clientes (cedula,nombre,apellido,edad)
values ('1755012222','Diego','Ramirez',21);
insert into clientes (cedula,nombre,apellido,edad)
values ('1755014211','Rodolfo','Asprilla',21);

insert into compras (id_compra,cedula,fecha_compra,monto) 
values ('001','1755014238','20/07/2024','3450')

select * from productos

create table ventas (
	id_venta int,
	codigo_producto int,
	fecha_venta date,
	cantida int,
	constraint ventas_pk primary key (id_venta)
)

alter table ventas add constraint ventas_fk foreign key (codigo_producto) references productos (codigo)
select * from productos,ventas where productos.codigo = ventas.codigo_producto
insert into ventas (id_venta,codigo_producto,fecha_venta,cantida)
values (1,2,'2024/05/01',2)


select * from videojuegos

create table plataformas (
	id_plataforma int,
	nombre_plataforma varchar(50),
	codigo_videojuego int,
	constraint plataformas_pk primary key (id_plataforma)
)

alter table plataformas add constraint plataformas_fk foreign key (codigo_videojuego) references videojuegos (codigo)
insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values (1,'Steam',2)
select * from plataformas

select * from estudiantes
alter table estudiantes add column codigo_profesor int

create table profesores (
	codigo int,
	nombre varchar(50)
)
alter table profesores add constraint profesores_pk primary key (codigo) 
select * from profesores

alter table estudiantes add constraint estudiantes_fk foreign key (codigo_profesor) references profesores (codigo)

select * from registros_entrada
alter table registros_entrada add column codigo_empleado int

create table empleado (
	codigo_empleado int,
	nombre varchar(25),
	fecha date,
	hora time
)

alter table empleado add constraint empleado_pk primary key (codigo_empleado)

alter table registros_entrada add constraint registros_fk foreign key (codigo_empleado) references empleado (codigo_empleado)
select * from empleado

drop table personas 
create table personas (
	cedula char(10),
	nombre varchar(50),
	apellido varchar(50),
	estatura decimal(10,2),
	fecha_nacimiento date,
	hora_nacimiento time,
	cantidad_ahorrada money,
	numero_hijos int,
	constraint perso_pk primary key (cedula)
)
select * from personas

create table prestamo (
	cedula char(10),
	monto money,
	fecha_prestamo date,
	hora_prestamo time,
	garante varchar(40),
	constraint prestamo_pk primary key (cedula),
	constraint prestamo_fk foreign key (cedula) references personas (cedula)
)

select * from prestamo

select * from transacciones

create table banco (
	codigo_banco int,
	codigo_transaccion int,
	detalle varchar(100),
	constraint banco_pk primary key (codigo_banco),
	constraint banco_fk foreign key (codigo_transaccion) references transacciones (codigo)
)

select * from personas, estado_civil
select * from estado_civil

 


select * from usuario
select * from cuentas
-- Subconsultas
select numero_cuenta,nombre, apellido, saldo from usuario usr, cuentas cue where usr.cedula_usuario = cue.cedula_propietario
select numero_cuenta,fecha_creacion,saldo, cedula_usuario from usuario usr, cuentas cue where usr.cedula_usuario = cue.cedula_propietario and 
fecha_creacion between '2024/02/20' and '2024/05/20'

select * from clientes
select * from compras

select nombre, apellido from clientes where cedula like '%7%'
select cedula,nombre,apellido,edad from clientes where nombre = 'Monica'

select * from estudiantes
select * from profesores
INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
VALUES 
  ('1755014238', 'Juan', 'Lopez', 'juan@gmail.com', '2002-05-02', 1),
  ('1755014239', 'Maria', 'Garcia', 'maria@gmail.com', '2001-06-15', 2),
  ('1755014240', 'Pedro', 'Martinez', 'pedro@gmail.com', '2003-09-20', 3),
  ('1755014241', 'Ana', 'Rodriguez', 'ana@gmail.com', '2000-11-25', 4),
  ('1755014242', 'Luis', 'Gomez', 'luis@gmail.com', '2004-02-12', 5);
 
INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
VALUES ('1755014243', 'David', 'Rivas', 'rivas@gmail.com', '2003-05-02', 3);


insert into profesores (codigo,nombre)
values  (1,'Esteban'),
  		(2, 'Luis'),
  		(3, 'María'),
  		(4, 'Ana'),
  		(5, 'Carlos'),
  		(6, 'Laura');
		
select est.nombre, apellido, pro.codigo from estudiantes est, profesores pro where est.codigo_profesor = pro.codigo and apellido like '%n%'
select * from estudiantes est, profesores prof where est.codigo_profesor = prof.codigo and prof.nombre = 'María'

select * from personas
select * from prestamo

INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos)
VALUES 
  ('1755014238', 'Juan', 'Rodriguez', 1.72, '2002-05-02', '16:00', 2500, 0),
  ('1755014239', 'Maria', 'Gonzalez', 1.65, '1995-08-10', '10:30', 3200, 1),
  ('1755014240', 'Pedro', 'Martinez', 1.80, '1990-03-15', '08:45', 5000, 2),
  ('1755014241', 'Ana', 'Lopez', 1.70, '1988-11-20', '14:20', 1500, 3),
  ('1755014242', 'Luis', 'Perez', 1.75, '1999-06-25', '18:00', 4000, 2),
  ('1755014243', 'Laura', 'Sanchez', 1.60, '1992-09-30', '12:00', 2800, 1),
  ('1755014244', 'Carlos', 'Fernandez', 1.78, '1996-12-05', '09:15', 3700, 0),
  ('1755014245', 'Sofia', 'Ramirez', 1.67, '1985-04-10', '11:45', 6000, 2),
  ('1755014246', 'Daniel', 'Hernandez', 1.83, '1993-07-15', '17:30', 4800, 1),
  ('1755014247', 'Julia', 'Gomez', 1.68, '2000-02-20', '15:10', 2000, 4);

INSERT INTO prestamo (cedula, monto, fecha_prestamo, hora_prestamo, garante)
VALUES 
    ('1755014238', '600', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014239', '550', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014240', '580', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014241', '570', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014242', '590', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014243', '520', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014244', '560', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014245', '530', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014246', '580', '2024/02/02', '13:30', 'Francisco Robles'),
    ('1755014247', '540', '2024/02/02', '13:30', 'Francisco Robles');


select monto, cantidad_ahorrada, garante from personas perso, prestamo pres where perso.cedula = pres.cedula
and monto between '500' and '590'

select * from personas where nombre = 'Juan'

select * from productos
select * from ventas

insert into ventas (id_venta,codigo_producto,fecha_venta,cantida)
values 	(2,1,'2024/02/15',3),
		(3,3,'2024/02/11',3),
		(4,15,'2023/02/15',13),
		(5,8,'2023/02/12',9),
		(6,4,'2023/03/19',7);


select nombre,stock, ven.cantida from productos pro, ventas ven where pro.codigo = ven.codigo_producto and nombre like '%m%' or descripcion is null

select nombre, stock from productos pro, ventas ven where pro.codigo = ven.codigo_producto and ven.codigo_producto >= 5


-- Transacciones y Banco
select * from transacciones
select * from banco

insert into banco (codigo_banco, codigo_transaccion,detalle)
values 	(1,32165,'Transaccion Internacional'),
		(2,78542,'Transaccion de 800$'),
		(3,23210,'Transaccion de 100$'),
		(4,35412,'Transaccion de 1000$'),
		(5,54193,'Transaccion de 800$'),
		(6,95124,'Transaccion de 100$'),
		(7,54143,'Transaccion de 1000$');
		
select * from transacciones tran, banco bn where tran.codigo = bn.codigo_transaccion and tran.numero_cuenta between 22001 and 22004
select * from transacciones tran, banco bn where tran.codigo = bn.codigo_transaccion and bn.codigo_banco = 1


select * from videojuegos
select * from plataformas

insert into plataformas (id_plataforma,nombre_plataforma,codigo_videojuego)
values	(2,'Epic Games',1),
		(3,'EA Sports',93475),
		(4,'Origin',70215);
-- VideoJuegos
select nombre,descripcion, valoracion, pl.nombre_plataforma from videojuegos vid, plataformas pl where vid.codigo = pl.codigo_videojuego and valoracion > 7 and nombre like 'C%'
select * from plataformas, videojuegos where plataformas.codigo_videojuego = videojuegos.codigo and videojuegos.nombre = 'God of Ward'
-- Entrada y Empleado
delete from registros_entrada
select * from registros_entrada
select * from empleado

INSERT INTO empleado (codigo_empleado, nombre, fecha, hora) VALUES
(2, 'María', '2024/05/24', '09:30'),
(3, 'Pedro', '2024/05/25', '14:45'),
(4, 'Ana', '2024/05/26', '11:15'),
(5, 'Luis', '2024/05/27', '08:00'),
(6, 'Laura', '2024/05/28', '10:20'),
(7, 'Carlos', '2024/05/29', '13:10'),
(8, 'Sofía', '2024/05/30', '15:50'),
(9, 'Pablo', '2024/05/31', '12:25'),
(10, 'Elena', '2024/06/01', '17:30'),
(11, 'Martín', '2024/06/02', '19:00');

insert into registros_entrada(codigo_registro,cedula_empleado,fecha,hota,codigo_empleado)
values  (1,'1755014238','2024/05/31','13:00',2),
		(2, '1755014239', '2024/06/01', '09:30', 3),
		(3, '1755014240', '2024/06/02', '14:45', 4),
		(4, '1755014241', '2024/06/03', '11:15', 5),
		(5, '1755014242', '2024/06/04', '08:00', 6),
		(6, '1755014243', '2024/06/05', '10:20', 7),
		(7, '1755014244', '2024/06/06', '13:10', 8),
		(8, '1755014245', '2024/06/07', '15:50', 9),
		(9, '1755014246', '2024/06/08', '12:25', 10),
		(10, '1755014247', '2024/06/09', '17:30', 11);

select reg.cedula_empleado, reg.fecha, em.nombre from empleado em, registros_entrada reg where em.codigo_empleado = reg.codigo_empleado
AND reg.fecha between '2024/06/01' and '2024/06/09' 
OR reg.cedula_empleado like '17%' and hota between '08:00' and '12:00'

select * from empleado,registros_entrada where empleado.codigo_empleado = registros_entrada.codigo_empleado and registros_entrada.cedula_empleado = '1755014238'



