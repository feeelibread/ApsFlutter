import 'package:aps_flutter/entities/post_dto.dart';
import 'package:aps_flutter/services/http_services.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key, required this.http});
  final HttpService http;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF16910B),
        title: Text("Co2 Data"),
      ),
      body: FutureBuilder(
        future: http.getPosts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostsDto>> snapshot) {
          if (snapshot.hasData) {
            List<PostsDto>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (PostsDto post) => ListTile(
                      title: Text("Id: ${post.id}"),
                      subtitle: Text("Identificador: ${post.identificador}"),
                      trailing: Text("Co2: ${post.sensorData!.co2}ppm, Temperatura: ${post.sensorData!.temperatura}Cº"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
