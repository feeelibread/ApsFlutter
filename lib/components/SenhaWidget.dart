import 'package:flutter/material.dart';

class SenhaWidget extends StatefulWidget {
  const SenhaWidget({Key? key}) : super(key: key);

  @override
  State<SenhaWidget> createState() => _SenhaWidget();
}

class _SenhaWidget extends State<SenhaWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock_outline,
              color: Colors.black54,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() => _obscureText = !_obscureText);
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.black54,
              ),
            ),
            hintText: "Senha",
            border: InputBorder.none),
        obscureText: _obscureText,
        validator: (value) => value == null || value.isEmpty ? "digite a senha!" : null,
      ),
    );
  }
}
