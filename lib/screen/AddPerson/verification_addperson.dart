import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:mevaccine/screen/person_screen.dart';
import 'package:mevaccine/widget/Logo/logo_verification.dart';
import 'package:mevaccine/widget/auth/verificationTextFormField.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../landing_screen.dart';
import 'addPerson_screen.dart';

class VerificationAddPerson extends StatefulWidget {
  static const routeName = '/verificationAddPerson';

  @override
  State<VerificationAddPerson> createState() => _VerificationAddPersonState();
}

class _VerificationAddPersonState extends State<VerificationAddPerson> {
  final _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    Future<void> addPerson() async {
      setState(() {
        _isLoading = true;
      });
      String otp = _code.text;
      try {
        await Provider.of<AuthenicateProvider>(context, listen: false)
            .addPersonVerification(otp);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context)
            .popUntil(ModalRoute.withName(PersonScreen.routeName));
        Provider.of<PersonProvider>(context, listen: false).getPerson();
      } on HttpException catch (error) {
        setState(() => _isLoading = false);
        showErrorDialog(
            context: context,
            text: Languages.of(context)!.httpExceptionErrorMessage(error));
      }
    }

    return Consumer<AuthenicateProvider>(
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
                          MainText(
                              Languages.of(context)!
                                  .verificationCodeHeadingLabel,
                              text_type.regular,
                              kFontSizeHeadline4,
                              primary01),
                          kSizedBoxM,
                          VerificationTextFormField(
                            label: Languages.of(context)!
                                .verificationCodeInputLabel,
                            textEditingController: _code,
                          ),
                          kSizedBoxS,
                          Text(Languages.of(context)!
                              .verificationCodeTextMessage),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kSizeS * 1.3),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Languages.of(context)!
                                    .verificationCodePhoneMessage(
                                        authen.numberUser,
                                        authen.refCodeAddPerson),
                              )),
                          kSizedBoxM,
                          PrimaryButton(
                            isLoading: _isLoading,
                            text: 'Done',
                            onPressed: addPerson,
                          ),
                        ],
                      ),
                    ),
                  )),
            ));
  }
}
