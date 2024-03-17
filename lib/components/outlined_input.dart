import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputOutlined extends StatelessWidget {
  // TextField controller
  TextEditingController? controller;
  // TextField label
  String? labelText;
  // TextField suffixIcon
  IconButton? suffixIcon;
  // TextField prefixIcon
  IconData? prefixIcon;
  // TextField keybord type
  TextInputType? keyboardType;
  // TextField validator
  // TextField obsecure text
  bool? obscureText;
  // TextField key
  InputOutlined({
    super.key,
    this.controller,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.blueGrey, width: .5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.blueGrey.shade900, width: 1)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.blueGrey, width: .5),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.blueGrey, fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, size: 20, color: Colors.blueGrey.shade400),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
