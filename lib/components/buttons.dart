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
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        )),
      ),
      child:
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

class TextButton extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final VoidCallback onPress;
  const TextButton(
      {super.key, this.textStyle, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Text(
        text,
        style: textStyle ??
            const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 16),
      ),
    );
  }
}

class OutlinedButton extends StatelessWidget {
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final String text;
  final VoidCallback onPress;
  const OutlinedButton(
      {super.key,
      this.style,
      this.textStyle,
      required this.text,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: style ??
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 50)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              side: BorderSide(color: Colors.blueGrey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
          ),
      child: Text(text,
          style: textStyle ??
              const TextStyle(fontSize: 16, color: Colors.blueGrey)),
    );
  }
}
