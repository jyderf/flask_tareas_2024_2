from flask import Flask, jsonify
from src.connect_db.db import configurar_conexion

aplicacion = Flask(__name__, template_folder="../views/templates") 
gestor_bd = configurar_conexion(aplicacion)

class Documento:
    @staticmethod
    def leer_documento():
        respuesta = gestor_bd.connection.cursor()
        respuesta.execute("SELECT * FROM tipo_doc")
        data = respuesta.fetchall()
        respuesta.close()
        return data



