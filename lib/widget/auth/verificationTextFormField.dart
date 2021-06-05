import 'package:flutter/material.dart';
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
          prefixIcon: const Icon(Icons.vpn_key)
        ),
      ),
    );
  }
}
