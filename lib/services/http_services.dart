import 'dart:convert';

import 'package:aps_flutter/entities/post_dto.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsUrl = 'https://monitoring-esp32.herokuapp.com/monitoring/co2data?estado=estado&cidade=cidade&bairro=bairro&data_inicial=2021-08-04T00:17:08.000&data_final=2023-11-04T00:17:08.000';

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
