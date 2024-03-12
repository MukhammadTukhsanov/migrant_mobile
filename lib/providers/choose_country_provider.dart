import 'package:flutter/material.dart';

class ChooseCountryProvider with ChangeNotifier {
  String _startCountry = 'Choose Country';
  String _endCountry = 'Choose Country';
  String _dateTime = "Today";

  String get startCountry => _startCountry;
  String get endCountry => _endCountry;
  String get dateTime => _dateTime;

  void setStartingCountry(String startCountry) {
    _startCountry = startCountry;

    notifyListeners();
  }

  void setEndingCountry(String endCountry) {
    _endCountry = endCountry;

    notifyListeners();
  }

  void setDateTime(String dateTime) {
    _dateTime = dateTime;

    notifyListeners();
  }
}
