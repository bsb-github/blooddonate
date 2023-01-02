import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryCodeProvider extends ChangeNotifier {
  String _countryCode = "+92";

  String get countryCode => _countryCode;

  void setCountryCode(String code) {
    _countryCode = "+" + code;
    notifyListeners();
  }
}
