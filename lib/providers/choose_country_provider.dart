import 'package:flutter/material.dart';

class ChooseCountryProvider with ChangeNotifier {
  String _startCountry = 'Choose start Country';
  String _endCountry = 'Choose Country';
  bool _isStartCountry = false;
  bool _isEndCountry = false;

  String get startCountry => _startCountry;
  String get endCountry => _endCountry;
  bool get isStartCountry => _isStartCountry;
  bool get isEndCountry => _isEndCountry;

  void setStartCountry(String startCountry) {
    _startCountry = startCountry;

    notifyListeners();
  }

  void setEndCountry(String endCountry) {
    _endCountry = endCountry;

    notifyListeners();
  }

  void setIsStartCountry(bool isStartCountry) {
    _isStartCountry = isStartCountry;

    notifyListeners();
  }

  void setIsEndCountry(bool isEndCountry) {
    _isEndCountry = isEndCountry;

    notifyListeners();
  }
}
