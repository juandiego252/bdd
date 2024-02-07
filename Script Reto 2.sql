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