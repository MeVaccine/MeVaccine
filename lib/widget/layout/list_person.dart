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
            CardPersonAppoint(
              text: 'Sethanant Pipatpakorn',
            ),
            kSizedBoxVerticalS,
            CardPersonAppoint(
              text: 'Kavisara Srisuwatcharee',
            ),
            kSizedBoxVerticalS,
            CardPersonAppoint(
              text: 'Thanakorn Aunglunchuchod',
            ),
            kSizedBoxVerticalS,
            CardPersonAppoint(
              text: 'Sethanant Pipatpakorn',
            ),
            kSizedBoxVerticalS,
            CardPersonAppoint(
              text: 'Kavisara Srisuwatcharee',
            ),
            kSizedBoxVerticalS,
          ],
        ));
  }
}
