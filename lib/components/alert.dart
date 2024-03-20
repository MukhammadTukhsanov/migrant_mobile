import 'package:flutter/material.dart';
import 'package:migrant/components/buttons.dart' as buttons;
import 'package:migrant/components/gap.dart';

class Alert extends StatelessWidget {
  final String title;
  final String accept;
  final VoidCallback acceptFunction;
  final IconData icon;
  const Alert(
      {super.key,
      required this.title,
      required this.accept,
      required this.acceptFunction,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Icon(
        icon,
        color: Colors.blueGrey,
        size: 100,
      ),
      content: Text(
        title,
        style: const TextStyle(color: Colors.blueGrey, fontSize: 24),
      ),
      actions: <Widget>[
        buttons.FillButton(
          text: 'Cancel',
          onPress: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
        Gap(size: 10),
        buttons.OutlinedButton(
          text: accept,
          onPress: acceptFunction,
        ),
      ],
    );
  }
}
