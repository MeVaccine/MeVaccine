import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../model/textType.dart';
import './SymptomForm_detail.dart';

class SymptomForm extends StatefulWidget {
  @override
  State<SymptomForm> createState() => _SymptomFormState();
}

class _SymptomFormState extends State<SymptomForm> {
  bool isYes() {
    return (valueYes == true);
  }

  bool valueYes = false;
  bool valueNo = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        kSizedBoxS,
        MainText(Languages.of(context)!.symptomFormHeading, text_type.regular,
            kFontSizeHeadline4 * 0.8, accent02),
        kSizedBoxS,
        MainText(Languages.of(context)!.isSymptomQuestion, text_type.regular,
            kFontSizeHeadline4 * 0.6, primary01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainText(
              Languages.of(context)!.yesMessageLabel,
              text_type.regular,
              kFontSizeHeadline4 * 0.8,
              primary01,
            ),
            kSizedBoxHorizontalS,
            Checkbox(
                checkColor: primary01,
                activeColor: primary01,
                value: valueYes,
                onChanged: (bool? value) => setState(() {
                      valueYes = value!;
                      valueNo = false;
                    })),
            kSizedBoxHorizontalM,
            MainText(
              Languages.of(context)!.noMessageLabel,
              text_type.regular,
              kFontSizeHeadline4 * 0.8,
              primary01,
            ),
            kSizedBoxHorizontalS,
            Checkbox(
                checkColor: primary01,
                activeColor: primary01,
                value: valueNo,
                onChanged: (bool? value) => setState(() {
                      valueNo = value!;
                      valueYes = false;
                    })),
          ],
        ),
        isYes()
            ? SymptomFormDetail()
            : Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      text: Languages.of(context)!.submitButtonLabel,
                      onPressed: () {},
                      color: primary01,
                    ),
                  ],
                ),
              ),
      ],
    ));
  }
}
