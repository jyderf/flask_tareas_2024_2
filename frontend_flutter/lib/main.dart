import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
/**PARA QUE SE HABILITE EN CONSOLA flutter "pub get" **/
import 'tipo_doc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TipoDoc> tipo_doc = [];
  //List<Map<String, dynamic>> tipo_doc = [];
  @override
  void initState() {
    super.initState();
    _CargarTipoDoc();
  }

  Future<void> _CargarTipoDoc() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/leer_tipo_doc'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      setState(() {
        tipo_doc = list.map((model) => TipoDoc.fromJson(model)).toList();
      });
    } else {
      throw Exception('Error al cargar tipo_doc');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo Doc desde Flask'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              Text("idtipo_doc"),
              Text("tipo_doc"),
            ]), //FIN TABLEROW

            for (int i = 0; i < tipo_doc.length; i++)
              TableRow(children: [
                Text(" ${tipo_doc[i].idtipo_doc}"),
                Text(" ${tipo_doc[i].tipo_doc}"),
              ]) //FIN TABLEROW
          ],
        ), //FIN TABLE
      ), //FIN PADDING
    ); //FIN SCAFFOLD
  }
}
