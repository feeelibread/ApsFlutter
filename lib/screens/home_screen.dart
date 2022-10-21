import 'package:aps_flutter/screens/data_screen.dart';
import 'package:aps_flutter/services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  TextEditingController _estado = TextEditingController();
  TextEditingController _cidade = TextEditingController();
  TextEditingController _bairro = TextEditingController();
  TextEditingController _dataInicial = TextEditingController();
  TextEditingController _dataFinal = TextEditingController();

  final HttpService http = HttpService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF16910B),
          title: const Text('Insira a cidade, bairro e estado'),
        ),
        body: Form(
        key: _formKey,
        child:
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Column(
            children: [
              TextFormField(
                controller: _estado,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira o estado!";
                  } else {
                    return null;
                  }
                },
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Estado",
                ),
              ),
              TextFormField(
                  controller: _cidade,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Insira a cidade!";
                    } else {
                      return null;
                    }
                  },
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Cidade")),
              TextFormField(
                  controller: _bairro,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Insira o bairro!";
                    } else {
                      return null;
                    }
                  },
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Bairro")),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Insira a data!";
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.datetime,
                controller: _dataInicial,
                autofocus: true,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded), labelText: "Data inicial"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2130));
                  if (pickedDate != null) {
                    setState(() {
                      _dataInicial.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
              ),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Insira a data!";
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.datetime,
                controller: _dataFinal,
                autofocus: true,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded), labelText: "Data inicial"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2130));
                  if (pickedDate != null) {
                    setState(() {
                      _dataFinal.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    http.estado = _estado.text;
                    http.cidade = _cidade.text;
                    http.bairro = _bairro.text;
                    http.dataInicial = _dataInicial.text;
                    http.dataFinal =  _dataFinal.text;
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
        )));
  }
}
