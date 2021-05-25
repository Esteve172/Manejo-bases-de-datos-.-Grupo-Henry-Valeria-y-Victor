def totalPartosByAnio():
    return """SELECT ano as año, SUM(total) AS total_partos 
    FROM lugar_de_parto
    GROUP BY ano
    ORDER BY ano;"""
def totalPartosByArea():
    return """SELECT a.nombre, sum(total) as total_partos
    from tipo_de_parto as t inner join area as a
    on a.id_area = t.id_area_area_regimen
    GROUP BY a.nombre
    ORDER BY a.nombre;"""
def totalPartosByRegimen():
    return"""SELECT r.regimen, sum(t.total) as total_partos
    FROM tipo_de_parto as t INNER JOIN regimen as r
    ON r.id_regimen = t.id_regimen_regimen
    GROUP BY r.regimen;"""
def totalPartosByNatural():
    return"""SELECT ano as año, SUM(espontaneo) AS total_espontaneos
    FROM tipo_de_parto
    GROUP BY ano
    ORDER BY ano;"""


