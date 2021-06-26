import 'dart:async';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import '../model/httpException.dart';

class UserInfo {
  String firstname_th;
  String firstname_en;
  Appointment? appointment;
  VaccineUser? vaccineUser;
  UserInfo(
      {required this.firstname_th,
      required this.firstname_en,
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
  List<String> dataprovince = [
    'Bangkok',
    'Samut Prakan',
    'Nonthaburi',
    'Pathum Thani',
    'Phra Nakhon Si Ayutthaya',
    'Ang Thong',
    'Loburi',
    'Sing Buri',
    'Chai Nat',
    'Saraburi',
    'Chon Buri',
    'Rayong',
    'Chanthaburi',
    'Trat',
    'Chachoengsao',
    'Prachin Buri',
    'Nakhon Nayok',
    'Sa Kaeo',
    'Nakhon Ratchasima',
    'Buri Ram',
    'Surin',
    'Si Sa Ket',
    'Ubon Ratchathani',
    'Yasothon',
    'Chaiyaphum',
    'Amnat Charoen',
    'Nong Bua Lam Phu',
    'Khon Kaen',
    'Udon Thani',
    'Loei',
    'Nong Khai',
    'Maha Sarakham',
    'Roi Et',
    'Kalasin',
    'Sakon Nakhon',
    'Nakhon Phanom',
    'Mukdahan',
    'Chiang Mai',
    'Lamphun',
    'Lampang',
    'Uttaradit',
    'Phrae',
    'Nan',
    'Phayao',
    'Chiang Rai',
    'Mae Hong Son',
    'Nakhon Sawan',
    'Uthai Thani',
    'Kamphaeng Phet',
    'Tak',
    'Sukhothai',
    'Phitsanulok',
    'Phichit',
    'Phetchabun',
    'Ratchaburi',
    'Kanchanaburi',
    'Suphan Buri',
    'Nakhon Pathom',
    'Samut Sakhon',
    'Samut Songkhram',
    'Phetchaburi',
    'Prachuap Khiri Khan',
    'Nakhon Si Thammarat',
    'Krabi',
    'Phangnga',
    'Phuket',
    'Surat Thani',
    'Ranong',
    'Chumphon',
    'Songkhla',
    'Satun',
    'Trang',
    'Phatthalung',
    'Pattani',
    'Yala',
    'Narathiwat',
    'buogkan'
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
                gender: response.data['th']['firstname'],
                lastName: response.data['th']['firstname'],
                prefix: response.data['th']['firstname'],
                province: response.data['th']['firstname']));
      }
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw HttpException(incorrectAuthException);
      }
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
        throw HttpException(incorrectAuthException);
      }
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
    }
  }

  Future<void> getLocationAppointment(
      String nameHospital, String locationID, String province) async {
    try {
      if (locationAppointment == '') {
        final response = await Dio().get(apiEndpoint + '/location/prefered',
            options: Options(headers: {"Authorization": "Bearer " + token}));
        location = Location(
            id: response.data['_id'],
            name_en: response.data['name_en'],
            name_th: response.data['name_th'],
            priority: response.data['priority'],
            province_en: response.data['province_en'],
            province_th: response.data['province_th']);
        locationAppointment = response.data['name_en'];
        locationAppointmentID = response.data['_id'];
        nameProvinceAppointment = response.data['province_en'];
      } else {
        if (nameHospital == "") {
          locationAppointment = tempName;
        } else {
          tempName = nameHospital;
        }
        if (locationID == "") {
          locationAppointmentID = tempID;
        } else {
          tempID = locationID;
        }
        if (province == "") {
          nameProvinceAppointment = tempProvince;
        } else {
          tempProvince = province;
        }
      }

      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(incorrectAuthException);
      }
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
      throw HttpException(getUserException);
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
      throw HttpException(generalException);
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
              gender: response.data['th']['firstname'],
              lastName: response.data['th']['firstname'],
              prefix: response.data['th']['firstname'],
              province: response.data['th']['firstname']));
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException(notFoundException);
      } else {
        throw HttpException(wrongFormat);
      }
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
        throw HttpException(wrongFormat);
      } else if (error.response!.statusCode == 404) {
        throw HttpException(notFoundNational);
      }
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
        throw HttpException(otpException);
      }
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      this._token = "";
    } catch (error) {
      // For future error handling
      print(error);
    }
  }
}
