import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../button/menus_navigator.dart';
import '../../screen/appointment/step1_screen.dart';
import '../../screen/person_screen.dart';
import '../../screen/historyVaccinate_screen.dart';
import '../../screen/symptom_form_screen.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: MainText(Languages.of(context)!.menuHeading, text_type.regular,
              kFontSizeHeadline4, primary01),
        ),
        Container(
          height: kSizeXXL * 1.25,
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: 10),
            children: [
              MenuNavigator(
                text: Languages.of(context)!.newAppointmentMenuLebel,
                onPressed: () {
                  Provider.of<NewAppointmentProvider>(context, listen: false)
                      .resetData();
                  Navigator.of(context).pushNamed(Step1.routeName);
                },
              ),
              kSizedBoxXXS,
              MenuNavigator(
                text: Languages.of(context)!.myAppointmentMenuLebel,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(HistoryVaccinateScreen.routeName);
                },
              ),
              kSizedBoxXXS,
              MenuNavigator(
                text: Languages.of(context)!.personMenuLebel,
                onPressed: () {
                  Navigator.of(context).pushNamed(PersonScreen.routeName);
                },
              ),
              kSizedBoxXXS,
              MenuNavigator(
                text: Languages.of(context)!.symptomFormMenuLebel,
                onPressed: () {
                  Navigator.of(context).pushNamed(SymptomFormScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
