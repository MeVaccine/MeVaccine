import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/screen/appointment/step3_screen.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:mevaccine/widget/layout/list_dropdownperson.dart';
import 'package:mevaccine/widget/layout/your_appointment.dart';
import 'package:provider/provider.dart';
import '../../widget/Logo/empty_person.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';

class Step4 extends StatelessWidget {
  static const routeName = '/step4';
  @override
  Widget build(BuildContext context) {
    final newAppointmentProvider =
        Provider.of<NewAppointmentProvider>(context, listen: false);
    DateTime selectedDateTime = newAppointmentProvider
        .locationDateime[newAppointmentProvider.selectedDateTimeIndex]
        .startDateTime;
    return Container(
        height: 500,
        child: Column(
          children: [
            Container(
              width: 330,
              height: 180,
              child: YourAppointment(
                checkAppointment: true,
                checkColor: '0',
                color: primary01,
                appointmentDateTime: selectedDateTime,
                locationName: Languages.of(context)!
                    .locationNameItem(newAppointmentProvider.selectedLocation!),
              ),
            ),
            ListDropdownperson(),
          ],
        ));
  }
}
