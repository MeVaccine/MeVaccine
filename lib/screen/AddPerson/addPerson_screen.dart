import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/Logo/logo_register.dart';
import 'package:mevaccine/widget/auth/register-Form.dart';
import '../../model/authType.dart';

class AddPerson extends StatelessWidget {
  static const routeName = '/addPerson';

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
              children: [
                LogoRegister(),
                RegisterForm(
                  Languages.of(context)!.addPersonHeading,
                  RegisterType.addPerson,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
