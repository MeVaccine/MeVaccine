import 'package:flutter/material.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../screen/AddPerson/verification_addperson.dart';
import '../../config/color.dart';
import '../../widget/button/primaryButton.dart';
import '../../config/constants.dart';
import '../../widget/Logo/logo-medkit.dart';
import '../../widget/auth/register_TextForm.dart';
import '../../screen/verification_screen.dart';
import 'package:provider/provider.dart';

class AddPersonRegister extends StatefulWidget {
  static const routeName = '/addperson-register';

  @override
  State<AddPersonRegister> createState() => _AddPersonRegisterState();
}

class _AddPersonRegisterState extends State<AddPersonRegister> {
  bool _isLoading = false;
  String nationID = "";
  String laserID = "";
  final _nothing = TextEditingController();
  final _phoneNumber = TextEditingController();
  String hospitalID = "";

  Future<void> personRegist() async {
    setState(() {
      _isLoading = true;
    });
    var phoneNumber = _phoneNumber.text.replaceAll("-", "");
    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .personRegister(nationID, laserID, phoneNumber);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushNamed(VerificationAddPerson.routeName);
    } on HttpException catch (error) {
      setState(() => _isLoading = false);
      showErrorDialog(context: context, text: error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Consumer<AuthenicateProvider>(
          builder: (context, authen, child) => Scaffold(
                body: Container(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ตอนแรกมีปัญหา app bar อนู่ใน scaffold เลื่อนแล้ว appbar บัง เลยทำเป็น widget ตัวหนึ่งไปเลย
                        AppBar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          iconTheme: const IconThemeData(color: Colors.black),
                        ),
                        // ข้างล่างนี้กห็ ฟอร์ม ต่างๆ
                        MainText('Register', text_type.bold, kFontSizeHeadline4,
                            primary01),
                        kSizedBoxVerticalS,
                        LogoMedkit(),
                        kSizedBoxVerticalS,
                        MainText('Personal Information', text_type.regular,
                            kFontSizeHeadline4, primary01),
                        RegisterTextForm(
                          label: authen.personal.en.prefix,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.firstName,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.lastName,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.gender,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.date_of_birth.toString(),
                          type: RegsiterTextFormType.calendar,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                            textEditingController: _phoneNumber,
                            label: 'Phone Number',
                            type: RegsiterTextFormType.phoneNumber,
                            active: RegisterActiveType.enable),
                        kSizedBoxVerticalM,
                        PrimaryButton(
                          isLoading: _isLoading,
                          onPressed: () {
                            setState(() {
                              nationID = authen.personal.id;
                              laserID = authen.personal.laserId;
                            });
                            personRegist();
                            // Navigator.of(context)
                            //     .pushNamed(VerificationScreen.routeName);
                          },
                          text: 'Done',
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
