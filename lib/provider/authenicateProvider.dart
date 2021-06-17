import 'dart:async';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import '../model/httpException.dart';

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
  String _token = "";
  List<Hospital> _hospital = [];
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

  AuthenicateProvider();

  bool get isAuth {
    return token.length != 0;
  }

  String get token {
    return _token;
  }

  Personal get personal {
    return _personal;
  }

  List<Hospital> get hospital {
    return _hospital;
  }

  String get refCode {
    return _refCode;
  }

  String get numberUser {
    return _number;
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
      print(error);
      throw HttpException(generalException);
    }
  }

  Future<void> getUserInformation(String nationalID, String laserID) async {
    try {
      final response = await Dio().get(apiEndpoint + '/user/nationalInfo',
          queryParameters: {"nationalID": nationalID, "laserID": laserID});
      _personal = Personal(
          en: Information(
              date_of_birth: DateTime.now(),
              firstName: response.data['en']['firstname'],
              gender: response.data['en']['gender'],
              lastName: response.data['en']['lastname'],
              prefix: response.data['en']['prefix'],
              province: response.data['en']['province']),
          id: response.data['id'],
          laserId: response.data['laserID'],
          th: Information(
              date_of_birth: DateTime.now(),
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
}
