import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';

class LogoVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSizeXXL * 1.5,
      height: kSizeXXL * 1.2,
      child:
          Image.asset('assets/images/logo-otp.png', fit: BoxFit.contain),
    );
  }
}