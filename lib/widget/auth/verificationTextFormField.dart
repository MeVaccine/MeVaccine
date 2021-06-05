import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class VerificationTextFormField extends StatelessWidget {
  final String label;
  VerificationTextFormField(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSizeS),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          prefixIcon: const Icon(FontAwesomeIcons.key,color: primary01,size: kSizeS*1.2,)
        ),
      ),
    );
  }
}
