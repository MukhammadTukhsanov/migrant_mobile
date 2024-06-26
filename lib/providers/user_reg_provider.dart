import 'package:flutter/material.dart';

class UserRegProvider with ChangeNotifier {
  bool isLogged = true;

  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  bool _isPassanger = false;

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  // bool get isPassanger => _isPassanger;

  void registerUser({
    required String email,
    // required String password,
    // required String confirmPassword,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    // required bool isPassanger
  }) {
    _email = email;
    // _password = password;
    // _confirmPassword = confirmPassword;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    // _isPassanger = isPassanger;
  }
}
