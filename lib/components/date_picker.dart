import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
          controller: _dateController,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            hintText: 'Today',
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Colors.blueGrey,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
          ),
          readOnly: true,
          onTap: () {
            _selectDate();
          }),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
