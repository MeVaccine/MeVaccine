import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../../model/authType.dart';

class RegisterTextForm extends StatelessWidget {
  final String label;
  final RegsiterTextFormType type;
  final RegisterActiveType active;
  RegisterTextForm(
      {required this.label, required this.type, required this.active});
  bool isCalendar() {
    return (type == RegsiterTextFormType.calendar);
  }

  bool isActive() {
    return (active == RegisterActiveType.enable);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kSizeS, vertical: kSizeS),
      child: TextFormField(
        enabled: isActive() ? true : false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: kSizeM,
            ),
            hintText: label,
            hintStyle: TextStyle(color: isActive() ? netural01 : netural03),
            suffixIcon: isCalendar() ? Icon(Icons.calendar_today) : null),
      ),
    );
  }
}
