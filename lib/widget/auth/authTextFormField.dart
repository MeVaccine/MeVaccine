import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/model/authType.dart';
import '../../config/constants.dart';
import '../auth/authTextFormField.dart';

class AuthTextForm extends StatefulWidget {
  final key;
  final TextEditingController textEditingController;
  final AuthTextFormType type;
  final String label;
  AuthTextForm(
      {this.key,
      required this.label,
      required this.type,
      required this.textEditingController});
  @override
  _AuthTextFormState createState() => _AuthTextFormState();
}

class _AuthTextFormState extends State<AuthTextForm> {
  bool isNation() {
    return (widget.type == AuthTextFormType.nationId);
  }

  bool isPhoneNumber() {
    return (widget.type == AuthTextFormType.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return '${widget.label} is required';
        }

        return null;
      },
      controller: widget.textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: const TextStyle(color: netural01),
          prefixIcon: isNation()
              ? const Icon(
                  Icons.account_box,
                  size: kSizeS * 1.25,
                )
              : isPhoneNumber()
                  ? const Icon(
                      Icons.phone,
                      size: kSizeS * 1.25,
                    )
                  : const Icon(Icons.credit_card, size: kSizeS * 1.2)),
    );
  }
}
