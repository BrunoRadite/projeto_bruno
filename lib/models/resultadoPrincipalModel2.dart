class ResultadosPrincipais {

  String? idResultado;
  String? nomeResultado;
  String? idObjetivoPai;
  List? donoResultado;

  ResultadosPrincipais(
      {required this.idResultado,
        required this.nomeResultado,
        required this.idObjetivoPai,
        required this.donoResultado,
        });

  ResultadosPrincipais.fromJson(Map<String, dynamic> json) {
    idResultado = json['idResultado'];
    nomeResultado = json['nomeResultado'];
    donoResultado = json['donoResultado'];
    idObjetivoPai = json['idObjetivoPai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idResultado'] = this.idResultado;
    data['nomeResultado'] = this.nomeResultado;
    data['donoResultado'] = this.donoResultado;
    data['idObjetivoPai'] = this.idObjetivoPai;

    return data;
  }
}