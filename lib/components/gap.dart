import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gap extends StatelessWidget {
  double size;
  Gap({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
