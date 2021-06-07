import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../config/constants.dart';
import '../widget/layout/profile.dart';
import '../widget/layout/your_appointment.dart';
import '../widget/layout/menu.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landing-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kSizeS*1.5,vertical: kSizeL),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(),
            kSizedBoxS,
            MainText('Schedule', text_type.regular,kFontSizeHeadline4,primary01),
            YourAppointment(),
            Menu()
          ],
        ),
      ),
    );
  }
}
