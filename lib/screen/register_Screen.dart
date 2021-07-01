import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/localization/language/languages.dart';
import '../config/constants.dart';
import '../widget/Logo/logo_register.dart';
import '../widget/auth/register-Form.dart';
import '../model/authType.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

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
                RegisterForm(Languages.of(context)!.registerHeadingLabel,
                    RegisterType.register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
