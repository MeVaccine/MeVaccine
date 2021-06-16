import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/widget/auth/register_TextForm.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/layout/list_timeTable.dart';
import '../../widget/Logo/empty_person.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';
import '../appointment/step4_screen.dart';
import 'package:mevaccine/screen/appointment/step2_screen.dart';

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
        Container(
          height: 490,
          child: Column(
            children: [
              kSizedBoxVerticalS,
              RegisterTextForm(
                  label: 'Select Date',
                  type: RegsiterTextFormType.calendar,
                  active: RegisterActiveType.disable),
              ListTimeTable()
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kSizeS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Step2.routeName);
                },
                text: 'Previous',
                color: accent02,
                width: 120,
              ),
              SmallButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Step4.routeName);
                },
                text: 'Next',
                color: accent02,
                width: 120,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
