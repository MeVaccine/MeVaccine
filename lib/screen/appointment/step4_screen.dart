import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import '../../widget/Logo/empty_person.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';

class Step4 extends StatelessWidget {
  static const routeName = '/step4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        LayoutAppointment(
          text: 'Select vaccine',
          description: 'for each of person including you.',
          step: '4 of 4',
          value: 0.3,
        ),
        kSizedBoxVerticalS,
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
