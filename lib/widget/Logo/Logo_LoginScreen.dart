import 'package:flutter/material.dart';
import '../../config/constants.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSizeXXL * 1.5,
      height: kSizeXXL * 1.5,
      child: Image.asset('assets/images/logo-login.png',fit:BoxFit.contain),
      
    );
  }
}