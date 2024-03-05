--Obtener el precio mínimo, precio máximo y precio promedio de todos los productos.
select nombre, max(precio_unitario) as "precio maximo", min(precio_unitario) as "precio minimo", avg(precio_unitario) as "precio promedio"
from producto
group by nombre

--Calcular la cantidad total de productos en stock por sucursal.
select sucursal_id, sum(total) as "total productos stock"
from stock
group by sucursal_id
order by sucursal_id asc

--Obtener el total de ventas por cliente.
select cliente_id, sum(total) as "total  ventas"
from orden
group by cliente_id
order by cliente_id asc
