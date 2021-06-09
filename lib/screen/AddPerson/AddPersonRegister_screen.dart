import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/Logo/logo-medkit.dart';
import 'package:mevaccine/widget/auth/register_TextForm.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../person_screen.dart';
import '../AddPerson/verification_addperson.dart';

class AddPersonRegister extends StatefulWidget {
  static const routeName = '/addperson-register';

  @override
  State<AddPersonRegister> createState() => _AddPersonRegisterState();
}

class _AddPersonRegisterState extends State<AddPersonRegister> {
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
                // ตอนแรกมีปัญหา app bar อนู่ใน scaffold เลื่อนแล้ว appbar บัง เลยทำเป็น widget ตัวหนึ่งไปเลย
                AppBar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                // ข้างล่างนี้กห็ ฟอร์ม ต่างๆ
                MainText('Register', text_type.bold,kFontSizeHeadline4,primary01),
                kSizedBoxVerticalS,
                LogoMedkit(),
                kSizedBoxVerticalS,
                MainText('Personal Information', text_type.regular,kFontSizeHeadline4,primary01),
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
                MainText('Address', text_type.regular,kFontSizeHeadline4,primary01),
                RegisterTextForm(
                  label: 'Province',
                  type: RegsiterTextFormType.nothing,
                  active: RegisterActiveType.enable,
                ),
                //SerachAbleDropDown  ยังไม่ได้ทำ searchFN
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSizeS, vertical: kSizeM),
                  child: SearchableDropdown.single(
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
                    Navigator.of(context).pushNamed(VerificationAddPerson.routeName);
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
