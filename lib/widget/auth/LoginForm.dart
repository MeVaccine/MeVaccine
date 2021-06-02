import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';
import '../../widget/auth/authTextFormField.dart';
import '../button/primaryButton.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _nationID = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              AuthTextForm(
                  textEditingController: _nationID, label: 'Nation ID'),
              AuthTextForm(
                  textEditingController: _phoneNumber, label: 'Phone Number'),
              kSizedBoxVerticalL,
              PrimaryButton(
                text: 'Log in',
                onPressed: () {},
              ),
              kSizedBoxVerticalS,
              PrimaryButton(
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
