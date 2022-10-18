import 'package:aps_flutter/entities/post_dto.dart';
import 'package:aps_flutter/services/http_services.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreen();
}

class _DataScreen extends State<DataScreen> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF16910B),
        title: Text("Co2 Data"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
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
                      trailing: Text("Co2: ${post.sensorData!.co2}, Temperatura: ${post.sensorData!.temperatura}"),
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
