import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthPagesHeader extends StatelessWidget {
  String title;
  String subTitle;

  AuthPagesHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 30,
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.bold)),
        Text(subTitle,
            style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey.shade500,
                fontWeight: FontWeight.w300)),
      ],
    );
  }
}
