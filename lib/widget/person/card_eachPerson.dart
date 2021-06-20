import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../model/textType.dart';

class CardEachPerson extends StatelessWidget {
  String firstname;
  String lastname;
  CardEachPerson({required this.firstname, required this.lastname});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      height: kSizeXL,
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
            MainText(firstname + " " + lastname, text_type.regular,
                kFontSizeHeadline4 * 0.7, primary01),
          ]),
        ],
      ),
    );
  }
}
