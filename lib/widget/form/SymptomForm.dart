import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/symptomFormProvider.dart';
import 'package:mevaccine/screen/landing_screen.dart';
import 'package:mevaccine/screen/person_screen.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/form/symptomCard.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../../model/textType.dart';
// import './SymptomForm_detail.dart';

class SymptomForm extends StatefulWidget {
  String nameVaccine;
  String? userId;
  SymptomForm({required this.nameVaccine, this.userId});
  @override
  State<SymptomForm> createState() => _SymptomFormState();
}

class _SymptomFormState extends State<SymptomForm> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                content: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      alignment: Alignment.topCenter,
                      child: Text(
                        Languages.of(ctx)!.confirmSymptomForm,
                        textAlign: TextAlign.center,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallButton(
                        text: Languages.of(ctx)!.okButtonLabel,
                        onPressed: () {
                          if (widget.userId == null) {
                            Navigator.of(context)
                                .pushReplacementNamed(LandingScreen.routeName);
                          } else {
                            Navigator.of(context).popUntil(
                                ModalRoute.withName(PersonScreen.routeName));
                          }
                        },
                        color: primary03,
                        width: 100,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                content: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      alignment: Alignment.topCenter,
                      child: Text(
                        Languages.of(ctx)!.emptySymptomFormErrorMessage,
                        textAlign: TextAlign.center,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallButton(
                        text: Languages.of(ctx)!.okButtonLabel,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: primary03,
                        width: 100,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  Future<void> submitForm() async {
    try {
      await Provider.of<SymptomfromProvider>(context, listen: false).sumbitForm(
          valueHeadache,
          valueNausea,
          valueFatigue,
          valueChills,
          valueMusclePain,
          valueTiderness,
          _otherController.text,
          widget.userId);
      _showDialog();
    } on HttpException catch (error) {
      showErrorDialog(
          context: context,
          text: Languages.of(context)!.httpExceptionErrorMessage(error));
    }
  }

  bool isYes() {
    return (valueYes == true);
  }

  bool cannotSubmit() {
    return (valueYes == false && valueNo == false);
  }

  bool notAnswer() {
    return (valueHeadache == false &&
        valueNausea == false &&
        valueFatigue == false &&
        valueChills == false &&
        valueMusclePain == false &&
        valueTiderness == false &&
        valueOther == false);
  }

  final _otherController = TextEditingController();
  bool valueYes = false;
  bool valueNo = false;

  bool valueHeadache = false;
  bool valueNausea = false;
  bool valueFatigue = false;
  bool valueChills = false;
  bool valueMusclePain = false;
  bool valueTiderness = false;
  bool valueOther = false;

  void resetSymptomValue() {
    valueHeadache = false;
    valueNausea = false;
    valueFatigue = false;
    valueChills = false;
    valueMusclePain = false;
    valueTiderness = false;
    valueOther = false;
  }

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
        kSizedBoxVerticalXS,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.syringe,
              color: accent02,
            ),
            kSizedBoxHorizontalXS,
            Consumer<SymptomfromProvider>(
              builder: (ctx, symptom, child) => MainText(
                symptom.userInfo.vaccineUser!.name,
                text_type.regular,
                kFontSizeHeadline4 * 0.8,
                accent02,
              ),
            )
          ],
        ),
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
                      resetSymptomValue();
                    })),
          ],
        ),
        isYes()
            ? Container(
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      kSizedBoxS,
                      SymptomCard(
                        text: Languages.of(context)!.isHeadacheQuestion,
                        value: valueHeadache,
                        onChange: () {
                          setState(() {
                            this.valueHeadache = !this.valueHeadache;
                          });
                        },
                      ),
                      kSizedBoxS,
                      SymptomCard(
                        text: Languages.of(context)!.isNauseaQuestion,
                        value: valueNausea,
                        onChange: () {
                          setState(() {
                            this.valueNausea = !this.valueNausea;
                          });
                        },
                      ),
                      kSizedBoxS,
                      SymptomCard(
                        text: Languages.of(context)!.isFatigueQuestion,
                        value: valueFatigue,
                        onChange: () {
                          setState(() {
                            this.valueFatigue = !this.valueFatigue;
                          });
                        },
                      ),
                      SymptomCard(
                        text: Languages.of(context)!.isChillsQuestion,
                        value: valueChills,
                        onChange: () {
                          setState(() {
                            this.valueChills = !this.valueChills;
                          });
                        },
                      ),
                      SymptomCard(
                        text: Languages.of(context)!.isMusclePainQuestion,
                        value: valueMusclePain,
                        onChange: () {
                          setState(() {
                            this.valueMusclePain = !this.valueMusclePain;
                          });
                        },
                      ),
                      SymptomCard(
                        text: Languages.of(context)!.isTirednessQuestion,
                        value: valueTiderness,
                        onChange: () {
                          setState(() {
                            this.valueTiderness = !this.valueTiderness;
                          });
                        },
                      ),
                      SymptomCard(
                        text: Languages.of(context)!.isOtherQuestion,
                        value: valueOther,
                        onChange: () {
                          setState(() {
                            this.valueOther = !this.valueOther;
                          });
                        },
                      ),
                      if (valueOther)
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: Languages.of(context)!.isOtherQuestion),
                          controller: _otherController,
                        ),
                      kSizedBoxVerticalS,
                      PrimaryButton(
                        text: Languages.of(context)!.submitButtonLabel,
                        onPressed: notAnswer() ? _showErrorDialog : submitForm,
                        color: primary01,
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: 330,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      text: Languages.of(context)!.submitButtonLabel,
                      onPressed: cannotSubmit() ? _showErrorDialog : submitForm,
                      color: primary01,
                    ),
                  ],
                ),
              ),
      ],
    ));
  }
}
