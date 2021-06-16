import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../../model/authType.dart';

class RegisterTextForm extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final RegsiterTextFormType type;
  final RegisterActiveType active;
  RegisterTextForm(
      {required this.label,
      required this.type,
      required this.active,
      required this.textEditingController});
  bool isCalendar() {
    return (type == RegsiterTextFormType.calendar);
  }

  bool isPhoneNumber() {
    return (type == RegsiterTextFormType.phoneNumber);
  }

  bool isActive() {
    return (active == RegisterActiveType.enable);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kSizeS, vertical: kSizeS),
      child: TextFormField(
        controller: textEditingController,
        enabled: isActive() ? true : false,
        inputFormatters: [
          if (isPhoneNumber()) MaskedInputFormatter('###-###-####')
        ],
        keyboardType:
            isPhoneNumber() ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: kSizeM,
            ),
            hintText: label,
            hintStyle: TextStyle(color: isActive() ? netural01 : netural03),
            suffixIcon: isCalendar()
                ? const Icon(
                    FontAwesomeIcons.calendarAlt,
                    size: kSizeS * 1.2,
                    color: primary01,
                  )
                : null),
      ),
    );
  }
}
