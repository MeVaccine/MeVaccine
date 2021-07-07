import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/screen/landing_screen.dart';
import 'package:mevaccine/widget/button/secondaryButton.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/layout/warningDialog.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/layout/layout_appointment.dart';
import 'package:provider/provider.dart';
import './step1_screen.dart';
import './step2_screen.dart';
import './step3_screen.dart';
import './step4_screen.dart';
import '../../widget/layout/layout_appointment.dart';

class Mainstep extends StatefulWidget {
  Mainstep({Key? key}) : super(key: key);

  @override
  _MainstepState createState() => _MainstepState();
}

class _MainstepState extends State<Mainstep> {
  String _currentTab = Step1.routeName;

  final Map<String, Widget> screen = {
    Step1.routeName: Step1(),
    Step2.routeName: Step2(),
    Step3.routeName: Step3(),
    Step4.routeName: Step4(),
  };
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      alignment: Alignment.topCenter,
                      child: Text(
                        Languages.of(ctx)!.confirmScheduleMessage,
                        textAlign: TextAlign.center,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallButton(
                        text: Languages.of(ctx)!.cancelButtonLabel,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: white,
                        width: 100,
                        colorFont: primary03,
                        colorBorder: primary03,
                      ),
                      SmallButton(
                        text: Languages.of(ctx)!.confirmButtonLabel,
                        onPressed: () async {
                          try {
                            await Provider.of<NewAppointmentProvider>(context,
                                    listen: false)
                                .createNewAppointment();
                            Navigator.of(context)
                                .pushReplacementNamed(LandingScreen.routeName);
                          } on HttpException catch (error) {
                            Navigator.of(context).pop();
                            showErrorDialog(
                                context: ctx,
                                text: Languages.of(context)!
                                    .httpExceptionErrorMessage(error));
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

  @override
  Widget build(BuildContext context) {
    final dataList = {
      Step1.routeName: {
        'text': Languages.of(context)!.selectPersonHeading,
        'description': Languages.of(context)!.selectPersonMessage,
        'value': 1,
      },
      Step2.routeName: {
        'text': Languages.of(context)!.selectLocationHeading,
        'description': Languages.of(context)!.selectLocationMessage,
        'value': 2,
      },
      Step3.routeName: {
        'text': Languages.of(context)!.selectDateTimeHeading,
        'description': Languages.of(context)!.selectDateTimeMessage,
        'value': 3,
      },
      Step4.routeName: {
        'text': Languages.of(context)!.selectVaccineHeading,
        'description': Languages.of(context)!.selectVaccineMessage,
        'value': 4,
      }
    };

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            LayoutAppointment(
              text: dataList[_currentTab]!['text'].toString(),
              description: dataList[_currentTab]!['description'].toString(),
              step: '${dataList[_currentTab]!['value']} of 4',
              value: int.parse(dataList[_currentTab]!['value'].toString()) / 4,
            ),
            screen[_currentTab]!,
            Container(
                margin: EdgeInsets.symmetric(horizontal: kSizeS),
                child: Row(
                  mainAxisAlignment: _currentTab == Step1.routeName
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentTab != Step1.routeName)
                      SmallButton(
                        onPressed: () {
                          if (_currentTab == Step2.routeName) {
                            setState(() => {_currentTab = Step1.routeName});
                          } else if (_currentTab == Step3.routeName) {
                            Provider.of<NewAppointmentProvider>(context,
                                    listen: false)
                                .resetSelectedDateTimeIndex();
                            setState(() => {_currentTab = Step2.routeName});
                          } else if (_currentTab == Step4.routeName) {
                            Provider.of<NewAppointmentProvider>(context,
                                    listen: false)
                                .resetSelectedDateTimeIndex();
                            setState(() => {_currentTab = Step3.routeName});
                          }
                        },
                        text: Languages.of(context)!.previousButtonLabel,
                        color: white,
                        colorBorder: accent02,
                        colorFont: accent02,
                        width: 120,
                      ),
                    SmallButton(
                      onPressed: () {
                        final newAppointmentProvider =
                            Provider.of<NewAppointmentProvider>(context,
                                listen: false);
                        if (_currentTab == Step1.routeName) {
                          if (newAppointmentProvider.selectedPerson.isEmpty) {
                            // Show error dialog
                            dialog(
                                context: context,
                                text: Languages.of(context)!
                                    .warnDialogSelectPerson);
                          } else {
                            setState(() => {_currentTab = Step2.routeName});
                          }
                        } else if (_currentTab == Step2.routeName) {
                          setState(() => {_currentTab = Step3.routeName});
                        } else if (_currentTab == Step3.routeName) {
                          if (newAppointmentProvider.selectedDateTimeIndex ==
                              -1) {
                            // Show error dialog
                            dialog(
                                context: context,
                                text: Languages.of(context)!
                                    .noDateTimeErrorMessage);
                          } else {
                            setState(() => {_currentTab = Step4.routeName});
                          }
                        } else if (_currentTab == Step4.routeName) {
                          if (newAppointmentProvider.selectedVaccine
                              .contains(null)) {
                            // Show error dialog

                          } else {
                            _showDialog();
                          }
                        }
                      },
                      text: _currentTab == Step4.routeName
                          ? Languages.of(context)!.submitButtonLabel
                          : Languages.of(context)!.nextButtonLabel,
                      color: accent02,
                      width: 120,
                    ),
                  ],
                ))
          ],
        ));
  }
}
