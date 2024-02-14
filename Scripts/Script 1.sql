drop table personas
create table personas (
	cedula varchar(10),
	nombre varchar(50),
	apellido varchar(50),
	estatura numeric,
	fecha_nacimiento date,
	hora_nacimiento time,
	constraint personas_pk primary key (cedula)
)

select * from personas
INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento) 
VALUES 
    ('1234567890', 'Juan', 'Perez', 1.75, '1990/05/15', '08:30:00'),
    ('2345678901', 'Maria', 'Lopez', 1.65, '1985/10/20', '12:15:00'),
    ('3456789012', 'Carlos', 'Gonzalez', 1.80, '1995/03/10', '15:45:00'),
    ('4567890123', 'Ana', 'Martinez', 1.70, '1992/07/05', '10:00:00'),
    ('5678901234', 'Pedro', 'Sanchez', 1.85, '1988/12/30', '18:20:00'),
    ('6789012345', 'Laura', 'Ramirez', 1.60, '1997/09/25', '14:00:00'),
    ('7890123456', 'Diego', 'Torres', 1.78, '1983/04/12', '09:45:00'),
    ('8901234567', 'Sofia', 'Diaz', 1.67, '1993/11/18', '16:30:00'),
    ('9012345678', 'Gabriel', 'Lopez', 1.75, '1991/02/22', '11:10:00'),
    ('0123456789', 'Luisa', 'Garcia', 1.68, '1996/08/07', '17:00:00');
