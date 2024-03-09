import 'package:flutter/material.dart';
import 'package:migrant/pages/home_page/choose_country_input.dart';

class ChooseCountryAndTime extends StatefulWidget {
  const ChooseCountryAndTime({super.key});

  @override
  State<ChooseCountryAndTime> createState() => _ChooseCountryAndTimeState();
}

class _ChooseCountryAndTimeState extends State<ChooseCountryAndTime> {
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Country',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 100,
              child: Text(
                'Time',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: ChooseCountryInput(),
            ),
            const SizedBox(
              width: 10,
            ),
            // time picker
            Container(
              width: 100,
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextButton(
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                      initialEntryMode: TimePickerEntryMode.dial);
                  if (timeOfDay != null) {
                    setState(() {
                      selectedTime = timeOfDay;
                    });
                  }
                },
                child: Text(
                  "${selectedTime.hour} : ${selectedTime.minute < 10 ? '0' : ''}${selectedTime.minute}",
                  style: TextStyle(
                    color: Colors.blueGrey.shade700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
