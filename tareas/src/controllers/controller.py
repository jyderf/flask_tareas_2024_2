from flask import Flask, jsonify, Blueprint
from src.models.model import Documento,gestor_bd
from src.connect_db.db import configurar_conexion


aplicacion = Flask(__name__, template_folder="../views/templates") 
gestor_bd = configurar_conexion(aplicacion)

@aplicacion.route('/')
def index():
    data = Documento.leer_documento()  
    return jsonify(data) 

 
if __name__ == '__main__':
    aplicacion.run(debug=True)

 