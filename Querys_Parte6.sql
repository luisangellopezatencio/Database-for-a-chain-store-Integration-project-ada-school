--Calcular el precio promedio de los productos en cada categoría
select c.nombre as categoria, avg(p.precio_unitario) as precio_promedio
from categoria c
inner join producto p on c.id = p.categoria_id
group by c.nombre

--Obtener la cantidad total de productos en stock por categoría
select c.nombre as categoria, sum(s.total) as total_en_stock
from categoria c
inner join producto p on c.id = p.categoria_id
inner join stock s on s.producto_id = p.id
group by c.nombre

--Calcular el total de ventas por sucursal
select s.nombre as sucursal, sum(o.total) as ventas_totales
from orden o
inner join sucursal s on o.sucursal_id = s.id
group by s.nombre
order by ventas_totales desc

--Obtener el cliente que ha realizado el mayor monto de compras
select c.nombre as cliente, sum(o.total) as monto_total
from orden o
inner join cliente c on o.cliente_id = c.id
group by c.nombre
order by monto_total desc

