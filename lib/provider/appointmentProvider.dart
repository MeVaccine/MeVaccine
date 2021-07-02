import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:mevaccine/config/string.dart';
import 'package:mevaccine/model/httpException.dart';

class Appoints {
  String status;
  String id;
  DateTime dateTime;
  int doseNumber;
  String nameHospital_th;
  String nameHospital_en;
  String vaccineName;
  Appoints(
      {required this.status,
      required this.id,
      required this.dateTime,
      required this.doseNumber,
      required this.nameHospital_th,
      required this.nameHospital_en,
      required this.vaccineName});
}

class AppointProvider with ChangeNotifier {
  String _token;
  AppointProvider(this._token);

  Future<void> getAppointment() async {
    try {
      final response = await Dio().get(apiEndpoint + '/appointment',
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      final data = response.data.toList();
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw HttpException(jwtException);
      }
    }
  }
}

// Future<void> getAppointment() async {
//     try {
//       final response = await Dio().get(apiEndpoint + '/appointment',
//           options: Options(headers: {"Authorization": "Bearer " + token}));
//       final data = response.data.toList();
//     } on DioError catch (error) {
//       if (error.response!.statusCode == 401) {
//         throw HttpException(jwtException);
//       }
//     }
//   }
