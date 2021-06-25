import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/screen/appointment/step1_screen.dart';
import 'package:mevaccine/widget/auth/register_TextForm.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../widget/layout/layout_appointment.dart';
import '../appointment/step3_screen.dart';
import '../appointment/step1_screen.dart';
import '../../widget/layout/list_vaccine.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:mevaccine/model/textType.dart';

class Step2 extends StatefulWidget {
  static const routeName = '/step2';

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  List<String> data = ['one', 'two', 'three', 'four'];
  final _nothing = TextEditingController();
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       LayoutAppointment(
    //         text: 'Select vaccine location',
    //         description: 'which you want to go.',
    //         step: '2 of 4',
    //         value: 0.5,
    //       ),
    return Container(
      height: 490,
      child: Column(
        children: [
          kSizedBoxVerticalS,
          ListVaccine(),
          kSizedBoxVerticalM,
          Container(
              margin: EdgeInsets.only(right: 200),
              child: MainText(Languages.of(context)!.locationHeading,
                  text_type.regular, kFontSizeHeadline3, primary01)),
          kSizedBoxVerticalXXS,
          Container(
            width: 300,
            child: RegisterTextForm(
              textEditingController: _nothing,
              label: Languages.of(context)!.provinceInputLabel,
              type: RegsiterTextFormType.nothing,
              active: RegisterActiveType.enable,
            ),
          ),
          //SerachAbleDropDown  ยังไม่ได้ทำ searchFN
          Container(
            width: 330,
            child: Padding(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.alertTriangle,
                color: primary01,
                size: 16,
              ),
              kSizedBoxHorizontalXS,
              Container(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Languages.of(context)!.changingLocationMessage1,
                          style: TextStyle(color: primary01, fontSize: 10)),
                      Text(Languages.of(context)!.changingLocationMessage2,
                          style: TextStyle(color: primary01, fontSize: 10)),
                    ],
                  )),
            ],
          ),
          kSizedBoxVerticalM,
        ],
      ),
    );
    //       ),
    //       Container(
    //         margin: EdgeInsets.symmetric(horizontal: kSizeS),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             SmallButton(
    //               onPressed: () {
    //                 Navigator.of(context).pushNamed(Step1.routeName);
    //               },
    //               text: 'Previous',
    //               color: accent02,
    //               width: 120,
    //             ),
    //             SmallButton(
    //               onPressed: () {
    //                 Navigator.of(context).pushNamed(Step3.routeName);
    //               },
    //               text: 'Next',
    //               color: accent02,
    //               width: 120,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }
}
