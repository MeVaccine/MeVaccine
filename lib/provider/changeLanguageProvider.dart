// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mevaccine/localization/locale_constant.dart';

class ChangeLanguageProvider with ChangeNotifier {
  bool isEngSelected = false;
  bool isThaiSelected = false;

  ChangeLanguageProvider() {
    getLocale().then((Locale locale) {
      if (locale.toLanguageTag() == 'en')
        isEngSelected = true;
      else
        isThaiSelected = true;
    });
  }

  Future<void> initSelectedLang() async {
    final locale = await getLocale();
    if (locale.toLanguageTag() == 'en')
      isEngSelected = true;
    else
      isThaiSelected = true;
  }

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
