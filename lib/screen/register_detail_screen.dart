import 'package:flutter/material.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../config/color.dart';
import '../config/constants.dart';
import '../widget/Logo/logo-medkit.dart';
import '../widget/form/customDropDown.dart';
import '../widget/auth/authTextFormField.dart';
import '../widget/auth/register_TextForm.dart';

class RegisterDetailScreen extends StatefulWidget {
  static const routeName = '/register-detail';

  @override
  State<RegisterDetailScreen> createState() => _RegisterDetailScreenState();
}

class _RegisterDetailScreenState extends State<RegisterDetailScreen> {
  final _firstName = TextEditingController();

  final _lastName = TextEditingController();

  final _dateOfBirth = TextEditingController();

  final _phoneNumber = TextEditingController();

  final _province = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                MainText('Register'),
                kSizedBoxVerticalS,
                LogoMedkit(),
                kSizedBoxVerticalS,
                MainText('Personal Information'),
                RegisterTextForm(
                  label: 'MR',
                  type: RegsiterTextFormType.nothing,
                  active: RegisterActiveType.disable,
                ),
                RegisterTextForm(
                    label: 'Thanakorn',
                    type: RegsiterTextFormType.nothing,
                    active: RegisterActiveType.disable),
                RegisterTextForm(
                    label: 'Aungkunchuchod',
                    type: RegsiterTextFormType.nothing,
                    active: RegisterActiveType.disable),
                RegisterTextForm(
                    label: 'Male',
                    type: RegsiterTextFormType.nothing,
                    active: RegisterActiveType.disable),
                RegisterTextForm(
                    label: 'Date of Birth',
                    type: RegsiterTextFormType.calendar,
                    active: RegisterActiveType.disable),
                RegisterTextForm(
                    label: 'Phone Number',
                    type: RegsiterTextFormType.nothing,
                    active: RegisterActiveType.enable),
                MainText('Address'),
                RegisterTextForm(
                  label: 'Province',
                  type: RegsiterTextFormType.nothing,
                  active: RegisterActiveType.enable,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
