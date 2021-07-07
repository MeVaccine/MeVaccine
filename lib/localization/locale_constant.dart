import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale?> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  final languageCode = _prefs.getString(prefSelectedLanguageCode);
  return languageCode == null ? null : _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode != null && languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : Locale('th', '');
}

Future<void> changeLanguage(
    BuildContext context, String selectedLanguageCode) async {
  print('Change lang');
  print(selectedLanguageCode);
  var _locale = await setLocale(selectedLanguageCode);
  MyApp.setLocale(context, _locale);
}
