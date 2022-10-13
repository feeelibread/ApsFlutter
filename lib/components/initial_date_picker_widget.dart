import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InitialDatePickerWidget extends StatefulWidget {
  const InitialDatePickerWidget({super.key});

  @override
  State<InitialDatePickerWidget> createState() => _InitialDatePickerWidget();
}

class _InitialDatePickerWidget extends State<InitialDatePickerWidget> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      controller: _date,
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
            _date.text = DateFormat('yyyy-MM-dd').format(pickedDate);
          });
        }
      },
    );
  }
}
