import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';

class Step1 extends StatelessWidget {
  static const routeName = '/step1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        LayoutAppointment(
          text: 'Select Person',
          description: 'who goes to vacinate together',
          step: '1 of 4',
          value: 0.3,
        ),
        kSizedBoxVerticalS,
        ProfileCard(),
        Center(
          child: SizedBox(
            width: double.infinity,
            height: kSizeXXL * 1.4,
            child: Image.asset('assets/images/person_empty.png'),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kSizeS),
          child: Align(
            alignment: Alignment.topRight,
            child: SmallButton(
              onPressed: () {},
              text: 'Next',
              color: accent02,
              width: 120,
            ),
          ),
        )
      ],
    ));
  }
}
