import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';

class CalendarTextfield extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            suffixIcon: Icon(
              FeatherIcons.calendar,
              color: primary01,
            ),
            labelText: 'Select Dated'),
        onTap: () async {
          await showDatePicker(
                  context: context,
                  initialDate: DateTime(2021, 7, 1),
                  firstDate: DateTime(2021, 7, 1),
                  lastDate: DateTime(2021, 12, 31))
              .then((dateTime) async {
            if (dateTime != null) {
              final selectDateTimeISO = dateTime.toIso8601String();
              controller.text = DateFormat('dd/MM/yyyy').format(dateTime);
              await Provider.of<NewAppointmentProvider>(context, listen: false)
                  .getDateTimeOfLocation(selectDateTimeISO);
            }
          });
        },
        showCursor: false,
        controller: controller,
      ),
    );
  }
}
