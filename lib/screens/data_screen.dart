import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreen();
}

class _DataScreen extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF16910B),
        title: const Text('Co2 atual'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Finja que tem um dado legal aqui ó", style: TextStyle(
                fontSize: 18
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
