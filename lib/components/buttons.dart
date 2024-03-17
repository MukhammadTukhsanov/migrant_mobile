import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FillButton extends StatelessWidget {
  String text;
  VoidCallback onPress;
  FillButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 55)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        )),
      ),
      child:
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

// ignore: must_be_immutable
class TextButton extends StatelessWidget {
  String text;
  VoidCallback onPress;
  TextButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
