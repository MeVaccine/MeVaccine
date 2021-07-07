// ignore_for_file: file_names

import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart' as PersonProvider;

class LanguageEN extends Languages {
  String fullNamePerson(PersonProvider.Person person) =>
      '${person.firstname_en} ${person.lastname_en}';
  String firstnameString(String enName, String thName) => enName;
  // Common Button Label
  @override
  String get doneButtonLabel => "Done";
  @override
  String get okButtonLabel => "OK";
  @override
  String get loginButtonLabel => "Login";
  @override
  String get registerButtonLabel => "Register";
  @override
  String get submitButtonLabel => "Submit";
  @override
  String get nextButtonLabel => "Next";
  @override
  String get previousButtonLabel => "Previous";
  @override
  String get cancelButtonLabel => "Cancel";
  @override
  String get confirmButtonLabel => "Confirm";
  @override
  String get deleteButtonLabel => "Delete";
  @override
  String get updateButtonLabel => "Update";
  // Common Input Label
  @override
  String get nationalIDInputLabel => "National ID";
  @override
  String get phoneNumberInputLabel => "Phone Number";
  @override
  String provinceDropdownItem(Map<String, String> province) =>
      province['EN'] as String;
  @override
  String locationNameItem(Location location) => location.name_en;
  @override
  String hospitalNameItem(Hospital hospital) => hospital.name_en;
  @override
  String get provinceSelectLabel => "Select a province";
  @override
  String get locationSelectLabel => "Select a location";

  // Login Screen
  @override
  String get loginHeadingLabel => "Login";
  @override
  String get invalidNationalIDOrPhoneErrorMessage =>
      "Please enter a valid National ID or phone number";
  // Verification Code Screen
  @override
  String get verificationCodeHeadingLabel => "Verification Code";
  @override
  String get verificationCodeInputLabel => "OTP Code";
  @override
  String get verificationCodeTextMessage =>
      "Enter the code we sent to your number at ";
  @override
  String verificationCodePhoneMessage(String phoneNumber, String refCode) =>
      "$phoneNumber. RefCode is $refCode";
  @override
  String get emptyVerificationCodeErrorMessage =>
      "Please enter a verification code";
  // Register Screen
  @override
  String get registerHeadingLabel => "Register";
  @override
  String get personalInfoHeading => "Personal Information";
  @override
  String get laserIDInputLabel => "Laser ID";
  @override
  String get invalidNationalOrLaserIDErrorMessage =>
      "Please enter a valid National ID or Laser ID";
  @override
  String get invalidPhoneNumberOrAddressErrorMessage =>
      "Please enter a valid phone number or address";
  @override
  String get registerLocationHeading => "Vaccination Location";
  @override
  String get provinceInputLabel => "Province";
  @override
  String get locationInputLabel => "Location";
  @override
  String personalPrefix(Personal person) => person.en.prefix;
  @override
  String personalFirstname(Personal person) => person.en.firstName;
  @override
  String personalLastname(Personal person) => person.en.lastName;
  @override
  String personalGender(Personal person) => person.en.gender;

  // Landing Screen
  @override
  String get landingGreetingMessage {
    final hours = DateTime.now().hour;
    if (hours < 13)
      return "Good Morning!";
    else if (hours < 19)
      return "Good Afternoon!";
    else
      return "Good Evening!";
  }

  @override
  String get scheduleHeading => "Schedule";
  @override
  String get yourAppointmentHeading => "Your Appointment";
  @override
  String get noNextAppointmentMessage =>
      'You don’t have any appointment yet.\nPress the button appointment for new schedule.';
  @override
  String get menuHeading => "Menus";
  @override
  String get newAppointmentMenuLebel => "New Appointment ";
  @override
  String get myAppointmentMenuLebel => "My Appointments";
  @override
  String get personMenuLebel => "Person";
  @override
  String get symptomFormMenuLebel => "Symptom asessment form";
  // My Appointments Screen
  @override
  String get noAppointmentMessage => "You don’t have any appointment";
  @override
  String get myAppointmentHeading => "Your Appointment";
  @override
  String vaccineDoseHeading(int dose) {
    if (dose == 1) {
      return "${dose}st Dose";
    } else if (dose == 2) {
      return "${dose}nd Dose";
    } else if (dose == 3) {
      return "${dose}rd Dose";
    }
    return "${dose}th Dose";
  }

  @override
  String appointmentStatusMessage(String status) {
    switch (status) {
      case 'Vaccinated':
        return 'Vaccinated';
      case 'Canceled':
        return 'Canceled';
      default:
        return 'Appointed';
    }
  }

  // Person Screen
  @override
  String get personScreenGreetingMessage => "Hello";
  @override
  String get personScreenHowToMessage =>
      "You can add person who you would like to get vaccine together.";
  @override
  String get yourPersonHeading => "Your Person";
  @override
  String get noPersonDescription =>
      "You don’t have any person yet.\n Press the add button below to add your first person.";
  @override
  String get personAppointmentsButtonLabel => "Appointments";
  @override
  String get personSymptomFormButtonLabel => "Symptom asessment";
  @override
  String get addPersonHeading => "Add a person";
  @override
  String get deletePersonConfirmMessage => "Do you want to delete the person?";
  @override
  String get personAppointmentsButtonLebel => "Appointments";

  // Symptom Assessment Form Screen
  @override
  String get symptomFormHeading => "Symptom Assessment Form";
  @override
  String get isSymptomQuestion => "Do you have any symptom after vaccination ?";
  @override
  String get isHeadacheQuestion => "Headache";
  @override
  String get isNauseaQuestion => "Nausea";
  @override
  String get isFatigueQuestion => "Fatigue";
  @override
  String get isChillsQuestion => "Chills";
  @override
  String get isMusclePainQuestion => "Muscle Pain";
  @override
  String get isTirednessQuestion => "Tiredness";
  @override
  String get isOtherQuestion => "Others";
  @override
  String get yesMessageLabel => "Yes";
  @override
  String get noMessageLabel => "No";
  @override
  String get emptySymptomFormErrorMessage =>
      "Please enter the symptom assesment form";
  @override
  String get confirmSymptomForm => "Thank you for doing the form";

  // New Appointment Step 1 Screen
  @override
  String get selectPersonHeading => "Select Person";
  @override
  String get selectPersonMessage => "Who would like to get vacinate.";
  // New Appointment Step 2 Screen
  @override
  String get selectLocationHeading => "Select Location";
  @override
  String get selectLocationMessage => "Where would you like to go";
  @override
  String get locationHeading => "Location";
  @override
  String get changingLocationMessage1 => "If you want to change the location";
  @override
  String get changingLocationMessage2 =>
      "You can alter the province and location.";
  // New Appointment Step 3 Screen
  @override
  String get selectDateTimeHeading => "Select Date and Time";
  @override
  String get selectDateTimeMessage => "Which date and time works for you";
  @override
  String get dateInputLabel => "Select Date";
  @override
  String get noDateTimeErrorMessage => "Please select date and time";
  // New Appointment Step 4 Screen
  @override
  String get selectVaccineHeading => "Select Vaccine";
  @override
  String get selectVaccineMessage => "Which vaccine do you want";
  @override
  String get noVaccineAvaliableMessage =>
      'Your selected location does not have\nsuitable vaccine for this person';
  @override
  String get confirmScheduleMessage =>
      "Do you confirm schedule this appointment ?";
  @override
  String numberOfPeople(int numberOfPeople) => "$numberOfPeople people";

  // Settings Screen
  @override
  String get settingsHeading => "Settings";
  @override
  String get changeLocationButtonLabel => "Change prefered location";
  @override
  String get changePhoneNumberButtonLabel => "Change Phone Number";
  @override
  String get changeLanguageButtonLabel => "Change Language";
  @override
  String get logoutButtonLabel => "Logout";
  @override
  String get changeLocationHeading => "Change Location";
  @override
  String get invalidProvinceOrLocationErrorMessage =>
      "Please enter a valid province or vaccine location";
  @override
  String get changePhoneNumberHeading => "Change Phone Number";
  @override
  String get invalidPhoneNumberErrorMessage =>
      "Please enter a valid phone number";

  // Error
  @override
  String httpExceptionErrorMessage(HttpException e) => e.messageEN;
  @override
  String get errorDialogHeading => "Error Occurred!";

  //Dialog
  @override
  String get warnDialogSelectPerson => "Please select at least 1 person";
  @override
  String get warnDialogCannotDoForm =>
      "You already did the form today or haven't get vaccine yet";
}
