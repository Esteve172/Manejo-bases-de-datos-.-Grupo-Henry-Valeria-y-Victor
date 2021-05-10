import psycopg2

try:
    conexion = psycopg2.connect(user = "postgres",
                                password = "Colombia08",
                                database = "Proyecto 2",
                                host = "localhost",
                                port = "5432")
    print("¡Conexión exitosa!")

    
    sql1 = """ SELECT *
               FROM area;
            """

    sql2 = """ SELECT *
                FROM regimen;
            """

    sql3 = """ SELECT *
                FROM tipo_de_parto
                WHERE "id_regimen_Regimen" = %s;"""

    sql4 = """ SELECT *
                FROM lugar_de_parto
                WHERE "id_area_Area_Regimen" = %s;"""

    sql5 = """ SELECT *
                FROM tipo_de_parto
                WHERE "Ano" = %s;"""

#consultas de las areas
    cursor = conexion.cursor()
    cursor.execute(sql1)
    area = cursor.fetchall()
    print("*** AREAS ***")
    for area in area:
        print("CODE = ", area[0])
        print("AREA = ", area[1], "\n")

#consultas de los regimenes
    cursor = conexion.cursor()
    cursor.execute(sql2)
    regimen = cursor.fetchall()
    print("*** REGIMEN ***")
    for regimen in regimen:
        print("CODE = ", regimen[0])
        print("REGIMEN = ",regimen[1])
        print("id_area = ", regimen[2], "\n")

#consultas de la cantidad de partos por tipo realizados que sean Subsidiados
#Notese que se puede cambiar "sub" en el sql3 y en esta parte del codigo por cualquiera de los regimenes.
    parametro = ('sub',) #tupla
    cursor.execute(sql3, parametro)
    tipo_de_partos = cursor.fetchall()
    print("*** PARTOS SUB ***")
    for tipo_de_parto in tipo_de_partos:
        print("CESAREA = ", tipo_de_parto[1])
        print("ESPONTANEO = ", tipo_de_parto[2])
        print("INSTRUMENTADO = ", tipo_de_parto[3])
        print("SIN_INFORMACION = ", tipo_de_parto[4])
        print("ANIO = ", tipo_de_parto[6])
        print("id_regimen_Regimen = ", tipo_de_parto[7], "\n")

#consultas de la cantidad de partos por Area
#Notese que se puede cambiar "8" en el sql4 y en esta parte del codigo por cualquiera de los otros id de las Areas.
    parametro = ('8',) #tupla
    cursor.execute(sql4, parametro)
    lugar_de_partos = cursor.fetchall()
    print("*** PARTOS POR AREA ***")
    for lugar_de_parto in lugar_de_partos:
        print("NACIMIENTOS = ", lugar_de_parto[5])
        print("id_area = ", lugar_de_parto[7], "\n")

#consultas de la cantidad de partos por tipo realizados por Anio
#Notese que se puede cambiar "2008" en el sql5 y en esta parte del codigo por cualquiera de los otros años.
    parametro = ('2008',) #tupla
    cursor.execute(sql5, parametro)
    tipo_de_partos = cursor.fetchall()
    print("*** PARTOS POR AÑO ***")
    for tipo_de_parto in tipo_de_partos:
        print("CESAREA = ", tipo_de_parto[1])
        print("ESPONTANEO = ", tipo_de_parto[2])
        print("INSTRUMENTADO = ", tipo_de_parto[3])
        print("SIN_INFORMACION = ", tipo_de_parto[4])
        print("ANIO = ", tipo_de_parto[6], "\n")


except psycopg2.Error as e:
    print("Error en las consultas:", e)

finally:
    cursor.close()
    conexion.close()
    print("¡Conexión cerrada!")

