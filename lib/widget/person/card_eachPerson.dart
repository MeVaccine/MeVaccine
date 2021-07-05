import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../model/textType.dart';
import '../../widget/person/buttonEachPerson.dart';

class CardEachPerson extends StatelessWidget {
  String fullName;
  String id;
  CardEachPerson({required this.fullName, required this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: kSizeXL * 1.25,
      width: double.infinity,
      decoration:
          BoxDecoration(color: white, borderRadius: kBorderRadiusS, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
            color: const Color(0xFF7090B0).withOpacity(0.2))
      ]),
      child: Column(
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/user-profile.png',
              ),
              radius: kSizeS * 1.6,
            ),
            kSizedBoxHorizontalS,
            MainText(fullName, text_type.regular, kFontSizeHeadline4 * 0.7,
                primary01),
          ]),
          ButtonEachPerson(
            text: Languages.of(context)!.myAppointmentMenuLebel,
          ),
          kSizedBoxVerticalS,
          ButtonEachPerson(
            text: Languages.of(context)!.symptomFormMenuLebel,
          ),
        ],
      ),
    );
  }
}
