import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';
import '../../widget/auth/authTextFormField.dart';
import '../button/primaryButton.dart';
import '../button/secondaryButton.dart';
import '../../model/authType.dart';

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
    return Column(
      children: [
        Form(
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
                  type: AuthTextFormType.nationId),
              kSizedBoxVerticalM,
              PrimaryButton(
                text: 'Log in',
                onPressed: () {
                  if(validate()){

                  }
                },
              ),
              kSizedBoxVerticalS,
              SecondaryButton(
                text: 'Register',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
