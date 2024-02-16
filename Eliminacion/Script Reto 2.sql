drop table productos
create table productos (
	codigo int not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)

insert into productos (codigo,nombre,descripcion,precio,stock)
values 	(1,'Celular Redmi Not 10 s','Potente celular','200.50','2'),
		(2,'Celular Xiaomi 11t','Potente celular','240.50','4'),
		(3,'Celular Samsung s23','Potente celular','500.50','3'),
		(4,'Celular Iphone 13','Potente celular','650.50','1'),
		(5,'Tablet Ipad Mini 6','Potente tablet','450.50','2')
select * from productos
insert into productos (codigo,nombre,precio,stock)
values 	(6,'Celular IPhone 14',250.50,4)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values 	('00001','17552','07/02/2024',1500),
		('00002','11234','08/02/2024',2500),
		('00003','18989','09/02/2024',3500),
		('00004','02930','10/02/2024',4500),
		('00005','08292','11/02/2024',5500),
		('00006','11111','12/02/2024',6500),
		('00007','17550','13/02/2024',7500),
		('00008','17550','14/02/2024',8500),
		('00009','17550','15/02/2024',9500),
		('00010','17550','16/02/2024',11500)
select * from cuentas

insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values 	('1755014238','Juan','Lopez','juandiegojd252@gmail.com','07/02/2024'),
		('1755014239','Diego','Cordova','juandiegojd252@gmail.com','07/02/2024'),
		('1755014237','Julian','Aguinaga','juandiegojd252@gmail.com','07/02/2024'),
		('1755014236','Dixon','Villegas','juandiegojd252@gmail.com','07/02/2024'),
		('1755014235','Leo','Saldarriaga','juandiegojd252@gmail.com','07/02/2024'),
		('1755014234','Jonathan','Macias','juandiegojd252@gmail.com','07/02/2024'),
		('1755014233','Fabi','Erazo','juandiegojd252@gmail.com','07/02/2024'),
		('1755014232','Antonio','Caicedo','juandiegojd252@gmail.com','07/02/2024')
select * from estudiantes

insert into registros_entrada (codigo_registro,cedula_empleado,fecha,hota)
values 	(1,'1755014238','07/02/2024','11:43'),
		(2,'1755014238','07/02/2024','11:43'),
		(3,'1755014238','07/02/2024','11:43'),
		(4,'1755014238','07/02/2024','11:43'),
		(5,'1755014238','07/02/2024','11:43'),
		(6,'1755014238','07/02/2024','11:43'),
		(7,'1755014238','07/02/2024','11:43'),
		(8,'1755014238','07/02/2024','11:43'),
		(9,'1755014238','07/02/2024','11:43'),
		(10,'1755014238','07/02/2024','11:43')
select * from registros_entrada
insert into videojuegos (codigo,nombre,descripcion,valoracion)
values  (1,'GTA V','Juego de Mundo abierto',90),
		(2,'FIFA 24','Juego de Deportes',80 ),
		(3,'Outlast 2','Juego de terror',90),
		(4,'Gang Beast','Rol Play',90),
		(5,'Forza Motor Sport','Juego de Carreras',90)
insert into videojuegos (codigo,nombre,valoracion)
values  (6,'Spiderman 2',90),
		(7,'Wolverine 2',90),
		(8,'TomClancy',70)
select * from videojuegos
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
insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values  (2,'00002',350,'C','07/02/2024','10:54'),
		(3,'00003',400,'C','06/02/2024','10:54'),
		(4,'00004',153,'C','04/02/2024','10:54'),
		(5,'00005',300,'C','02/02/2024','10:54'),
		(6,'00006',350,'C','01/02/2024','10:54'),
		(7,'00007',115,'C','13/02/2024','10:54'),
		(8,'00008',90,'C','12/02/2024','10:54'),
		(9,'00009',25,'C','17/02/2024','10:54'),
		(10,'00010',12,'C','27/02/2024','10:54')
select * from transacciones
create table transacciones (
	codigo int not null,
	numero_cuenta varchar(5) not null,
	monto money not null,
	tipo varchar(1) not null,
	fecha date not null,
	hora time not null,
	constraint transacciones_pk primary key (codigo)
)
select * from productos
update productos set stock = 0 where descripcion is null
select * from cuentas
update cuentas set saldo = 10 where cedula_propietario like '17%'
select * from estudiantes 
update estudiantes set apellido = 'Hernandez' where cedula like '17%'
select * from registros_entrada
update registros_entrada set cedula_empleado = '082345679' where fecha = '2024-02-07'
select * from videojuegos
update videojuegos set descripcion = 'Mejor Puntuado' where valoracion > 80
select * from transacciones
update transacciones set tipo = 'T' where monto > '100' and monto < '500' 
and fecha = '2024-02-24' 
and hora = '10:54:00'
select * from estudiantes
select * from productos
delete from productos where descripcion is nul
delete from cuentas where cedula_propietario like '11%'
delete from estudiantes where cedula like '%%5'
select * from registros_entrada
delete from registros_entrada where fecha = '2024/02/07'
select * from videojuegos
delete from videojuegos where valoracion < 80
select * from transacciones
delete from transacciones where fecha between '2024/02/13' and '2024/02/17'