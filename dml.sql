--carga masiva--
COPY area(nombre) FROM 'C:\datos_proyecto\area_tr.csv' with delimiter ';' csv header;
select * from area;

COPY regimen(id_regimen, "Regimen", "id_area_Area") 
FROM 'C:\datos_proyecto\regimen_tr.csv' with delimiter ';' csv header;
select * from regimen;

COPY lugar_de_parto("Inst_salud", "Domicilio", "Otro", "Sin_informacion", total, "Ano", "id_regimen_Regimen", "id_area_Area_Regimen") 
FROM 'C:\datos_proyecto\lugar_parto_tr.csv'with delimiter ';' csv header;
select * from lugar_de_parto;

COPY tipo_de_parto("Cesarea", "Espontaneo", "Instrumentado", "Sin_informacion", "Total", "Ano", "id_regimen_Regimen", "id_area_Area_Regimen") 
FROM 'C:\datos_proyecto\tipo_parto_tr.csv' with delimiter ';' csv header;
select * from tipo_de_parto;
