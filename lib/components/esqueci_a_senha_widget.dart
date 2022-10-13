import 'package:flutter/material.dart';

class EsqueciASenhaWidget extends StatelessWidget {
  const EsqueciASenhaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("parabens em");
        },
        child: const Text(
          "Esqueci a senha!",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white),
        ));
  }
}
