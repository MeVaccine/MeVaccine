import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class VerificationTextFormField extends StatelessWidget {
  final String label;
  TextEditingController textEditingController;
  VerificationTextFormField(
      {required this.label, required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSizeS),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: label,
            prefixIcon: const Icon(
              FontAwesomeIcons.key,
              color: primary01,
              size: kSizeS * 1.2,
            )),
      ),
    );
  }
}
