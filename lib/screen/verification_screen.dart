import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../widget/Logo/logo_verification.dart';
import '../widget/text/mainText.dart';
import '../widget/auth/verificationTextFormField.dart';
import '../widget/button/primaryButton.dart';

class VerificationScreen extends StatelessWidget {
  static const routeName = '/verification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: primary01),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoVerification(),
              kSizedBoxL,
              MainText('Verification Code'),
              kSizedBoxM,
              VerificationTextFormField('Code'),
              kSizedBoxL,
              PrimaryButton(
                text: 'Done',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
