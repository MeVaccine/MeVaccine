import 'package:flutter/material.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../config/color.dart';
import '../widget/button/primaryButton.dart';
import '../config/constants.dart';
import '../widget/Logo/logo-medkit.dart';
import '../widget/auth/register_TextForm.dart';

class RegisterDetailScreen extends StatefulWidget {
  static const routeName = '/register-detail';

  @override
  State<RegisterDetailScreen> createState() => _RegisterDetailScreenState();
}

class _RegisterDetailScreenState extends State<RegisterDetailScreen> {
  List<String> data = ['one', 'two', 'three', 'four'];
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                MainText('Register',text_type.bold),
                kSizedBoxVerticalS,
                LogoMedkit(),
                kSizedBoxVerticalS,
                MainText('Personal Information',text_type.regular),
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
                MainText('Address',text_type.regular),
                RegisterTextForm(
                  label: 'Province',
                  type: RegsiterTextFormType.nothing,
                  active: RegisterActiveType.enable,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSizeS, vertical: kSizeM),
                  child: SearchableDropdown(
                    items: data.map((e) {
                      return DropdownMenuItem<dynamic>(
                        child: Text(e),
                      );
                    }).toList(),
                    hint: 'Selected',
                    isCaseSensitiveSearch: true,
                    searchHint: const Text('Select your hospital'),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/verification');
                  },
                  text: 'Done',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
