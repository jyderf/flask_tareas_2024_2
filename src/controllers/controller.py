from flask import Flask, jsonify  #, Blueprint
from flask import request # Principalmente para interactuar con APIS externas 
from src.models.model import Documento,gestor_bd
from src.connect_db.db import configurar_conexion
from flask_cors import CORS #IMPORTAR DE ÚLTIMO PARA PREPARAR LA API A CONSUMIRSE


aplicacion = Flask(__name__, template_folder="../views/templates") 
CORS(aplicacion) #CODIFICACIÓN ÚLTIMA PREPARANDO LA API A CONSUMIRSE
gestor_bd = configurar_conexion(aplicacion)

@aplicacion.route('/',methods=['GET'])
def index():
    data = Documento.leer_documento()  
    data_formato_json = [{"idtipo_doc": item[0], "tipo_doc": item[1]} for item in data]
    return jsonify(data_formato_json)

    #SE DEBE INSTALAR CORS PARA PERMITIR QUE LA API SEA CONSUMIDA POR FLUTTER U OTRO CLIENTE
    #PARA ELLO DAMOS EN CONSOLA pip install flask-cors


 
if __name__ == '__main__':
    aplicacion.run(debug=True)

 