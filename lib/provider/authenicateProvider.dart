import 'dart:async';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import '../model/httpException.dart';

class UserInfo {
  String id;
  String prefix_en;
  String firstname_en;
  String lastname_en;
  String gender_en;
  String prefix_th;
  String firstname_th;
  String lastname_th;
  String gender_th;
  Appointment? appointment;
  VaccineUser? vaccineUser;
  UserInfo(
      {required this.id,
      required this.firstname_en,
      required this.gender_en,
      required this.lastname_en,
      required this.prefix_en,
      required this.firstname_th,
      required this.gender_th,
      required this.lastname_th,
      required this.prefix_th,
      required this.appointment,
      required this.vaccineUser});
}

class Appointment {
  String status;
  String id;
  DateTime date;
  int doesNumber;
  Location location;
  Appointment(
      {required this.status,
      required this.id,
      required this.date,
      required this.doesNumber,
      required this.location});
}

class Location {
  String id;
  String name_en;
  String name_th;
  int priority;
  String province_th;
  String province_en;
  Location(
      {required this.id,
      required this.name_en,
      required this.name_th,
      required this.priority,
      required this.province_en,
      required this.province_th});
}

class VaccineUser {
  String id;
  String name;
  int minAge;
  int maxAge;
  VaccineUser(
      {required this.id,
      required this.name,
      required this.minAge,
      required this.maxAge});
}

class Person {
  String id;
  String prefix_en;
  String firstname_en;
  String lastname_en;
  String gender_en;
  String prefix_th;
  String firstname_th;
  String lastname_th;
  String gender_th;
  Person(
      {required this.id,
      required this.firstname_en,
      required this.gender_en,
      required this.lastname_en,
      required this.prefix_en,
      required this.firstname_th,
      required this.gender_th,
      required this.lastname_th,
      required this.prefix_th});
}

class Personal {
  String id;
  String laserId;
  Information th;
  Information en;
  Personal(
      {required this.id,
      required this.laserId,
      required this.en,
      required this.th});
}

class Information {
  String prefix;
  String firstName;
  String lastName;
  DateTime date_of_birth;
  String gender;
  String province;
  Information(
      {required this.prefix,
      required this.firstName,
      required this.lastName,
      required this.date_of_birth,
      required this.gender,
      required this.province});
}

class Hospital {
  String id;
  String name_th;
  String name_en;
  int priority;
  String province_th;
  String province_en;
  List<Vaccine> vaccine;
  Hospital(
      {required this.id,
      required this.name_en,
      required this.name_th,
      required this.priority,
      required this.province_en,
      required this.province_th,
      required this.vaccine});
}

class Vaccine {
  String name;
  int amount;
  int availble;
  Vaccine({required this.name, required this.amount, required this.availble});
}

class AuthenicateProvider with ChangeNotifier {
  String _number = "";
  String _refCode = "";
  String _refCodeAddPerson = "";
  String _token = "";
  String locationAppointment = "";
  String tempName = "";
  String locationAppointmentID = '';
  String tempID = '';
  String nameProvinceAppointment = '';
  String tempProvince = '';
  Location location = Location(
      id: '',
      name_en: '',
      name_th: '',
      priority: 0,
      province_en: '',
      province_th: '');
  List<Hospital> _hospital = [];
  List<Person> _person = [];
  Personal _personal = Personal(
      en: Information(
          date_of_birth: DateTime.now(),
          firstName: "",
          gender: "",
          lastName: "",
          prefix: "",
          province: ""),
      id: "",
      laserId: "",
      th: Information(
          date_of_birth: DateTime.now(),
          firstName: "",
          gender: "",
          lastName: "",
          prefix: "",
          province: ""));
  UserInfo _userInfo = UserInfo(
    firstname_en: "",
    firstname_th: "",
    gender_en: "",
    gender_th: "",
    lastname_en: "",
    lastname_th: "",
    prefix_en: "",
    prefix_th: "",
    id: "",
    appointment: Appointment(
        date: DateTime.now(),
        doesNumber: 0,
        id: "",
        location: Location(
            id: "",
            name_en: "",
            name_th: "",
            priority: 0,
            province_en: "",
            province_th: ""),
        status: ""),
    vaccineUser: VaccineUser(id: "", maxAge: 0, minAge: 0, name: ""),
  );
  final List<Map<String, String>> dataProvince = [
    {"TH": "กรุงเทพมหานคร", "EN": "Bangkok"},
    {"TH": "สมุทรปราการ", "EN": "Samut Prakan"},
    {"TH": "นนทบุรี", "EN": "Nonthaburi"},
    {"TH": "ปทุมธานี", "EN": "Pathum Thani"},
    {"TH": "พระนครศรีอยุธยา", "EN": "Phra Nakhon Si Ayutthaya"},
    {"TH": "อ่างทอง", "EN": "Ang Thong"},
    {"TH": "ลพบุรี", "EN": "Loburi"},
    {"TH": "สิงห์บุรี", "EN": "Sing Buri"},
    {"TH": "ชัยนาท", "EN": "Chai Nat"},
    {"TH": "สระบุรี", "EN": "Saraburi"},
    {"TH": "ชลบุรี", "EN": "Chon Buri"},
    {"TH": "ระยอง", "EN": "Rayong"},
    {"TH": "จันทบุรี", "EN": "Chanthaburi"},
    {"TH": "ตราด", "EN": "Trat"},
    {"TH": "ฉะเชิงเทรา", "EN": "Chachoengsao"},
    {"TH": "ปราจีนบุรี", "EN": "Prachin Buri"},
    {"TH": "นครนายก", "EN": "Nakhon Nayok"},
    {"TH": "สระแก้ว", "EN": "Sa Kaeo"},
    {"TH": "นครราชสีมา", "EN": "Nakhon Ratchasima"},
    {"TH": "บุรีรัมย์", "EN": "Buri Ram"},
    {"TH": "สุรินทร์", "EN": "Surin"},
    {"TH": "ศรีสะเกษ", "EN": "Si Sa Ket"},
    {"TH": "อุบลราชธานี", "EN": "Ubon Ratchathani"},
    {"TH": "ยโสธร", "EN": "Yasothon"},
    {"TH": "ชัยภูมิ", "EN": "Chaiyaphum"},
    {"TH": "อำนาจเจริญ", "EN": "Amnat Charoen"},
    {"TH": "หนองบัวลำภู", "EN": "Nong Bua Lam Phu"},
    {"TH": "ขอนแก่น", "EN": "Khon Kaen"},
    {"TH": "อุดรธานี", "EN": "Udon Thani"},
    {"TH": "เลย", "EN": "Loei"},
    {"TH": "หนองคาย", "EN": "Nong Khai"},
    {"TH": "มหาสารคาม", "EN": "Maha Sarakham"},
    {"TH": "ร้อยเอ็ด", "EN": "Roi Et"},
    {"TH": "กาฬสินธุ์", "EN": "Kalasin"},
    {"TH": "สกลนคร", "EN": "Sakon Nakhon"},
    {"TH": "นครพนม", "EN": "Nakhon Phanom"},
    {"TH": "มุกดาหาร", "EN": "Mukdahan"},
    {"TH": "เชียงใหม่", "EN": "Chiang Mai"},
    {"TH": "ลำพูน", "EN": "Lamphun"},
    {"TH": "ลำปาง", "EN": "Lampang"},
    {"TH": "อุตรดิตถ์", "EN": "Uttaradit"},
    {"TH": "แพร่", "EN": "Phrae"},
    {"TH": "น่าน", "EN": "Nan"},
    {"TH": "พะเยา", "EN": "Phayao"},
    {"TH": "เชียงราย", "EN": "Chiang Rai"},
    {"TH": "แม่ฮ่องสอน", "EN": "Mae Hong Son"},
    {"TH": "นครสวรรค์", "EN": "Nakhon Sawan"},
    {"TH": "อุทัยธานี", "EN": "Uthai Thani"},
    {"TH": "กำแพงเพชร", "EN": "Kamphaeng Phet"},
    {"TH": "ตาก", "EN": "Tak"},
    {"TH": "สุโขทัย", "EN": "Sukhothai"},
    {"TH": "พิษณุโลก", "EN": "Phitsanulok"},
    {"TH": "พิจิตร", "EN": "Phichit"},
    {"TH": "เพชรบูรณ์", "EN": "Phetchabun"},
    {"TH": "ราชบุรี", "EN": "Ratchaburi"},
    {"TH": "กาญจนบุรี", "EN": "Kanchanaburi"},
    {"TH": "สุพรรณบุรี", "EN": "Suphan Buri"},
    {"TH": "นครปฐม", "EN": "Nakhon Pathom"},
    {"TH": "สมุทรสาคร", "EN": "Samut Sakhon"},
    {"TH": "สมุทรสงคราม", "EN": "Samut Songkhram"},
    {"TH": "เพชรบุรี", "EN": "Phetchaburi"},
    {"TH": "ประจวบคีรีขันธ์", "EN": "Prachuap Khiri Khan"},
    {"TH": "นครศรีธรรมราช", "EN": "Nakhon Si Thammarat"},
    {"TH": "กระบี่", "EN": "Krabi"},
    {"TH": "พังงา", "EN": "Phangnga"},
    {"TH": "ภูเก็ต", "EN": "Phuket"},
    {"TH": "สุราษฎร์ธานี", "EN": "Surat Thani"},
    {"TH": "ระนอง", "EN": "Ranong"},
    {"TH": "ชุมพร", "EN": "Chumphon"},
    {"TH": "สงขลา", "EN": "Songkhla"},
    {"TH": "สตูล", "EN": "Satun"},
    {"TH": "ตรัง", "EN": "Trang"},
    {"TH": "พัทลุง", "EN": "Phatthalung"},
    {"TH": "ปัตตานี", "EN": "Pattani"},
    {"TH": "ยะลา", "EN": "Yala"},
    {"TH": "นราธิวาส", "EN": "Narathiwat"},
    {"TH": "บึงกาฬ", "EN": "Buogkan"}
  ];

  AuthenicateProvider();

  bool get isAuth {
    return token.isNotEmpty;
  }

  UserInfo get userInfo {
    return _userInfo;
  }

  String get token {
    return _token;
  }

  String get nameHospitals {
    return locationAppointment;
  }

  Personal get personal {
    return _personal;
  }

  List<Hospital> get hospital {
    return _hospital;
  }

  Location get locationUser {
    return location;
  }

  List<Person> get person {
    return _person;
  }

  String get refCode {
    return _refCode;
  }

  String get refCodeAddPerson {
    return _refCodeAddPerson;
  }

  String get numberUser {
    return _number;
  }

  Future<void> check(String nationalID, String laserID) async {
    try {
      final response = await Dio().post(apiEndpoint + '/person/add/check',
          data: {
            "nationalID": nationalID,
            "laserID": laserID,
          },
          options: Options(headers: {"Authorization": "Bearer " + token}));
      if (response.data['refCode'] != null) {
        _refCodeAddPerson = response.data['refCode'];
        _number = response.data['phoneNumber'];
      }
      if (response.data['id'] != null) {
        _personal = Personal(
            en: Information(
                date_of_birth:
                    DateTime.parse(response.data['en']['date_of_birth']),
                firstName: response.data['en']['firstname'],
                gender: response.data['en']['gender'],
                lastName: response.data['en']['lastname'],
                prefix: response.data['en']['prefix'],
                province: response.data['en']['province']),
            id: response.data['id'],
            laserId: response.data['laserID'],
            th: Information(
                date_of_birth:
                    DateTime.parse(response.data['th']['date_of_birth']),
                firstName: response.data['th']['firstname'],
                gender: response.data['th']['gender'],
                lastName: response.data['th']['lastname'],
                prefix: response.data['th']['prefix'],
                province: response.data['th']['province']));
      }
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> addPersonVerification(String otp) async {
    try {
      final response = await Dio().get(apiEndpoint + '/person/add/verify',
          queryParameters: {"otp": otp},
          options: Options(headers: {"Authorization": "Bearer " + token}));
      final data = response.data.toList();
      List<Person> tempPerson = [];
      for (int i = 0; i < data.length; i++) {
        tempPerson.add(Person(
            firstname_en: data[i]['firstname_en'],
            firstname_th: data[i]['firstname_th'],
            gender_en: data[i]['gender_en'],
            gender_th: data[i]['gender_th'],
            id: data[i]['_id'],
            lastname_en: data[i]['lastname_en'],
            lastname_th: data[i]['lastname_th'],
            prefix_en: data[i]['prefix_en'],
            prefix_th: data[i]['prefix_th']));
      }
      _person = tempPerson;
      _refCodeAddPerson = "";

      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(otpException);
      } else if (error.response!.statusCode == 401) {
        throw HttpException(jwtException);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> login(String nationalID, String phoneNumber) async {
    try {
      final response = await Dio().post(apiEndpoint + '/auth/login',
          data: {"nationalID": nationalID, "phoneNumber": phoneNumber});
      _refCode = response.data['refCode'];
      _number = phoneNumber;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException('National ID or phone number is not correct',
            'เลขประจำตัวประชาชนหรือเบอร์โทรศัพท์ไม่ถูกต้อง');
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> getLocation() async {
    try {
      final response = await Dio().get(apiEndpoint + '/location/prefered',
          options: Options(headers: {"Authorization": "Bearer " + token}));
      location = Location(
          id: response.data['_id'],
          name_en: response.data['name_en'],
          name_th: response.data['name_th'],
          priority: response.data['priority'],
          province_en: response.data['province_en'],
          province_th: response.data['province_th']);
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<Location> getPreferedLocation() async {
    try {
      // if (locationAppointment == '') {
      final response = await Dio().get(apiEndpoint + '/location/prefered',
          options: Options(headers: {"Authorization": "Bearer " + token}));
      location = Location(
        id: response.data['_id'],
        name_en: response.data['name_en'],
        name_th: response.data['name_th'],
        priority: response.data['priority'],
        province_en: response.data['province_en'],
        province_th: response.data['province_th'],
      );
      // locationAppointment = response.data['name_en'];
      // locationAppointmentID = response.data['_id'];
      // nameProvinceAppointment = response.data['province_en'];
      // } else {
      //   if (nameHospital == "") {
      //     locationAppointment = tempName;
      //   } else {
      //     tempName = nameHospital;
      //   }
      //   if (locationID == "") {
      //     locationAppointmentID = tempID;
      //   } else {
      //     tempID = locationID;
      //   }
      //   if (province == "") {
      //     nameProvinceAppointment = tempProvince;
      //   } else {
      //     tempProvince = province;
      //   }
      // }
      notifyListeners();
      return location;
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> updateLocation(String locationID) async {
    try {
      final response = await Dio().patch(apiEndpoint + '/location/prefered',
          data: {'locationId': locationID},
          options: Options(headers: {"Authorization": "Bearer " + token}));
      location = Location(
          id: response.data['_id'],
          name_en: response.data['name_en'],
          name_th: response.data['name_th'],
          priority: response.data['priority'],
          province_en: response.data['province_en'],
          province_th: response.data['province_th']);

      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> personRegister(
      String nationalID, String laserID, String phoneNumber) async {
    try {
      final response = await Dio().post(apiEndpoint + '/person/add/regis',
          data: {
            "nationalID": nationalID,
            "laserID": laserID,
            "phoneNumber": phoneNumber
          },
          options: Options(headers: {"Authorization": "Bearer " + token}));
      _refCodeAddPerson = response.data['refCode'];
      _number = phoneNumber;

      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> getName() async {
    locationAppointment = "";
    locationAppointmentID = "";
    nameProvinceAppointment = "";
    try {
      final response = await Dio().get(apiEndpoint + '/appointment/landing',
          options: Options(headers: {"Authorization": "Bearer " + token}));
      _userInfo = UserInfo(
          firstname_en: response.data['firstname_en'],
          firstname_th: response.data['firstname_th'],
          gender_en: response.data['gender_en'],
          gender_th: response.data['gender_th'],
          lastname_en: response.data['lastname_en'],
          lastname_th: response.data['lastname_th'],
          prefix_en: response.data['prefix_en'],
          prefix_th: response.data['prefix_th'],
          id: response.data['id'],
          appointment: response.data['appointment']['_id'] == null
              ? null
              : Appointment(
                  date:
                      DateTime.parse(response.data['appointment']['dateTime']),
                  doesNumber: response.data['appointment']['doesNumber'],
                  id: response.data['appointment']['_id'],
                  status: response.data['appointment']['status'],
                  location: Location(
                      id: response.data['appointment']['location']['_id'],
                      name_en: response.data['appointment']['location']
                          ['name_en'],
                      name_th: response.data['appointment']['location']
                          ['name_th'],
                      priority: response.data['appointment']['location']
                          ['priority'],
                      province_en: response.data['appointment']['location']
                          ['province_en'],
                      province_th: response.data['appointment']['location']
                          ['province_th'])),
          vaccineUser: response.data['vaccine'] == null
              ? null
              : VaccineUser(
                  id: response.data['vaccine']['_id'],
                  maxAge: response.data['appointment']['maxAge'],
                  minAge: response.data['appointment']['minAge'],
                  name: response.data['appointment']['name']));

      notifyListeners();
    } on DioError catch (error) {
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> getHospitalLocation(String province) async {
    try {
      final response = await Dio().get(apiEndpoint + '/location',
          queryParameters: {"province": province});

      List<Hospital> tempHospital = [];
      final data = response.data.toList();
      for (int j = 0; j < data.length; j++) {
        List<Vaccine> temp = [];

        final something = data[j]['vaccines'].toList();
        for (int i = 0; i < something.length; i++) {
          temp.add(Vaccine(
              amount: something[i]['amount'],
              availble: something[i]['avaliable'],
              name: something[i]['name']));
        }
        tempHospital.add(
          Hospital(
              id: data[j]['_id'],
              name_en: data[j]['name_en'],
              name_th: data[j]['name_th'],
              priority: data[j]['priority'],
              province_en: data[j]['province_en'],
              province_th: data[j]['province_th'],
              vaccine: temp),
        );
      }

      _hospital = tempHospital;
      notifyListeners();
    } on DioError catch (error) {
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> getUserInformation(String nationalID, String laserID) async {
    try {
      final response = await Dio().get(apiEndpoint + '/user/nationalInfo',
          queryParameters: {"nationalID": nationalID, "laserID": laserID});
      _personal = Personal(
          en: Information(
              date_of_birth:
                  DateTime.parse(response.data['en']['date_of_birth']),
              firstName: response.data['en']['firstname'],
              gender: response.data['en']['gender'],
              lastName: response.data['en']['lastname'],
              prefix: response.data['en']['prefix'],
              province: response.data['en']['province']),
          id: response.data['id'],
          laserId: response.data['laserID'],
          th: Information(
              date_of_birth:
                  DateTime.parse(response.data['th']['date_of_birth']),
              firstName: response.data['th']['firstname'],
              gender: response.data['th']['gender'],
              lastName: response.data['th']['lastname'],
              prefix: response.data['th']['prefix'],
              province: response.data['th']['province']));
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException('National ID or Laser ID is not correct',
            'เลขประจำตัวประชาชนหรือรหัสหลังบัตรประชาชนไม่ถูกต้อง');
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> register(String nationalID, String laserID, String phoneNumber,
      String preferedLocation) async {
    try {
      final response = await Dio().post(apiEndpoint + '/auth/regis', data: {
        "nationalID": nationalID,
        "laserID": laserID,
        'phoneNumber': phoneNumber,
        'preferedLocation': preferedLocation
      });
      _number = phoneNumber;
      _refCode = response.data['refCode'];
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException('Phone number or selected location is not correct',
            'เบอร์โทรศัพท์หรือสถานที่ที่เลือกไม่ถูกต้อง');
      } else if (error.response!.statusCode == 404) {
        throw HttpException('National ID or Laser ID is not correct',
            'เลขประจำตัวประชาชนหรือรหัสหลังบัตรประชาชนไม่ถูกต้อง');
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> verification(String otp) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response =
          await Dio().get(apiEndpoint + '/auth/verify', queryParameters: {
        "otp": otp,
      });
      final token = response.data["token"];
      _token = token;
      prefs.setString('userToken', _token);
      notifyListeners();
    } on DioError catch (error) {
      prefs.clear();
      if (error.response!.statusCode == 400) {
        throw HttpException('OTP code is expired or not correct',
            'รหัส OTP หมดอายุหรือไม่ถูกต้อง');
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      this._token = "";
    } on DioError catch (error)  {
      // For future error handling
      throw HttpException(generalException, generalExceptionTH);
    }
  }
}
