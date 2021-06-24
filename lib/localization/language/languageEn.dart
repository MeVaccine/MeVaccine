import 'package:mevaccine/localization/language/languages.dart';

class LanguageEN extends Languages {
  @override
  String get doneButtonLabel => "Done";
  String get okButtonLabel => "";
  String get loginButtonLabel => "Login";
  String get registerButtonLabel => "Register";
  String get submitButtonLabel => "";
  String get nextButtonLabel => "";
  String get previousButtonLabel => "";
  String get cancelButtonLabel => "";
  String get confirmButtonLabel => "";
  String get deleteButtonLabel => "";
  String get updateButtonLabel => "";
  // Common Input Label
  String get nationalIDInputLabel => "National ID";
  String get phoneNumberInputLabel => "Phone Number";

  // Login Screen
  String get loginHeadingLabel => "Login";
  String get invalidNationalIDOrPhoneErrorMessage => "";
  // Verification Code Screen
  String get verificationCodeHeadingLabel => "";
  String get verificationCodeInputLabel => "";
  String verificationCodeTextMessage(String phoneNumber, String refCode) => "";
  String get emptyVerificationCodeErrorMessage => "";
  // Register Screen
  String get registerHeadingLabel => "";
  String get laserIDInputLabel => "";
  String get invalidNationalOrLaserIDErrorMessage => "";
  String get invalidPhoneNumberOrAddressErrorMessage => "";

  // Landing Screen
  String get greetingMessage => "";
  String get scheduleHeading => "";
  String get yourAppointmentHeading => "";
  String get menuHeading => "";
  String get newAppointmentMenuLebel => "";
  String get myAppointmentMenuLebel => "";
  String get personMenuLebel => "";
  String get symptomFormMenuLebel => "";

  // My Appointments Screen
  String get noAppointmentMessage => "";
  String get myAppointmentHeading => "";

  // Person Screen
  String get yourPersonHeading => "";
  String get noPersonDescription => "";
  String get personAppointmentsButtonLabel => "";
  String get personSymptomFormButtonLabel => "";
  String get addPersonHeading => "";
  String get deletePersonConfirmMessage => "";

  // Symptom Assessment Form Screen
  String get symptomFormHeading => "";
  String get isSymptomQuestion => "";
  String get isHeadacheQuestion => "";
  String get isNauseaQuestion => "";
  String get isFatigueQuestion => "";
  String get isChillsQuestion => "";
  String get isMusclePainQuestion => "";
  String get isTirednessQuestion => "";
  String get isOtherQuestion => "";
  String get yesMessageLabel => "";
  String get noMessageLabel => "";
  String get emptySymptomFormErrorMessage => "";

  // New Appointment Step 1 Screen
  String get selectPersonHeading => "";
  String get selectPersonMessage => "";
  // New Appointment Step 2 Screen
  String get selectLocationHeading => "";
  String get selectLocationMessage => "";
  String get locationHeading => "";
  String get changingLocationMessage => "";
  // New Appointment Step 3 Screen
  String get selectDateTimeHeading => "";
  String get selectDateTimeMessage => "";
  String get dateInputLabel => "";
  String get noDateTimeErrorMessage => "";
  // New Appointment Step 4 Screen
  String get selectVaccineHeading => "";
  String get selectVaccineMessage => "";
  String get confirmScheduleMessage => "";
  String numberOfPeople(int numberOfPeople) => "";

  // Settings Screen
  String get settingsHeading => "";
  String get changeLocationButtonLabel => "";
  String get changePhoneNumberButtonLabel => "";
  String get changeLanguageButtonLabel => "";
  String get logoutButtonLabel => "";
  String get changeLocationHeading => "";
  String get invalidProvinceOrLocationErrorMessage => "";
}
