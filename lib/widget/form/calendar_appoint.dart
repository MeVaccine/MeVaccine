import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';

class CalendarTextfield extends StatefulWidget {
  @override
  State<CalendarTextfield> createState() => _CalendarTextfieldState();
}

class _CalendarTextfieldState extends State<CalendarTextfield> {
  TextEditingController controller = TextEditingController();
  DateTime selectedDatetime = DateTime(2021, 7, 1);

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
                  initialDate: selectedDatetime,
                  firstDate: DateTime(2021, 7, 1),
                  lastDate: DateTime(2021, 12, 31))
              .then((dateTime) async {
            if (dateTime != null) {
              // Set text in controller
              controller.text = DateFormat('dd/MM/yyyy').format(dateTime);
              // Reset selectDateTimeIndex and getDateTimeOfLocation of that date
              final newAppointmentProvider =
                  Provider.of<NewAppointmentProvider>(context, listen: false);
              newAppointmentProvider.selectDateTime(-1);
              await newAppointmentProvider
                  .getDateTimeOfLocation(dateTime.toIso8601String());
              // Update selectedDatetime
              setState(() {
                selectedDatetime = dateTime;
              });
            }
          });
        },
        showCursor: false,
        controller: controller,
      ),
    );
  }
}
