import 'package:flutter/material.dart';
import '../../config/constants.dart';

class LogoMedkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSizeXL,
      height: kSizeXL,
      child:
          Image.asset('assets/images/med-kit.png', fit: BoxFit.contain),
    );
  }
}
