import 'package:aps_flutter/components/email_widget.dart';
import 'package:aps_flutter/components/esqueci_a_senha_widget.dart';
import 'package:aps_flutter/components/senha_widget.dart';
import 'package:aps_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _continuarConectado = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.greenAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Image.asset(
                "assets/co2.png",
                height: 128,
              ),
            ),
            const Text(
              "Entrar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
            const EmailWidget(),
            const SenhaWidget(),
            const Padding(padding: EdgeInsets.only(bottom: 6)),
            const EsqueciASenhaWidget(),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.black54,
                    value: _continuarConectado,
                    onChanged: (bool? value) {
                      setState(() {
                        _continuarConectado = value!;
                      });
                    }),
                const Text(
                  'Continuar conectado?',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(59),
                ),
              ),
              child: const Text('Login'),
            ),
            const Divider(),
          ],
        ),
      ),
    ));
  }
}
