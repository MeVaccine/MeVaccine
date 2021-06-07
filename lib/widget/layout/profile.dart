import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/color.dart';
import '../../config/constants.dart';
import '../text/mainText.dart';
import '../text/profile_text.dart';
import '../../model/textType.dart'; 

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/user-profile.png',
            ),
            radius: kSizeS * 2.5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              MainText('Good Morning!', text_type.regular,kFontSizeHeadline4*0.8,primary01),
              ProfileText('Kavisara', accent02,kFontSizeHeadline2),
            ]),
          ),
        ]),
        IconButton(
          icon: const Icon(FontAwesomeIcons.cog,color: accent02,),
          onPressed: () {},
        )
      ],
    );
  }
}
