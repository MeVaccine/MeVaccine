import 'package:flutter/material.dart';
import './step1_screen.dart';
import './step2_screen.dart';
import './step3_screen.dart';
import './step4_screen.dart';

class Mainstep extends StatefulWidget {
  Mainstep({Key? key}) : super(key: key);

  @override
  _MainstepState createState() => _MainstepState();
}

class _MainstepState extends State<Mainstep> {
  String _currentTab = Step1.routeName;
  final screen = {
    Step1.routeName: Step1(),
    Step2.routeName: Step2(),
    Step3.routeName: Step3(),
    Step4.routeName: Step4(),
  };

  // void _changeTab(String tab) {
  //   setState(() {
  //     _currentTab = tab;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
