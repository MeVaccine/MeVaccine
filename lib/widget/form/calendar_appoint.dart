import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:intl/intl.dart';

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
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2022))
              .then((value) {
            if (value != null) {
              print(value);
              controller.text = DateFormat('dd/MM/yyyy').format(value);
            }
          });
        },
        showCursor: false,
        controller: controller,
      ),
    );
  }
}
