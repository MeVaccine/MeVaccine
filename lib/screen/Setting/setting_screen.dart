import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../widget/setting/button_setting.dart';
import '../../screen/Setting/number_setting_screen.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: MainText('Setting', text_type.regular, kSizeS * 1.2, primary01),
        // สี icon appbar
        iconTheme: const IconThemeData(color: primary01),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kSizedBoxVerticalM,
            ButtonSetting(
              icon: Icon(
                FontAwesomeIcons.solidHospital,
                color: primary01,
              ),
              onPressed: () {},
              text: 'Set Hospital',
            ),
            ButtonSetting(
              icon: Icon(
                Icons.phone,
                color: primary01,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(NumberSettingScreen.routeName);
              },
              text: 'Change Number',
            ),
            ButtonSetting(
              icon: Icon(
                FontAwesomeIcons.language,
                color: primary01,
              ),
              onPressed: () {},
              text: 'Change Language',
            ),
            kSizedBoxVerticalXL,
            PrimaryButton(onPressed: (){},text:'Log Out',color: accent02,height: kSizeM,width: kSizeL*4.5,)
          ],
        ),
      ),
    );
  }
}