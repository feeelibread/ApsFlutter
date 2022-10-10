import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF609651),
          title: const Text('Insira a cidade, bairro e estado'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "Cidade",
                ),
              ),
              TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Estado")),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Bairro")
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF256B12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(59),
                    ),
                  ),
                  child: const Text('Continuar'),
                ),
              ),
            ],
          ),
        ));
  }
}
