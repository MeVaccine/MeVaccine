// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mevaccine/localization/locale_constant.dart';

class ChangeLanguageProvider with ChangeNotifier {
  bool isEngSelected = false;
  bool isThaiSelected = false;

  void selectEngish() {
    isEngSelected = true;
    isThaiSelected = false;
    notifyListeners();
  }

  void selectThai() {
    isEngSelected = false;
    isThaiSelected = true;
    notifyListeners();
  }
}
