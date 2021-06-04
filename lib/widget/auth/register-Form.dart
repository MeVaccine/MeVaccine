import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/authType.dart';
import '../auth/authTextFormField.dart';
import '../button/primaryButton.dart';
import '../../screen/register_detail_screen.dart';
import '../text/mainText.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nationID = TextEditingController();
  final _laserID = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool validate() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MainText('Register'),
            kSizedBoxVerticalS,
            AuthTextForm(
              label: 'National ID',
              textEditingController: _nationID,
              type: AuthTextFormType.nationId,
            ),
            kSizedBoxVerticalS,
            AuthTextForm(
              label: 'Laser ID',
              textEditingController: _laserID,
              type: AuthTextFormType.laserID,
            ),
            kSizedBoxVerticalL,
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed( RegisterDetailScreen.routeName);
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
