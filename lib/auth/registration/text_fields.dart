import 'package:flutter/material.dart';

class MyTextFields {
  // text field label
  String label;
  // text field controller
  TextEditingController controller;
  // text field prefix icon
  IconData prefixIcon;
  // text field suffix icon
  IconData suffixIcon;
  // text field keyboard type
  TextInputType keyboardType;
  // password input
  String? type;
  // text field validation
  VoidCallback? validator;

  MyTextFields({
    required this.label,
    required this.controller,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.keyboardType,
    this.type,
    this.validator,
  });
}
