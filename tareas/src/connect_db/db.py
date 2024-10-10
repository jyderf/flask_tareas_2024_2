
from flask_mysqldb import MySQL # type: ignore

def configurar_conexion(aplicacion):
    aplicacion.config['MYSQL_HOST'] = 'localhost'
    aplicacion.config['MYSQL_USER'] = 'root'
    aplicacion.config['MYSQL_PASSWORD'] = '123'
    aplicacion.config['MYSQL_DB'] = 'tareas'
    aplicacion.config['MYSQL_COMMIT_ON_TEARDOWN'] = True
    conectar_base= MySQL(aplicacion)
    return conectar_base