import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.express as px
import pandas as pd
from Connection import Connection
import ProyectoSQL as sql

external_stylesheets = ["https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"]

# Inicializacion app dash
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

# Partos por año
con = Connection()
con.openConnection()
query = pd.read_sql_query(sql.totalPartosByAnio(), con.connection)
con.closeConnection()
dfCases = pd.DataFrame(query, columns=["id_parto","año", "total_partos"])

# Grafico Lineas
figBarCases = px.line(dfCases, x="año", y="total_partos", title='Partos a lo largo de los años')

# Partos por area
con.openConnection()
query = pd.read_sql_query(sql.totalPartosByArea(), con.connection)
con.closeConnection()
dfCases = pd.DataFrame(query, columns=["id_parto", "nombre", "total_partos"])

             
# Grafico barras 
figBarCases1 = px.bar(dfCases.head(25),  x="nombre", y="total_partos",
                     title='Total de partos clasificados por areas de Bogota')


#Partos por Regimen
con.openConnection()
query = pd.read_sql_query(sql.totalPartosByRegimen(), con.connection)
con.closeConnection()
dfCases = pd.DataFrame(query, columns=["regimen", "total_partos"])

#Grafico pie
figPiePartorRegimen = px.pie(dfCases.head(25), values="total_partos", names="regimen",
                     title='Total de partos clasificados por regimen')

# Partos espontaneos
con = Connection()
con.openConnection()
query = pd.read_sql_query(sql.totalPartosByNatural(), con.connection)
con.closeConnection()
dfCases = pd.DataFrame(query, columns=["id_parto","año", "total_espontaneos"])

# Grafico Lineas
figBarCases2 = px.line(dfCases, x="año", y="total_espontaneos", title='Partos espontaneos a lo largo de los años')




# Layout 
app.layout = html.Div(children=[
    html.H1(children='Dashboard Lugar y tipo de Partos '),
    html.H2(children='Partos por año'),
    dcc.Graph(
        id='barPartosByAnio',
        figure=figBarCases
    ),
    html.H3(children='Partos por Area'),
    dcc.Graph(
        id='barPartosByArea',
        figure= figBarCases1
    ),
    html.H4(children='Partos por Regimen'),
    dcc.Graph(
        id='PiePartorRegimen',
        figure= figPiePartorRegimen
    ), 
    html.H5(children='Partos espontaneos'),
    dcc.Graph(
        id='PartosByNatural',
        figure=figBarCases2
    ),
])

if __name__ == '__main__':
    app.run_server(debug=True)
