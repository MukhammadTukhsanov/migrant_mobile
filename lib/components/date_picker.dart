import 'package:flutter/material.dart';
import 'package:migrant/providers/choose_country_provider.dart';
import 'package:provider/provider.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _dateController = TextEditingController();
  DateTime initialDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
          controller: _dateController,
          style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: context.watch<ChooseCountryProvider>().dateTime,
            prefixIcon: const Icon(
              Icons.calendar_today,
              color: Colors.blueGrey,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          readOnly: true,
          onTap: () {
            _selectDate();
          }),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      // ignore: unnecessary_cast
      context: context as BuildContext,
      initialDate: initialDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        initialDate = picked;
        _dateController.text = DateTime.now().toString().split(" ")[0] ==
                picked.toString().split(" ")[0]
            ? "Today"
            : picked.toString().split(" ")[0];
      });
    }
  }
}
