import 'dart:convert';
import 'package:aps_flutter/entities/post_dto.dart';
import 'package:http/http.dart';

class HttpService {

  String estado = "";
  String cidade = "";
  String bairro = "";
  DateTime dataInicial = DateTime.now();
  DateTime dataFinal = DateTime.now();
  String baseUrl = "https://monitoring-esp32.herokuapp.com/monitoring/co2data?";

  String retrieveData() {
    String postUrl = baseUrl;
    postUrl+= "estado=${estado}&data_inicial=${dataInicial}&data_final=${dataFinal}";

    if(!cidade.isEmpty) {
      postUrl += "&cidade=${cidade}";
    }

    if(!bairro.isEmpty) {
      postUrl+= "&bairro=${bairro}";
    }

    return postUrl;
  }

  Future<List<PostsDto>> getPosts() async {

    Response res = await get(Uri.parse(retrieveData()));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<PostsDto> posts = body
          .map(
            (dynamic item) => PostsDto.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
