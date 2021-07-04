// ignore_for_file: file_names

import 'dart:async';
import 'package:mevaccine/provider/authenicateProvider.dart';

import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:flutter/foundation.dart';
import '../model/httpException.dart';

class Vaccines {
  String name;
  int amount;
  int avaliable;
  Vaccines({required this.name, required this.amount, required this.avaliable});
}

class LocationProvider with ChangeNotifier {
  String token;

  LocationProvider({required this.token});
  List<Vaccines> _vaccine = [];
  String checkVaccine = '';
  List<Hospital> _hospitals = [];

  List<Vaccines> get vaccine {
    return _vaccine;
  }

  List<Hospital> get hospitals => [..._hospitals];

  Future<List<Location>> getLocationByProvince(String province) async {
    try {
      final response = await Dio().get(apiEndpoint + '/location',
          queryParameters: {"province": province});

      List<Location> tempHospital = [];
      final data = response.data.toList();
      for (int j = 0; j < data.length; j++) {
        tempHospital.add(
          Location(
              id: data[j]['_id'],
              name_en: data[j]['name_en'],
              name_th: data[j]['name_th'],
              priority: data[j]['priority'],
              province_en: data[j]['province_en'],
              province_th: data[j]['province_th']),
        );
      }
      return tempHospital;
    } on DioError catch (error) {
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> getVaccine(String locationID) async {
    try {
      final response = await Dio().get(
          apiEndpoint + '/location/vaccines/${locationID}',
          options: Options(headers: {"Authorization": "Bearer " + token}));

      final data = response.data.toList();
      List<Vaccines> tempVaccine = [];
      for (int i = 0; i < data.length; i++) {
        tempVaccine.add(Vaccines(
            amount: data[i]['amount'],
            name: data[i]['name'],
            avaliable: data[i]['avaliable']));
      }
      _vaccine = tempVaccine;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw HttpException('Your selected location is invalid',
            'สถานที่ที่คุณเลือกไม่ถูกต้อง');
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }
}
