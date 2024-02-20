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
select * from ventas
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

 








