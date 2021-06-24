// ignore_for_file: file_names

import 'package:mevaccine/localization/language/languages.dart';

class LanguageTH extends Languages {
  // Common Button Label
  @override
  String get doneButtonLabel => "";
  @override
  String get okButtonLabel => "";
  @override
  String get loginButtonLabel => "เข้าสู่ระบบ";
  @override
  String get registerButtonLabel => "ลงทะเบียน";
  @override
  String get submitButtonLabel => "";
  @override
  String get nextButtonLabel => "";
  @override
  String get previousButtonLabel => "";
  @override
  String get cancelButtonLabel => "";
  @override
  String get confirmButtonLabel => "";
  @override
  String get deleteButtonLabel => "";
  @override
  String get updateButtonLabel => "";
  // Common Input Label
  @override
  String get nationalIDInputLabel => "เลขประจำตัวประชาชน";
  @override
  String get phoneNumberInputLabel => "เบอร์โทรศัพท์";

  // Login Screen
  @override
  String get loginHeadingLabel => "เข้าสู่ระบบ";
  @override
  String get invalidNationalIDOrPhoneErrorMessage => "";
  // Verification Code Screen
  @override
  String get verificationCodeHeadingLabel => "";
  @override
  String get verificationCodeInputLabel => "";
  @override
  String verificationCodeTextMessage(String phoneNumber, String refCode) => "";
  @override
  String get emptyVerificationCodeErrorMessage => "";
  // Register Screen
  @override
  String get registerHeadingLabel => "";
  @override
  String get laserIDInputLabel => "";
  @override
  String get invalidNationalOrLaserIDErrorMessage => "";
  @override
  String get invalidPhoneNumberOrAddressErrorMessage => "";

  // Landing Screen
  @override
  String get greetingMessage => "";
  @override
  String get scheduleHeading => "";
  @override
  String get yourAppointmentHeading => "";
  @override
  String get menuHeading => "";
  @override
  String get newAppointmentMenuLebel => "";
  @override
  String get myAppointmentMenuLebel => "";
  @override
  String get personMenuLebel => "";
  @override
  String get symptomFormMenuLebel => "";

  // My Appointments Screen
  @override
  String get noAppointmentMessage => "";
  @override
  String get myAppointmentHeading => "";

  // Person Screen
  @override
  String get yourPersonHeading => "";
  @override
  String get noPersonDescription => "";
  @override
  String get personAppointmentsButtonLabel => "";
  @override
  String get personSymptomFormButtonLabel => "";
  @override
  String get addPersonHeading => "";
  @override
  String get deletePersonConfirmMessage => "";

  // Symptom Assessment Form Screen
  @override
  String get symptomFormHeading => "";
  @override
  String get isSymptomQuestion => "";
  @override
  String get isHeadacheQuestion => "";
  @override
  String get isNauseaQuestion => "";
  @override
  String get isFatigueQuestion => "";
  @override
  String get isChillsQuestion => "";
  @override
  String get isMusclePainQuestion => "";
  @override
  String get isTirednessQuestion => "";
  @override
  String get isOtherQuestion => "";
  @override
  String get yesMessageLabel => "";
  @override
  String get noMessageLabel => "";
  @override
  String get emptySymptomFormErrorMessage => "";

  // New Appointment Step 1 Screen
  @override
  String get selectPersonHeading => "";
  @override
  String get selectPersonMessage => "";
  // New Appointment Step 2 Screen
  @override
  String get selectLocationHeading => "";
  @override
  String get selectLocationMessage => "";
  @override
  String get locationHeading => "";
  @override
  String get changingLocationMessage => "";
  // New Appointment Step 3 Screen
  @override
  String get selectDateTimeHeading => "";
  @override
  String get selectDateTimeMessage => "";
  @override
  String get dateInputLabel => "";
  @override
  String get noDateTimeErrorMessage => "";
  // New Appointment Step 4 Screen
  @override
  String get selectVaccineHeading => "";
  @override
  String get selectVaccineMessage => "";
  @override
  String get confirmScheduleMessage => "";
  @override
  String numberOfPeople(int numberOfPeople) => "";

  // Settings Screen
  @override
  String get settingsHeading => "";
  @override
  String get changeLocationButtonLabel => "";
  @override
  String get changePhoneNumberButtonLabel => "";
  @override
  String get changeLanguageButtonLabel => "";
  @override
  String get logoutButtonLabel => "";
  @override
  String get changeLocationHeading => "";
  @override
  String get invalidProvinceOrLocationErrorMessage => "";
  @override
  String get changePhoneNumberHeading => "Change Phone Number";
  @override
  String get invalidPhoneNumberErrorMessage =>
      "Please enter a valid phone number";
}
