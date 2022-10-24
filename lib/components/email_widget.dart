import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        validator: (value) {
          if(value == null || value != 'admin') {
            return "Email vazio ou email errado!";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.email_outlined,
            color: Colors.black54,
          ),
          hintText: "Email",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
