import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import '../../widget/Logo/empty_person.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';
import '../appointment/step3_screen.dart';
import '../../widget/layout/list_vaccine.dart';

class Step2 extends StatelessWidget {
  static const routeName = '/step2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        LayoutAppointment(
          text: 'Select vaccine location',
          description: 'which you want to go.',
          step: '2 of 4',
          value: 0.3,
        ),
        kSizedBoxVerticalS,
        ListVaccine(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kSizeS),
          child: Align(
            alignment: Alignment.topRight,
            child: SmallButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Step3.routeName);
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
