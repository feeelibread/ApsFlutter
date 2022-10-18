class SensorData {
  int? co2;
  int? tvoc;
  double? temperatura;
  int? umidade;
  String? erros;

  SensorData({this.co2, this.tvoc, this.temperatura, this.umidade, this.erros});

  SensorData.fromJson(Map<String, dynamic> json) {
    co2 = json['co2'];
    tvoc = json['tvoc'];
    temperatura = json['temperatura'];
    umidade = json['umidade'];
    erros = json['erros'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co2'] = this.co2;
    data['tvoc'] = this.tvoc;
    data['temperatura'] = this.temperatura;
    data['umidade'] = this.umidade;
    data['erros'] = this.erros;
    return data;
  }
}