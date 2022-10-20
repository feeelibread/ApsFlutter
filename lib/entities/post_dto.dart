import 'package:flutter/cupertino.dart';

import 'sensor_data_dto.dart';

class PostsDto {
  int? id;
  int? epoch;
  int? identificador;
  SensorData? sensorData;
  String? rawCo2Data;

  PostsDto(
      {@required this.id,
      @required this.epoch,
      @required this.identificador,
      @required this.sensorData,
      @required this.rawCo2Data});

  PostsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    epoch = json['epoch'];
    identificador = json['identificador'];
    sensorData = json['sensorData'] != null
        ? new SensorData.fromJson(json['sensorData'])
        : null;
    rawCo2Data = json['rawCo2Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['epoch'] = this.epoch;
    data['identificador'] = this.identificador;
    if (this.sensorData != null) {
      data['sensorData'] = this.sensorData!.toJson();
    }
    data['rawCo2Data'] = this.rawCo2Data;
    return data;
  }
}
