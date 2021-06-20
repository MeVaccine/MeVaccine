import 'dart:async';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import '../model/httpException.dart';

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

class PersonProvider with ChangeNotifier {
  String token;
  String name_en;
  String name_th;
  PersonProvider(
      {required this.token, required this.name_en, required this.name_th});
  List<Person> _person = [];
  String get nameEn {
    return name_en;
  }

  String get nameTh {
    return name_th;
  }

  List<Person> get person {
    return _person;
  }

  bool get isPersonEmpty {
    return (_person.isEmpty);
  }

  Future<void> getPerson() async {
    try {
      final response = await Dio().get(apiEndpoint + '/person/lists',
          options: Options(headers: {"Authorization": "Bearer " + token}));
      print(response.data);
      final data = response.data.toList();
      List<Person> tempPerson = [];
      for (int i = 0; i < data.length; i++) {
        print(data[i]['firstname_en']);
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

      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw HttpException(jwtException);
      }
    }
  }
}