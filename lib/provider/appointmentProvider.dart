import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:mevaccine/config/string.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';

class Appointment {
  String status;
  String id;
  DateTime dateTime;
  int doseNumber;
  Location location;
  VaccineUser vaccine;
  Appointment(
      {required this.status,
      required this.id,
      required this.dateTime,
      required this.doseNumber,
      required this.location,
      required this.vaccine});
}

class AppointmentProvider with ChangeNotifier {
  String _token;
  AppointmentProvider(this._token);
  List<Appointment> appointments = [];
  Future<void> getAppointment([String? userId]) async {
    try {
      final response = await Dio().get(apiEndpoint + '/appointment',
          queryParameters: {'id': userId},
          options: Options(headers: {"Authorization": "Bearer " + _token}));
      final data = response.data.toList();
      List<Appointment> tempAppointment = [];
      for (var appointment in data) {
        tempAppointment.add(Appointment(
            status: appointment['status'],
            id: appointment['_id'],
            dateTime: DateTime.parse(appointment['dateTime']).toLocal(),
            doseNumber: appointment['doseNumber'],
            location: Location(
                name_en: appointment['location']['name_en'],
                name_th: appointment['location']['name_th'],
                id: appointment['location']['_id'],
                priority: appointment['location']['priority'],
                province_en: appointment['location']['province_en'],
                province_th: appointment['location']['province_th']),
            vaccine: VaccineUser(
                id: appointment['vaccine']['_id'],
                maxAge: appointment['vaccine']['maxAge'],
                minAge: appointment['vaccine']['minAge'],
                name: appointment['vaccine']['name'])));
      }
      appointments = tempAppointment;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response!.statusCode == 401) {
        throw HttpException(jwtException);
      }
    }
  }

  void resetData() {
    this.appointments = [];
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
