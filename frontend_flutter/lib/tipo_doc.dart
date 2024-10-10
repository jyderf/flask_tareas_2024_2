class TipoDoc {
  final BigInt idtipo_doc;
  final String tipo_doc;

  TipoDoc({
    required this.idtipo_doc,
    required this.tipo_doc,
  });

  factory TipoDoc.fromJson(Map<String, dynamic> json) {
    return TipoDoc(
      idtipo_doc: BigInt.parse(json['idtipo_doc'].toString()),
      tipo_doc: json['tipo_doc'],
    );
  }
}
