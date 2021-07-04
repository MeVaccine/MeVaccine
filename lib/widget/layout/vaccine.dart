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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                VaccineIcon(width: 50, height: 16),
                MainText(text, text_type.regular, 16, primary01),
              ],
            ),
            MainText(number.toString(), text_type.regular, 16, primary01),
          ],
        ));
  }
}
