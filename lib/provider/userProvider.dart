import 'dart:async';
import '../config/string.dart';
import 'package:dio/dio.dart';
import 'package:mevaccine/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import '../model/httpException.dart';

class UserProvider with ChangeNotifier {
  String token;
  UserProvider({required this.token});
  String _refCode = "";
  String _number = "";
  String get number {
    return _number;
  }

  String get refCode {
    return _refCode;
  }

  Future<void> verifyPhone(String otp) async {
    try {
      final response = await Dio().get(apiEndpoint + '/user/phone/verify',
          queryParameters: {'otp': otp},
          options: Options(headers: {"Authorization": "Bearer " + token}));
      notifyListeners();
    } on DioError catch (error) {
      // if (error.response!.statusCode == 401) {
      //   throw HttpException(jwtException);
      // } else
      if (error.response!.statusCode == 400) {
        throw HttpException('OTP code is expired or not correct',
            'รหัส OTP หมดอายุหรือไม่ถูกต้อง');
      }
      throw HttpException(generalException, generalExceptionTH);
    }
  }

  Future<void> changeNumber(String phoneNumber) async {
    try {
      final response = await Dio().patch(apiEndpoint + '/user/phone',
          data: {'phoneNumber': phoneNumber},
          options: Options(headers: {"Authorization": "Bearer " + token}));
      _refCode = response.data['refCode'];
      _number = phoneNumber;

      notifyListeners();
    } on DioError catch (error) {
      // if (error.response!.statusCode == 401) {
      //   throw HttpException(jwtException);
      // }
      throw HttpException(generalException, generalExceptionTH);
    }
  }
}
