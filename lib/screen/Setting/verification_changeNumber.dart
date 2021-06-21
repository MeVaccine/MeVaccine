import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/userProvider.dart';
import 'package:mevaccine/widget/Logo/logo_verification.dart';
import 'package:mevaccine/widget/auth/verificationTextFormField.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../person_screen.dart';
import '../../screen/Setting/setting_screen.dart';

class VerificationChangeNumber extends StatefulWidget {
  static const routeName = '/verificationChangeNumber';

  @override
  State<VerificationChangeNumber> createState() =>
      _VerificationChangeNumberState();
}

class _VerificationChangeNumberState extends State<VerificationChangeNumber> {
  final _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;

    Future<void> verificationNumber() async {
      setState(() {
        _isLoading = true;
      });
      String otp = _code.text;
      try {
        await Provider.of<UserProvider>(context, listen: false)
            .verifyPhone(otp);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context)
            .popUntil(ModalRoute.withName(SettingScreen.routeName));
      } on HttpException catch (error) {
        setState(() => _isLoading = false);
        showErrorDialog(context: context, text: error.message);
      }
    }

    return Consumer<UserProvider>(
        builder: (context, authen, child) => GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
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
                          const Text(
                              'Enter the code we sent to your number at'),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kSizeS * 1.3),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${authen.number} Your code is ${authen.refCode}",
                              )),
                          kSizedBoxM,
                          PrimaryButton(
                            isLoading: _isLoading,
                            text: 'Done',
                            onPressed: verificationNumber,
                          ),
                        ],
                      ),
                    ),
                  )),
            ));
  }
}
