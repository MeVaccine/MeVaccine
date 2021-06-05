import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import '../config/constants.dart';
import '../widget/Logo/logo_register.dart';
import '../widget/auth/register-Form.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: primary01),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: kSizeXS, horizontal: kSizeM),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogoRegister(),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
