import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/localization/language/languages.dart';
import '../../config/constants.dart';

class LogoHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: kSizeXXL * 1.5,
          height: kSizeXXL * 1.3,
          child: Image.asset('assets/images/logo-history.png',
              fit: BoxFit.contain),
        ),
        Text(
          Languages.of(context)!.noAppointmentMessage,
          textAlign: TextAlign.center,
          style: TextStyle(color: primary01),
        )
      ],
    );
  }
}
