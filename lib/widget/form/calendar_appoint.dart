import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';

class CalendarTextfield extends StatelessWidget {
  const CalendarTextfield({Key? key}) : super(key: key);

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
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2022));
        },
        showCursor: false,
      ),
    );
  }
}
