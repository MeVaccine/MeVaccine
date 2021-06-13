import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import '../../widget/Logo/empty_person.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';
import '../appointment/step4_screen.dart';

class Step3 extends StatelessWidget {
  static const routeName = '/step3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        LayoutAppointment(
          text: 'Select Date and time',
          description: 'which you want to.',
          step: '3 of 4',
          value: 0.3,
        ),
        kSizedBoxVerticalS,
        Container(
          margin: EdgeInsets.symmetric(horizontal: kSizeS),
          child: Align(
            alignment: Alignment.topRight,
            child: SmallButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Step4.routeName);
              },
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
