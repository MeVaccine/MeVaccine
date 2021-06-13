import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../person/card_person_appoint.dart';

class listPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 370,
        // color: primary01,
        child: ListView(
          children: [
            cardPersonAppoint(),
            kSizedBoxVerticalS,
            cardPersonAppoint(),
            kSizedBoxVerticalS,
            cardPersonAppoint(),
            kSizedBoxVerticalS,
            cardPersonAppoint(),
            kSizedBoxVerticalS,
          ],
        ));
  }
}
