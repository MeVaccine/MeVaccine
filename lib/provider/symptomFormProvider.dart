import 'dart:async';
import 'dart:io';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
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
  Location? location;
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
      required this.location,
      required this.prefix_th,
      required this.vaccineUser});
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

class SymptomfromProvider with ChangeNotifier {
  String token;
  SymptomfromProvider({required this.token});
  bool errorStatusCode = false;
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
    location: Location(
        id: "",
        name_en: "",
        name_th: "",
        priority: 0,
        province_en: "",
        province_th: ""),
    vaccineUser: VaccineUser(id: "", maxAge: 0, minAge: 0, name: ""),
  );
  UserInfo get userInfo {
    return _userInfo;
  }

  Future<void> checkUser([String? id]) async {
    try {
      final response = await Dio().get(apiEndpoint + '/symptom/eligible',
          queryParameters: id == null ? null : {'userId': id},
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
          id: response.data['_id'],
          location: Location(
              id: response.data['location']['_id'],
              name_en: response.data['location']['name_en'],
              name_th: response.data['location']['name_th'],
              priority: response.data['location']['priority'],
              province_en: response.data['location']['province_en'],
              province_th: response.data['location']['province_th']),
          vaccineUser: response.data['vaccine'] == null
              ? null
              : VaccineUser(
                  id: response.data['vaccine']['_id'],
                  maxAge: response.data['vaccine']['maxAge'],
                  minAge: response.data['vaccine']['minAge'],
                  name: response.data['vaccine']['name']));
    } on DioError catch (error) {
      if (error.response!.statusCode == 409) {
        errorStatusCode = true;
        print(error.response!.statusCode);
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> sumbitForm(bool headache, bool nausea, bool fatigue, bool chills,
      bool musclePain, bool tiredness, String others) async {
    try {
      final response = await Dio().post(apiEndpoint + '/symptom/new',
          queryParameters:
              _userInfo.id.isEmpty ? null : {'userId': _userInfo.id},
          data: {
            'headache': headache,
            'nausea': nausea,
            'fatigue': fatigue,
            'chills': chills,
            'musclePain': musclePain,
            'tiredness': tiredness,
            'others': others
          },
          options: Options(headers: {"Authorization": "Bearer " + token}));
    } on DioError catch (error) {
      if (error.response!.statusCode == 409) {
        errorStatusCode = true;
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }
}
