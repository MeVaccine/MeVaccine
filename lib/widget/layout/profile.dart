import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/localization/language/languages.dart';
import '../../config/color.dart';
import '../../config/constants.dart';
import '../text/mainText.dart';
import '../text/profile_text.dart';
import '../../model/textType.dart';
import '../../screen/Setting/setting_screen.dart';

class Profile extends StatelessWidget {
  String name;
  Profile({required this.name});
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
            radius: kSizeS * 2,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText(Languages.of(context)!.landingGreetingMessage,
                    text_type.regular, kFontSizeHeadline4 * 0.8, primary01),
                ProfileText(name, accent02, kFontSizeHeadline2),
              ],
            ),
          ),
        ]),
        IconButton(
          icon: const Icon(
            FeatherIcons.settings,
            color: accent02,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(SettingScreen.routeName);
          },
        )
      ],
    );
  }
}
