import 'package:flutter/material.dart';
import 'package:mevaccine/model/textType.dart';
import '../widget/Logo/Logo_LoginScreen.dart';
import '../widget/auth/LoginForm.dart';
import '../config/color.dart';
import '../config/constants.dart';
import '../widget/text/mainText.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: kSizeM, horizontal: kSizeM),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoImage(),
                  MainText('Login',text_type.bold),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
