import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import './symptomCard.dart';

class SymptomFormDetail extends StatefulWidget {
  @override
  State<SymptomFormDetail> createState() => _SymptomFormDetailState();
}

class _SymptomFormDetailState extends State<SymptomFormDetail> {
  @override
  Widget build(BuildContext context) {
    bool valueHeadache = false;
    bool valueNausea = false;
    bool valueFatigue = false;
    bool valueChills = false;
    bool valueMusclePain = false;
    bool valueTiderness = false;
    bool valueOther = false;

    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            kSizedBoxS,
            SymptomCard(
              text: Languages.of(context)!.isHeadacheQuestion,
              value: valueHeadache,
            ),
            kSizedBoxS,
            SymptomCard(
              text: Languages.of(context)!.isNauseaQuestion,
              value: valueNausea,
            ),
            kSizedBoxS,
            SymptomCard(
              text: Languages.of(context)!.isFatigueQuestion,
              value: valueFatigue,
            ),
            SymptomCard(
              text: Languages.of(context)!.isChillsQuestion,
              value: valueChills,
            ),
            SymptomCard(text: 'Muscle Pain', value: valueMusclePain),
            SymptomCard(
              text: Languages.of(context)!.isTirednessQuestion,
              value: valueTiderness,
            ),
            SymptomCard(
              text: Languages.of(context)!.isOtherQuestion,
              value: valueOther,
            ),
            PrimaryButton(
              text: Languages.of(context)!.submitButtonLabel,
              onPressed: () {},
              color: primary01,
            )
          ],
        ),
      ),
    );
  }
}
