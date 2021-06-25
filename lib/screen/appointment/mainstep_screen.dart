import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/layout/layout_appointment.dart';
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

  @override
  Widget build(BuildContext context) {
    final dataList = {
      Step1.routeName: {
        'text': Languages.of(context)!.selectPersonHeading,
        'description': Languages.of(context)!.selectPersonHeading,
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
                        setState(() => {_currentTab = Step2.routeName});
                      } else if (_currentTab == Step4.routeName) {
                        setState(() => {_currentTab = Step3.routeName});
                      }
                    },
                    text: Languages.of(context)!.previousButtonLabel,
                    color: accent02,
                    width: 120,
                  ),
                SmallButton(
                  onPressed: () {
                    if (_currentTab == Step1.routeName) {
                      setState(() => {_currentTab = Step2.routeName});
                    } else if (_currentTab == Step2.routeName) {
                      setState(() => {_currentTab = Step3.routeName});
                    } else if (_currentTab == Step3.routeName) {
                      setState(() => {_currentTab = Step4.routeName});
                    } else if (_currentTab == Step4.routeName) {
                      showDialog(
                          context: context,
                          builder: (ctx) =>
                              AlertDialog(title: Text("Submit Laew Na eiei")));
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
