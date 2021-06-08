import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../button/menus_navigator.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: MainText(
                'Menus', text_type.regular, kFontSizeHeadline4, primary01),
          ),
          kSizedBoxVerticalXS,
          MenuNavigator(
            text: 'Appointment',
            onPressed: () {},
          ),
          kSizedBoxS,
           MenuNavigator(
            text: 'History of Vacation',
            onPressed: () {},
          ),
          kSizedBoxM,
           MenuNavigator(
            text: 'Person',
            onPressed: () {},
          ),
          kSizedBoxM,
           MenuNavigator(
            text: 'Symptom assessment Form',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
