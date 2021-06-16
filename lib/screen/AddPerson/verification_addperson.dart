import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/Logo/logo_verification.dart';
import 'package:mevaccine/widget/auth/verificationTextFormField.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../person_screen.dart';

class VerificationAddPerson extends StatelessWidget {
  static const routeName = '/verificationAddPerson';
  final _code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set Colors.transparent เพื่อจะให้สี appbar กลมกลืน
      //elevation เพื่อ shadow เป็น 0
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: primary01),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        // ตอนกดพิมจะได้เลื่อนหน้าจอได้่
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoVerification(),
              kSizedBoxL,
              MainText('Verification Code', text_type.regular,
                  kFontSizeHeadline4, primary01),
              kSizedBoxM,
              VerificationTextFormField(
                label: 'Code',
                textEditingController: _code,
              ),
              kSizedBoxS,
              const Text('Enter the code we sent to your number at'),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.3),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'xxx-xxx-xxxx',
                  )),
              kSizedBoxM,
              PrimaryButton(
                text: 'Done',
                onPressed: () {
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName(PersonScreen.routeName));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
