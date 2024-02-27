select * from cuentas
select AVG(cast(saldo as numeric)) as saldo_promedio from cuentas where cedula_propietario = '12345'

select * from transacciones
select tipo ,count(*)as  totalcuentas from transacciones group by tipo

select * from clientes
select * from compras
insert into compras (id_compra,cedula,fecha_compra,monto)
values  (2,'1755012222','27/02/2024','67000'),
		(4,'1755014238','28/03/2023','5600'),
		(3,'1755014211','02/03/2023','569');

select cedula,SUM(monto) as monto_total_compras from compras
group by cedula

select fecha_compra, count(*) as total_compras from compras where fecha_compra = '2023/03/28' group by fecha_compra

select * from estudiantes
select * from profesores

select profesores.codigo, count(*) as total_estudiantes from estudiantes, profesores where estudiantes.codigo_profesor = profesores.codigo
group by profesores.codigo

select ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_nacimiento))) AS edad_promedio from estudiantes

select * from personas
select * from prestamo

select personas.cedula, SUM(monto) from prestamo, personas where prestamo.cedula = personas.cedula 
group by personas.cedula

select * from personas
select count(*) as total_personas from personas where numero_hijos > 0

select * from productos
select * from ventas

select MAX(precio) from productos
select SUM(precio) from productos, ventas where productos.codigo = ventas.codigo_producto

select * from transacciones
select * from banco

select COUNT(codigo) as total_transacciones_credito from transacciones where tipo like 'C'

select numero_cuenta,ROUND(AVG(CAST(monto as decimal)),2) as monto_promedio from transacciones group by numero_cuenta

select * from videojuegos
select * from plataformas

select videojuegos.codigo,count(*) from videojuegos, plataformas where videojuegos.codigo = plataformas.id_plataforma group by videojuegos.codigo

select ROUND(AVG(valoracion),2) AS promedio_valoracion from videojuegos

select * from registros_entrada
select * from empleado

select registros_entrada.cedula_empleado,COUNT(codigo_registro) as total_registros_entrada from registros_entrada group by registros_entrada.cedula_empleado

select MIN(fecha) as fecha_minima,MAX(fecha) as fecha_maxima from registros_entrada