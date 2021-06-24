import 'package:flutter/material.dart';
import 'package:mevaccine/localization/language/languageEn.dart';
import 'package:mevaccine/localization/language/languageTh.dart';
import 'package:mevaccine/localization/language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'th'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEN();
      case 'th':
        return LanguageTH();
      default:
        return LanguageTH();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
