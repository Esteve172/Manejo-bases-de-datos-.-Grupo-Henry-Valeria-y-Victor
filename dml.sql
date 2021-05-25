--carga masiva--
COPY area(nombre) FROM 'C:\datos_proyecto\area_tr.csv' with delimiter ';' csv header;
select * from area;

COPY regimen(id_regimen, "regimen", "id_area_area") 
FROM 'C:\datos_proyecto\regimen_tr.csv' with delimiter ';' csv header;
select * from regimen;

COPY lugar_de_parto("inst_salud", "domicilio", "otro", "sin_informacion", total, "ano", "id_regimen_regimen", "id_area_area_regimen") 
FROM 'C:\datos_proyecto\lugar_parto_tr.csv'with delimiter ';' csv header;
select * from lugar_de_parto;

COPY tipo_de_parto("cesarea", "espontaneo", "instrumentado", "sin_informacion", "total", "ano", "id_regimen_regimen", "id_area_area_regimen") 
FROM 'C:\datos_proyecto\tipo_parto_tr.csv' with delimiter ';' csv header;
select * from tipo_de_parto;
