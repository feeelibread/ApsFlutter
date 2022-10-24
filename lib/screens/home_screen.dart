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
  final _formKey = GlobalKey<FormState>();
  HttpService http = HttpService();
  late String postUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF16910B),
          title: const Text('Insira a cidade, bairro e estado'),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50),
            reverse: true,
            child: Form(
                key: _formKey,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
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
                          autofocus: true,
                          decoration:
                              const InputDecoration(labelText: "Cidade")),
                      TextFormField(
                          controller: _bairro,
                          autofocus: true,
                          decoration:
                              const InputDecoration(labelText: "Bairro")),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Insira a data inicial!";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.datetime,
                        controller: _dataInicial,
                        autofocus: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today_rounded),
                            labelText: "Data inicial"),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2130));
                          if (pickedDate != null) {
                            setState(() {
                              _dataInicial.text =
                                  DateFormat('yyyy-MM-ddT00:00:00.000').format(pickedDate);
                            });
                          }
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Insira a data final!";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.datetime,
                        controller: _dataFinal,
                        autofocus: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today_rounded),
                            labelText: "Data final"),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2130));
                          if (pickedDate != null) {
                            setState(() {
                              _dataFinal.text =
                                  DateFormat('yyyy-MM-ddT00:00:00.000').format(pickedDate);
                            });
                          }
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              http.estado = _estado.text;
                              http.cidade = _cidade.text;
                              http.bairro = _bairro.text;
                              http.dataInicial = _dataInicial.text;
                              http.dataFinal = _dataFinal.text;
                              http.retrieveData();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DataScreen(http: http,)));
                            }
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
                ))));
  }
}