import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../button/menus_navigator.dart';
import '../../screen/appointment/step1_screen.dart';
import '../../screen/person_screen.dart';
import '../../screen/historyVaccinate_screen.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: MainText(
              'Menus', text_type.regular, kFontSizeHeadline4, primary01),
        ),
        Container(
          height: kSizeXXL * 1.19,
          child: ListView(
            children: [
              MenuNavigator(
                text: 'Appointment',
                onPressed: () {
                  Navigator.of(context).pushNamed(Step1.routeName);
                },
              ),
              kSizedBoxXXS,
              MenuNavigator(
                text: 'History of Vacation',
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(HistoryVaccinateScreen.routeName);
                },
              ),
              kSizedBoxXXS,
              MenuNavigator(
                text: 'Person',
                onPressed: () {
                  Navigator.of(context).pushNamed(PersonScreen.routeName);
                },
              ),
              kSizedBoxXXS,
              MenuNavigator(
                text: 'Symptom assessment Form',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
