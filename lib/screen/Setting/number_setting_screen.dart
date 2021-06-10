import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/widget/Logo/logo_hospital.dart';
import '../../config/constants.dart';
import '../../widget/setting/NumberSettingForm.dart';


class NumberSettingScreen extends StatelessWidget {
  static const routeName = '/numbersetting';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //อธิบาย ในหน้า loginไปละ
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
                NumberSettingForm('Change Hospital')
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
