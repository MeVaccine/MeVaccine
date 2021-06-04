import 'package:flutter/material.dart';
import '../../config/constants.dart';

class LogoRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSizeXXL * 1.5,
      height: kSizeXXL * 1.3,
      child:
          Image.asset('assets/images/logo-register.png', fit: BoxFit.contain),
    );
  }
}
