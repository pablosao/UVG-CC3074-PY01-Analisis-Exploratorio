import pandas as pd
#import pymssql
#from mssql_conf import read_db_config


#print(data.head(5))


def crea_fallecidos_lesionados(data):
    print("Creando Datos Fallecidos y Lesionados")
    f=open("query_fallecidos-lesionados.sql", "a+")
    for i,row in data.iterrows():
        query = 'INSERT INTO [dbo].[fallecidos_lesionados]([num_corre],[anio_ocu],[dia_ocu],[hora_ocu],[g_hora],[g_hora_5],[mes_ocu],[dia_sem_ocu],[mupio_ocu],[depto_ocu],[zona_ocu],[sexo_per],[edad_per],[g_edad_80ymas],[g_edad_60ymas],[edad_quinquenales],[mayor_menor],[tipo_veh],[marca_veh],[color_veh],[modelo_veh],[g_modelo_veh],[tipo_eve],[fall_les],[int_o_noint])VALUES('

        control = 0
        for j,column in row.iteritems():

            if(control < len(row)-1):
                query += '{0},'.format(column)
            else:
                query += '{0})'.format(column)
            control += 1

        # db_config = read_db_config()
        # conn = pymssql.connect(**db_config)
        # cur = conn.cursor()
        # cur.execute(query)
        #
        # conn.commit()
        # conn.close()

        f.write("{0}\n".format(query))
        print("Agregado dato...")

def crea_hechos_ransito(data):
    print("Creando Hechos Transito")

    f=open("query_hechos_transito.sql", "a+")
    for i,row in data.iterrows():
        query = 'INSERT INTO [dbo].[hechos_transito]([num_corre],[anio_ocu],[dia_ocu],[hora_ocu],[g_hora],[g_hora_5],[mes_ocu],[día_sem_ocu],[mupio_ocu],[depto_ocu],[zona_ocu],[tipo_veh],[marca_veh],[color_veh],[modelo_veh],[g_modelo_veh],[tipo_eve])VALUES('
        control = 0
        for j,column in row.iteritems():

            if(control < len(row)-1):
                query += '{0},'.format(column)
            else:
                query += '{0})'.format(column)
            control += 1

        # db_config = read_db_config()
        # conn = pymssql.connect(**db_config)
        # cur = conn.cursor()
        # cur.execute(query)
        #
        # conn.commit()
        # conn.close()

        f.write("{0}\n".format(query))
        print("Agregado dato...")

def crea_vehiculos(data):
    print("Creando Vehiculos Involucrados...")

    f=open("query_vehiculos_involucrados.sql", "a+")
    for i,row in data.iterrows():
        query = 'INSERT INTO [dbo].[vehiculos_involucrados]([num_corre],[anio_ocu],[dia_ocu],[hora_ocu],[g_hora],[g_hora_5],[mes_ocu],[día_sem_ocu],[mupio_ocu],[depto_ocu],[zona_ocu],[sexo_per],[edad_per],[g_edad_80ymás],[g_edad_60ymás],[edad_quinquenales],[estado_con],[mayor_menor],[tipo_veh],[marca_veh],[color_veh],[modelo_veh],[g_modelo_veh],[tipo_eve])VALUES('

        control = 0
        for j,column in row.iteritems():

            if(control < len(row)-1):
                query += '{0},'.format(column)
            else:
                query += '{0})'.format(column)
            control += 1

        # db_config = read_db_config()
        # conn = pymssql.connect(**db_config)
        # cur = conn.cursor()
        # cur.execute(query)
        #
        # conn.commit()
        # conn.close()

        f.write("{0}\n".format(query))
        print("Agregado dato...")

datos_fallecidos = pd.read_excel("Fallecidos_y_lesionados.xlsx")
crea_fallecidos_lesionados(datos_fallecidos)

datos_hechos = pd.read_excel("Hechos_de_transito.xlsx")
crea_hechos_ransito(datos_hechos)

datos_vehiculos = pd.read_excel("vehiculos_incolucrados.xlsx")
crea_vehiculos(datos_vehiculos)


