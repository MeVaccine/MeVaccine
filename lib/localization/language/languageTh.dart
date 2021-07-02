// ignore_for_file: file_names

import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart' as PersonProvider;

class LanguageTH extends Languages {
  String fullNamePerson(PersonProvider.Person person) =>
      '${person.firstname_th} ${person.lastname_th}';
  String firstnameString(String enName, String thName) => thName;
  // Common Button Label
  @override
  String get doneButtonLabel => "ยืนยัน";
  @override
  String get okButtonLabel => "โอเค";
  @override
  String get loginButtonLabel => "เข้าสู่ระบบ";
  @override
  String get registerButtonLabel => "ลงทะเบียน";
  @override
  String get submitButtonLabel => "ยืนยัน";
  @override
  String get nextButtonLabel => "ถัดไป";
  @override
  String get previousButtonLabel => "ก่อนหน้า";
  @override
  String get cancelButtonLabel => "ยกเลิก";
  @override
  String get confirmButtonLabel => "ยืนยัน";
  @override
  String get deleteButtonLabel => "ลบ";
  @override
  String get updateButtonLabel => "อัพเดท";
  // Common Input Label
  @override
  String get nationalIDInputLabel => "เลขประจำตัวประชาชน";
  @override
  String get phoneNumberInputLabel => "เบอร์โทรศัพท์";
  @override
  String provinceDropdownItem(Map<String, String> province) =>
      province['TH'] as String;
  @override
  String locationNameItem(Location location) => location.name_th;

  // Login Screen
  @override
  String get loginHeadingLabel => "เข้าสู่ระบบ";
  @override
  String get invalidNationalIDOrPhoneErrorMessage => "";
  // Verification Code Screen
  @override
  String get verificationCodeHeadingLabel => "รหัสยืนยัน";
  @override
  String get verificationCodeInputLabel => "รหัส OTP 6 หลัก";
  @override
  String get verificationCodeTextMessage =>
      "กรอกเลข OTP 6 หลัก ที่ท่านได้รับจากเบอร์โทรศัพท์";
  @override
  String verificationCodePhoneMessage(String phoneNumber, String refCode) =>
      "$phoneNumber RefCode: $refCode";
  @override
  String get emptyVerificationCodeErrorMessage => "";
  // Register Screen
  @override
  String get registerHeadingLabel => "ลงทะเบียน";
  @override
  String get personalInfoHeading => "ข้อมูลส่วนตัว";
  @override
  String get laserIDInputLabel => "รหัสหลังบัตรประชาชน";
  @override
  String get invalidNationalOrLaserIDErrorMessage => "";
  @override
  String get invalidPhoneNumberOrAddressErrorMessage => "";
  @override
  String get registerLocationHeading => "สถานที่รับวัคซีน";
  @override
  String get provinceInputLabel => "จังหวัด";
  @override
  String get locationInputLabel => "เลือกสถานที่";

  // Landing Screen
  @override
  String get greetingMessage => "สวัสดีตอนเช้า";
  @override
  String get scheduleHeading => "นัดหมาย";
  @override
  String get yourAppointmentHeading => "นัดหมายของคุณ";
  @override
  String get noNextAppointmentMessage => 'คุณยังไม่มีการนัดหมายเข้ารับวัคซีน';
  @override
  String get menuHeading => "เมนู";
  @override
  String get newAppointmentMenuLebel => "จองนัดหมายฉีดวัคซีน";
  @override
  String get myAppointmentMenuLebel => "นัดหมายของคุณ";
  @override
  String get personMenuLebel => "ผู้คนของคุณ";
  @override
  String get symptomFormMenuLebel => "แบบประเมินอาการหลังการฉีดวัคซีน";

  // My Appointments Screen
  @override
  String get noAppointmentMessage =>
      "คุณยังไม่มีการนัดหมายเข้ารับวัคซีน คุณสามารถเพิ่มนัดหมายได้จากหน้าแรก";
  @override
  String get myAppointmentHeading => "นัดหมายของคุณ";
  @override
  String get vaccineDoseHeading => "วัคซีนโควิด 19 เข็มที่1";

  // Person Screen
  @override
  String get yourPersonHeading => "ผู้คนของคุณ";
  @override
  String get noPersonDescription =>
      "คุณสามารถที่จะเพิ่มผู้อื่น โดยเลือกปุ่ม + ด้านล่าง เพื่อนัดหมายการรับวัคซีนในวันและเวลาเดียวกัน";
  @override
  String get personAppointmentsButtonLabel => "นัดหมายการรับวีคซีน";
  @override
  String get personSymptomFormButtonLabel => "แบบประเมินอาการหลังการฉีดวัคซีน ";
  @override
  String get addPersonHeading => "เพิ่งผู้คน";
  @override
  String get deletePersonConfirmMessage => "";

  // Symptom Assessment Form Screen
  @override
  String get symptomFormHeading => "แบบประเมินอาการหลังการฉีดวัคซีน";
  @override
  String get isSymptomQuestion =>
      "คุณมีอาการไม่พึงประสงค์หลังจากการฉีดวัคซีนหรือไม่";
  @override
  String get isHeadacheQuestion => "ปวดศีรษะ";
  @override
  String get isNauseaQuestion => "คลื่นไส้ อาเจียน";
  @override
  String get isFatigueQuestion => "อ่อนเพลีย";
  @override
  String get isChillsQuestion => "ไข้ หนาวสั่น";
  @override
  String get isMusclePainQuestion => "ปวดเมื่อยกล้ามเนื้อ";
  @override
  String get isTirednessQuestion => "เหนื่อย";
  @override
  String get isOtherQuestion => "อาการอื่น ๆ";
  @override
  String get yesMessageLabel => "ใช่";
  @override
  String get noMessageLabel => "ไม่ใช่";
  @override
  String get emptySymptomFormErrorMessage => "";

  // New Appointment Step 1 Screen
  @override
  String get selectPersonHeading => "เลือกคนที่ต้องการรับวัคซีน";
  @override
  String get selectPersonMessage => "ใครบ้างที่ต้องการรับวัคซีนในครั้งนี้";
  // New Appointment Step 2 Screen
  @override
  String get selectLocationHeading => "เลือกสถานที่รับวัคซีน";
  @override
  String get selectLocationMessage => "สถานที่ที่สะดวกกับคุณ";
  @override
  String get locationHeading => "สถานที่รับวัคซีน";
  @override
  String get changingLocationMessage1 => "คุณสามารถเปลี่ยนสถานที่ได้";
  @override
  String get changingLocationMessage2 =>
      "โดยสามารถเลือกได้จากจังหวัดที่ต้องการ";
  // New Appointment Step 3 Screen
  @override
  String get selectDateTimeHeading => "เลือกวันและเวลา";
  @override
  String get selectDateTimeMessage => "วันและเวลาที่สะดวกสำหรับคุณ";
  @override
  String get dateInputLabel => "เลือกวันที่";
  @override
  String get noDateTimeErrorMessage => "";
  // New Appointment Step 4 Screen
  @override
  String get selectVaccineHeading => "เลือกวัคซีน";
  @override
  String get selectVaccineMessage => "เลือกวัคซีนที่คุณมั่นใจ";
  @override
  String get confirmScheduleMessage =>
      "คุณต้องการที่จะนัดหมายการฉีดวัคซีน ตามวันและเวลาที่ท่านได้เลือกไว้";
  @override
  String numberOfPeople(int numberOfPeople) => "$numberOfPeople ท่าน";

  // Settings Screen
  @override
  String get settingsHeading => "ตั้งค่า";
  @override
  String get changeLocationButtonLabel => "เปลี่ยนสถานที่ฉีดวัคซีนตั้งต้น";
  @override
  String get changePhoneNumberButtonLabel => "เปลี่ยนเบอร์โทรศัพท์";
  @override
  String get changeLanguageButtonLabel => "เปลี่ยนภาษา";
  @override
  String get logoutButtonLabel => "ออกจากระบบ";
  @override
  String get changeLocationHeading => "เปลี่ยนสถานที่ฉีดวัคซีนตั้งต้น";
  @override
  String get invalidProvinceOrLocationErrorMessage => "";
  @override
  String get changePhoneNumberHeading => "เปลี่ยนเบอร์โทรศัพท์";
  @override
  String get invalidPhoneNumberErrorMessage => "โปรดใส่เบอร์โทรศัพท์ที่ถูกต้อง";
}
