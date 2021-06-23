import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  // Common Input Button Label
  String get doneButtonLabel;
  String get okButtonLabel;
  String get loginButtonLabel;
  String get registerButtonLabel;
  // Common Input Label
  String get nationalIDInputLabel;
  String get phoneNumberInputLabel;

  // Login Screen
  String get loginHeadingLabel;
  String get invalidNationalIDErrorMessage;
  // Verification Code Screen
  String get verificationCodeHeadingLabel;
  String get verificationCodeInputLabel;
  String verificationCodeTextMessage(String phoneNumber, String refCode);
  String get emptyVerificationCodeErrorMessage;
  // Register Screen
  String get registerHeadingLabel;
  String get laserIDInputLabel;
}
