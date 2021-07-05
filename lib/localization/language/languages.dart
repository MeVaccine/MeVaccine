import 'package:flutter/material.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart' as PersonProvider;

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String fullNamePerson(PersonProvider.Person person);
  String firstnameString(String enName, String thName);

  // Common Button Label
  String get doneButtonLabel;
  String get okButtonLabel;
  String get loginButtonLabel;
  String get registerButtonLabel;
  String get submitButtonLabel;
  String get nextButtonLabel;
  String get previousButtonLabel;
  String get cancelButtonLabel;
  String get confirmButtonLabel;
  String get deleteButtonLabel;
  String get updateButtonLabel;
  // Common Input Label
  String get nationalIDInputLabel;
  String get phoneNumberInputLabel;
  String provinceDropdownItem(Map<String, String> province);
  String locationNameItem(Location location);
  String hospitalNameItem(Hospital hospital);
  String get provinceSelectLabel;

  // Login Screen
  String get loginHeadingLabel;
  String get invalidNationalIDOrPhoneErrorMessage;
  // Verification Code Screen
  String get verificationCodeHeadingLabel;
  String get verificationCodeInputLabel;
  String get verificationCodeTextMessage;
  String verificationCodePhoneMessage(String phoneNumber, String refCode);
  String get emptyVerificationCodeErrorMessage;
  // Register Screen
  String get registerHeadingLabel;
  String get personalInfoHeading;
  String get laserIDInputLabel;
  String get invalidNationalOrLaserIDErrorMessage;
  String get invalidPhoneNumberOrAddressErrorMessage;
  String get registerLocationHeading;
  String get provinceInputLabel;
  String get locationInputLabel;
  String personalPrefix(Personal person);
  String personalFirstname(Personal person);
  String personalLastname(Personal person);
  String personalGender(Personal person);

  // Landing Screen
  String get landingGreetingMessage;
  String get scheduleHeading;
  String get yourAppointmentHeading;
  String get noNextAppointmentMessage;
  String get menuHeading;
  String get newAppointmentMenuLebel;
  String get myAppointmentMenuLebel;
  String get personMenuLebel;
  String get symptomFormMenuLebel;

  // My Appointments Screen
  String get noAppointmentMessage;
  String get myAppointmentHeading;
  String vaccineDoseHeading(int dose);

  // Person Screen
  String get personScreenGreetingMessage;
  String get personScreenHowToMessage;
  String get yourPersonHeading;
  String get noPersonDescription;
  String get personAppointmentsButtonLabel;
  String get personSymptomFormButtonLabel;
  String get addPersonHeading;
  String get deletePersonConfirmMessage;
  String get personAppointmentsButtonLebel;

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
  String get yesMessageLabel;
  String get noMessageLabel;
  String get emptySymptomFormErrorMessage;
  String get confirmSymptomForm;

  // New Appointment Step 1 Screen
  String get selectPersonHeading;
  String get selectPersonMessage;
  // New Appointment Step 2 Screen
  String get selectLocationHeading;
  String get selectLocationMessage;
  String get locationHeading;
  String get changingLocationMessage1;
  String get changingLocationMessage2;
  // New Appointment Step 3 Screen
  String get selectDateTimeHeading;
  String get selectDateTimeMessage;
  String get dateInputLabel;
  String get noDateTimeErrorMessage;
  // New Appointment Step 4 Screen
  String get selectVaccineHeading;
  String get selectVaccineMessage;
  String get noVaccineAvaliableMessage;
  String get confirmScheduleMessage;
  String numberOfPeople(int numberOfPeople);

  // Settings Screen
  String get settingsHeading;
  String get changeLocationButtonLabel;
  String get changePhoneNumberButtonLabel;
  String get changeLanguageButtonLabel;
  String get logoutButtonLabel;
  String get changeLocationHeading;
  String get invalidProvinceOrLocationErrorMessage;
  String get changePhoneNumberHeading;
  String get invalidPhoneNumberErrorMessage;

  // Error
  String httpExceptionErrorMessage(HttpException e);
  String get errorDialogHeading;

  // Dialog
  String get warnDialogSelectPerson;
  String get warnDialogCannotDoForm;
}
