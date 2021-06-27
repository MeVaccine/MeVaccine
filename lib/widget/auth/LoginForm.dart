import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:provider/provider.dart';
import '../../widget/auth/authTextFormField.dart';
import '../button/secondaryButton.dart';
import '../button/primaryButton.dart';
import '../../model/authType.dart';
import '../../screen/register_Screen.dart';
import '../../screen/verification_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _nationID = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });
    var nationalID = _nationID.text.replaceAll("-", "");
    var phoneNumber = _phoneNumber.text.replaceAll("-", "");
    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .login(nationalID, phoneNumber);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushNamed(VerificationScreen.routeName);
    } on HttpException catch (error) {
      setState(() => _isLoading = false);
      showErrorDialog(context: context, text: error.message);
    }
  }

  @override
  // อันนี้ไม่รู้มีไว้ทำไมแต่เอาไว้ก่อนเผื่อได้ใช้
  void dispose() {
    _nationID.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  //เช็คว่า Form ถูกตามที่เราต้องการไหม ส่วน เช๋ค validate ต่างๆ จะอยู่ใน AuthTextForm
  bool validate() {
    return _formKey.currentState!.validate();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthTextForm(
              textEditingController: _nationID,
              label: Languages.of(context)!.nationalIDInputLabel,
              //AuthTextForm Type เป็น enum แค่แบ่งแยกประเภทเฉยๆ เอาไว้เช็คได้ สามารถไปสร้างได้ใน model/authType
              type: AuthTextFormType.nationId,
            ),
            AuthTextForm(
                textEditingController: _phoneNumber,
                label: Languages.of(context)!.phoneNumberInputLabel,
                type: AuthTextFormType.phoneNumber),
            kSizedBoxVerticalM,
            PrimaryButton(
              isLoading: _isLoading,
              text: Languages.of(context)!.loginButtonLabel,
              onPressed: () {
                //พอเราเพิ่ม if validate เข้าไปมันก็จะเช็คว่า Form นี้ถูกตามที่ต้องการหรือยัง ตอนนี้มีแค้เช็ค User พิมยัง หรือยังไม่พิม
                if (validate()) {
                  //เราใช้ pushNmaed เพราะว่าต่องการกลับไปหน้าก่อนได้
                  login();
                }
              },
            ),
            //kSizeBoxVerticalS ก็คือ SizedBox ใน ขนาดเล็กไปดู ใน config ได้
            kSizedBoxVerticalS,
            SecondaryButton(
              text: Languages.of(context)!.registerButtonLabel,
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
