
--total de partos segun el año
SELECT ano as año, SUM(total) AS total_partos 
FROM lugar_de_parto
GROUP BY ano
ORDER BY ano; 

SELECT ano as año, SUM(total) AS total_partos 
FROM tipo_de_parto
GROUP BY ano
ORDER BY ano; 

--2008 segun su tipo de parto y ligar de parto
select l.inst_salud, l.domicilio, l.otro, l.sin_informacion, t.cesarea, t.espontaneo, t.instrumentado, t.sin_informacion
from lugar_de_parto as l inner join tipo_de_parto as t
on l.ano = t.ano
where l.ano = 2008;

--por areas segun tipo de parto
SELECT a.nombre, sum(t.cesarea) as total_cesarea, sum(t.espontaneo) as total_espontaneo, sum(t.instrumentado) total_instrumentado, sum(t.sin_informacion) as total_sin_informacion
from tipo_de_parto as t inner join area as a
on a.id_area = t.id_area_area_regimen
GROUP BY a.nombre
ORDER BY a.nombre;

--por area y total
SELECT a.nombre, sum(total) as total_partos
from tipo_de_parto as t inner join area as a
on a.id_area = t.id_area_area_regimen
GROUP BY a.nombre
ORDER BY a.nombre;

--regimen y total
SELECT r.regimen, sum(t.total) as total_partos
FROM tipo_de_parto as t INNER JOIN regimen as r
ON r.id_regimen = t.id_regimen_regimen
GROUP BY r.regimen;

--cantidad de tipos de partos en usaquen 
SELECT sum(l.inst_salud) as total_isnt_salud, sum(l.domicilio) as total_domicilio, sum(l.otro) total_otro, sum(l.sin_informacion) as total_sin_informacion
from lugar_de_parto as l inner join area as a
on a.id_area = l.id_area_area_regimen
where a.nombre = 'Usaquén';

--tipos de parto en total
SELECT sum(t.cesarea) as total_cesarea, sum(t.espontaneo) as total_espontaneo, sum(t.instrumentado) total_instrumentado, sum(t.sin_informacion) as total_sin_informacion
FROM tipo_de_parto as t
group by ;
--por regimen segun sitio de parto
SELECT r.nombre,sum()
from lugar_de_parto as l inner join regimen as r



--parto natural a traves de los años
SELECT ano as año, SUM(espontaneo) AS total_espontaneos
FROM tipo_de_parto
GROUP BY ano
ORDER BY ano; 



