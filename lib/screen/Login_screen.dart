import 'package:flutter/material.dart';
import '../widget/Logo/Logo_LoginScreen.dart';
import '../widget/auth/LoginForm.dart';
import '../config/color.dart';
import '../config/constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: kSizeM, horizontal: kSizeM),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoImage(),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: primary01,
                        fontSize: kFontSizeHeadline4,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt'),
                  ),
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
