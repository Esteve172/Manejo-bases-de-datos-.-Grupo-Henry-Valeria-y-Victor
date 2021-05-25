import psycopg2

class Connection:
    
    def __init__(self):
        self.connection = None
    
    def openConnection(self):
        try:
            self.connection = psycopg2.connect(user="postgres",
                                               password="Colombia08", #su contraseña aca
                                               database="Proyecto Bases",
                                               host="localhost", 
                                               port="5432")
        except Exception as e:
            print (e)

    def closeConnection(self):
        self.connection.close()
