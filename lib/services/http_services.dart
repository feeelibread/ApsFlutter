import 'dart:convert';

import 'package:aps_flutter/entities/post_dto.dart';
import 'package:http/http.dart';

class HttpService {
  late String estado;
  late String cidade;
  late String bairro;
  late String dataInicial;
  late String dataFinal;

  late String postsUrl = 'https://monitoring-esp32.herokuapp.com/monitoring/co2data?estado=${estado}&cidade=${cidade}&bairro=${bairro}&data_inicial=${dataInicial}&data_final=${dataFinal}';

  Future<List<PostsDto>> getPosts() async {
    Response res = await get(Uri.parse(postsUrl));

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
