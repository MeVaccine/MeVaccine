import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/widget/auth/register_TextForm.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/form/calendar_appoint.dart';
import 'package:mevaccine/widget/layout/list_timeTable.dart';
import '../../widget/Logo/empty_person.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';
import '../appointment/step4_screen.dart';
import 'package:mevaccine/screen/appointment/step2_screen.dart';

class Step3 extends StatelessWidget {
  final _nothing = TextEditingController();
  static const routeName = '/step3';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490,
      child: Column(
        children: [kSizedBoxVerticalS, CalendarTextfield(), ListTimeTable()],
      ),
    );
  }
}
