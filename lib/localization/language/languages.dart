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
  String get invalidPhoneNumberErrorMessage;

  // Landing Screen
  String get greetingMessage;
  String get scheduleHeading;
  String get yourAppointmentHeading;
  String get menuHeading;
  String get newAppointmentMenuLebel;
  String get myAppointmentMenuLebel;
  String get personMenuLebel;
  String get symptomFormMenuLebel;

  // My Appointments Screen
  String get noAppointmentMessage;
  String get myAppointmentHeading;

  // Person Screen
  String get yourPersonHeading;
  String get personDescription;
  String get personAppointmentsButtonLabel;
  String get personSymptomFormButtonLabel;
  String get addPersonHeading;

  // Symptom Assessment Form Screen
  String get symptomFormHeading;
  String get isSymptomQuestion;
  String get isHeadacheQuestion;
  String get isNauseaQuestion;
  String get isFatigueQuestion;
  String get isChillsQuestion;
  String get isMusclePainQuestion;
  String get isTirednessQuestion;
  String get isOtherQuestion;
}
