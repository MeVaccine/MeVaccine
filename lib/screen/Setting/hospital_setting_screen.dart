import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:mevaccine/widget/Logo/logo_hospital.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../widget/option/hospital_setting.dart';
import '../../model/textType.dart';

class HospitalSettingScreen extends StatelessWidget {
  static const routeName = '/hospital-setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // สี icon appbar
        iconTheme: const IconThemeData(color: primary01),
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(vertical: kSizeXS, horizontal: kSizeM),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoHospital(),
              kSizedBoxVerticalS,
              MainText('Change Hospital', text_type.bold, kFontSizeHeadline4,
              HospitalSetting()
                  primary01),
            ],
          ),
        ),
      ),
    );
  }
}
