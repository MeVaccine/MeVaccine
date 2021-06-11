import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../model/textType.dart';

class HospitalSetting extends StatefulWidget {
  final String text;
  HospitalSetting(this.text);
  @override
  State<HospitalSetting> createState() => _HospitalSettingState();
}

class _HospitalSettingState extends State<HospitalSetting> {
  List<String> data = ['one', 'two', 'three', 'four'];
  String selectedValue = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MainText(
                widget.text, text_type.bold, kFontSizeHeadline4, primary01),
            kSizedBoxVerticalS,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSizeS, vertical: kSizeS),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSizeS, vertical: kSizeS),
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
            kSizedBoxVerticalS,
            PrimaryButton(
              onPressed: () {},
              text: 'Update',
            ),
          ],
        ),
      ),
    );
  }
}
