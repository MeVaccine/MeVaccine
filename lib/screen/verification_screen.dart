import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:provider/provider.dart';
import '../widget/Logo/logo_verification.dart';
import '../widget/text/mainText.dart';
import '../widget/auth/verificationTextFormField.dart';
import '../widget/button/primaryButton.dart';
import '../screen/landing_screen.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = '/verification';

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _code = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Future<void> verification() async {
      setState(() {
        _isLoading = true;
      });
      String otp = _code.text;
      try {
        await Provider.of<AuthenicateProvider>(context, listen: false)
            .verification(otp);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
      } on HttpException catch (error) {
        setState(() => _isLoading = false);
        showErrorDialog(
            context: context,
            text: Languages.of(context)!.httpExceptionErrorMessage(error));
      }
    }

    return Consumer<AuthenicateProvider>(
      builder: (ctx, authen, child) => Scaffold(
        // set Colors.transparent เพื่อจะให้สี appbar กลมกลืน
        //elevation เพื่อ shadow เป็น 0
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: primary01),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: double.infinity,
            // ตอนกดพิมจะได้เลื่อนหน้าจอได้่
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LogoVerification(),
                  kSizedBoxL,
                  MainText(Languages.of(context)!.verificationCodeHeadingLabel,
                      text_type.regular, kFontSizeHeadline4, primary01),
                  kSizedBoxM,
                  VerificationTextFormField(
                    label: Languages.of(context)!.verificationCodeInputLabel,
                    textEditingController: _code,
                  ),
                  kSizedBoxS,
                  Text(Languages.of(context)!.verificationCodeTextMessage),
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kSizeS * 1.3),
                      alignment: Alignment.centerLeft,
                      child: Text(Languages.of(context)!
                          .verificationCodePhoneMessage(
                              authen.numberUser, authen.refCode))),
                  kSizedBoxM,
                  PrimaryButton(
                    isLoading: _isLoading,
                    text: Languages.of(context)!.doneButtonLabel,
                    onPressed: () async {
                      await verification();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
