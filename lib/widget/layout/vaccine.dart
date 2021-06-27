import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../Logo/icon_vaccine.dart';
import '../../model/textType.dart';

class Vaccine extends StatelessWidget {
  final String text;
  final int number;
  Vaccine({required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        height: 25,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                VaccineIcon(),
                MainText(text, text_type.regular, 12, primary01),
              ],
            ),
            MainText(
                '(' + number.toString() + ')', text_type.regular, 12, primary01),
          ],
        ));
  }
}
