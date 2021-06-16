import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/screen/appointment/step3_screen.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/layout/your_appointment.dart';
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
        Container(
          height: 490,
          child: Column(
            children: [
              Container(
                width: 330,
                child: YourAppointment(
                    checkColor: '1',
                    checkInfo: '',
                    height: 0,
                    isAppoint: '',
                    width: 0),
              ),
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
                  Navigator.of(context).pushNamed(Step3.routeName);
                },
                text: 'Previous',
                color: accent02,
                width: 120,
              ),
              SmallButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Step4.routeName);
                },
                text: 'Submit',
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
