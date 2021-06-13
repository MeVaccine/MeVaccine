import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/color.dart';
import '../../config/constants.dart';
import '../text/mainText.dart';
import '../../model/textType.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: kBorderRadiusS, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
            color: const Color(0xFF7090B0).withOpacity(0.2))
      ]),
      margin: const EdgeInsets.all(20),
      padding:
          const EdgeInsets.symmetric(horizontal: kSizeS, vertical: kSizeS * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/user-profile.png',
              ),
              radius: kSizeS * 1.5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kSizeS),
              child: MainText('Kavisara Srisuwatcharee', text_type.regular,
                  kFontSizeHeadline4 * 0.7, primary01),
            ),
          ]),
          IconButton(
            icon: const Icon(FontAwesomeIcons.stop),
            onPressed: () {},
            color: primary01,
          )
        ],
      ),
    );
  }
}
