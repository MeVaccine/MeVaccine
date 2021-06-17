import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../person/card_person_appoint.dart';

class ListPerson extends StatelessWidget {
  var list = [
    'Sethanant Pipatpakorn',
    'Kavisara Srisuwatcharee',
    'Thanakorn Aunglunchuchod',
    'Thanaphon Sombunkaeo',
    'Wisarut Kitticharoenphonngam'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 370,
        // color: primary01,

        child: ListView(
          children: [
            for (var item in list)
              CardPersonAppoint(
                text: item,
              ),
            kSizedBoxVerticalS,
          ],
        ));
  }
}
