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
--CUENTAS
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25569,17504,'15/01/2030',500);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25570,17500,'01/11/2028',600);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25571,17501,'22/01/2023',700);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25572,17508,'30/05/2022',800);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25573,17509,'15/03/2023',900);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25574,17510,'15/05/2023',1000);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25575,17507,'15/09/2023',1500);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25576,17515,'15/10/2024',2500);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25577,17512,'15/08/2025',3500);
insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values (25578,17503,'15/06/2017',4500);

--ESTUDIANTES
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1235476801,'Raul','Martínez','raumart01@gmail.com','04/02/2003');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1735476802,'Mario','Guaman','MarioG25@gmail.com', '08/12/2000');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1235476803,'Roberto','Quishpe','RobQuishpe64@gmail.com','29/06/2005');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1735476804,'Paul','Noguera','PaulNog55@gmail.com','22/07/2002');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1235476805,'Marcelo','Ramos','MarceloR72@gmail.com','15/08/2008');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1735476806,'Anthony','Agual','KAgual22@gmail.com','25/03/2002');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1235476807,'Paula','Celi','PauCeli31@gmail.com','30/09/2010' );
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1735476808,'Mónica','Martínez','MoniMar15@gmail.com','22/01/2001');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1235476809,'Anabel','Perlaza','WPerlaza18@gmail.com','12/04/2000');
insert into estudiantes (cedula,nombre,apellido,email,fecha_nacimiento)
values (1735476810,'Sofía','Jimenez','SofiJz22@gmail.com','22/01/2001');

select * from productos
--PRODUCTOS
insert into productos(codigo,nombre,descripcion,precio,stock) 
values (6,'Jabón','Lava todo',3.50,10);
insert into productos(codigo,nombre,descripcion,precio,stock) 
values (7,'Shampoo','Savital',2.50,20);
insert into productos(codigo,nombre,descripcion,precio,stock) 
values (8,'Deja','Deja',1.50,30);
insert into productos(codigo,nombre,descripcion,precio,stock) 
values (9,'Pasta dental','Fortident',3.0,40);
insert into productos(codigo,nombre,descripcion,precio,stock) 
values (10,'Cera','Cera de piso',2.50,50);
insert into productos(codigo,nombre,precio,stock) 
values (11,'Pan',1.50,50);
insert into productos(codigo,nombre,precio,stock) 
values (12,'Queso',5.50,60);
insert into productos(codigo,nombre,precio,stock)
values (13,'Leche',2.50,70);
insert into productos(codigo,nombre,precio,stock)
values (14,'Jamon',1.00,120);
insert into productos(codigo,nombre,precio,stock)
values (15,'Coca Cola',3.50,300);

--REGISTROS_ENTRADA
insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12345, '1754416489', '18/06/2023', '7:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12355, '1758254591', '03/08/2023', '14:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12346, '1715974492', '25/03/2022', '23:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12347, '1735642583', '28/12/2015', '16:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12389, '1707416984', '16/07/2012', '8:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12349, '1778541235', '17/03/2013', '10:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12310, '1742158637', '14/05/2017', '19:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12311, '1756321784', '15/05/2004', '20:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12358, '1712546328', '07/07/2008', '21:00');

insert into registros_entrada(codigo_registro, cedula_empleado, fecha, hota)
values(12378, '1725785413', '02/09/2023', '4:00');

--TRANSACCIONES
insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(78945, '75369', 200, 'C', '20/09/2023', '23:30');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(53147, '32102', 500.65, 'D', '15/06/2022', '17:55');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(32548, '21001', 1600, 'C', '17/05/2021', '16:37');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(32165, '51437', 1050, 'D', '25/04/2020', '15:48');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(78542, '02147', 300, 'D', '20/03/2019', '22:19');

insert into transacciones(codigo, numero_cuenta, monto, tipo,fecha, hora)
values(23210, '32015', 400, 'C', '20/04/2017','13:55');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(35412, '85214', 600, 'D', '07/12/2015', '20:14');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(54193, '96325', 800, 'D', '06/11/2012', '11:00');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(95124, '74125', 900, 'D', '23/10/2002', '9:00');

insert into transacciones(codigo, numero_cuenta, monto, tipo, fecha, hora)
values(54143, '85213', 2000, 'C', '11/09/1999', '7:30');

--VIDEOJUEGOS
insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(07563, 'Call of Duty', 'juego de terror', 9);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(85421, 'Free Fire', 'juego de accion', 7);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(93475, 'Call of Clans', 'juego de terror', 10);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(15983, 'Fornite', 'juego de suspenso', 10);

insert into videojuegos(codigo, nombre, valoracion)
values(35784, 'Minecraft', 3);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(54682, 'Tom and Jerry', 'juego de comedia', 8);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(01456, 'Ajedres', 'juego de psicoligia', 6);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(70215, 'God of Ward', 'juego de aprendisaje', 7);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(63240, 'Crash', 'juego de deprote', 9);

insert into videojuegos(codigo, nombre, descripcion, valoracion)
values(63549, 'Dragon Ball', 'juego de baile', 8);

select * from videojuegos
select * from productos

-- Productos con stock igual a 10 y precio menor a 10
select * from productos where stock = 10 and precio < '10'
-- Productos con una m en su nombre y espacio en blanco en su descripcion
select nombre, stock, descripcion from productos where nombre like '%m%' and descripcion like '% %'
-- Productos que tengan null el campo de descripcion o tenga un stock de 0
select nombre from productos where descripcion is null or stock = 0


-- Cuentas
select * from cuentas
select numero_cuenta, saldo from cuentas where saldo > '100' and saldo < '1000'
select * from cuentas where fecha_creacion between '2023/02/19' and '2024/02/19' 
select * from cuentas where saldo = '0' OR cedula_propietario like '%2'
-- Estudiantes
select nombre,apellido from estudiantes where nombre like 'M%' or apellido like '%z'
select * from estudiantes where cedula like '%32%' and cedula like '18%'
select nombre from estudiantes where cedula like '%%06' or cedula like '17%'
-- Registros Entradas
select * from registros_entrada
select * from registros_entrada where fecha >= '2023/09/01' and fecha < '2023/10/01' OR cedula_empleado like '17%'
select * from registros_entrada where fecha >= '2023/08/01' and fecha < '2023/09/01' AND cedula_empleado like '17%' AND hota >= '08:00' and hota <= '14:00'
select * from registros_entrada where fecha >= '2023/08/01' and fecha < '2023/09/01' AND cedula_empleado like '17%' AND hota >= '08:00' and hota <= '14:00'
OR cedula_empleado like '08' and fecha >= '2023/08/01' and fecha < '2023/09/01' AND hota >= '09:00' and hota <= '13:00'
-- VideoJuegos
select * from videojuegos where nombre like 'C%%' OR valoracion = 7
select * from videojuegos where codigo >= 3 and codigo <= 7 OR valoracion = 7
select * from videojuegos where descripcion = 'Juego de terror' and valoracion >= 7 and nombre like 'C%%' OR valoracion > 8 and nombre like 'D%%'
-- Transacciones
select * from transacciones
select * from transacciones where tipo = 'C' and numero_cuenta between '22004'  and  '222001'
select * from transacciones where tipo = 'D' and fecha >= '2023/05/01' and fecha <= '2023/05/25' and numero_cuenta between '22007' and '22010'
select * from transacciones where codigo >= '1' and codigo <= '5' and numero_cuenta between '22002' and '22004' and fecha between '2023/0/26' and '2023/05/29'






