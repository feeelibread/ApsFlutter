import 'package:aps_flutter/components/final_date_picker_widget.dart';
import 'package:aps_flutter/screens/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/initial_date_picker_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF16910B),
          title: const Text('Insira a cidade, bairro e estado'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Estado",
                ),
              ),
              TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Cidade")),
              TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Bairro")),
              const InitialDatePickerWidget(),
              const FinalDatePickerWidget(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DataScreen()));
                  },
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
