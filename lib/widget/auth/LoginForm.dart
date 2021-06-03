import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';
import '../../widget/auth/authTextFormField.dart';
import '../button/secondaryButton.dart';
import '../button/primaryButton.dart';
import '../../model/authType.dart';
import '../../screen/register_Screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _nationID = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {}

  @override
  void dispose() {
    _nationID.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

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
              label: 'Nation ID',
              type: AuthTextFormType.nationId,
            ),
            AuthTextForm(
                textEditingController: _phoneNumber,
                label: 'Phone Number',
                type: AuthTextFormType.phoneNumber),
            kSizedBoxVerticalM,
            PrimaryButton(
              text: 'Log in',
              onPressed: () {
                if (validate()) {}
              },
            ),
            kSizedBoxVerticalS,
            SecondaryButton(
              text: 'Register',
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
