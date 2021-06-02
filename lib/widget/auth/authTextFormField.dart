import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import '../../config/constants.dart';

class AuthTextForm extends StatefulWidget {
  final key;
  final TextEditingController textEditingController;
  final String label;
  AuthTextForm(
      {this.key, required this.label, required this.textEditingController});
  @override
  _AuthTextFormState createState() => _AuthTextFormState();
}

class _AuthTextFormState extends State<AuthTextForm> {
  bool isNation() {
    return (widget.label == 'Nation ID');
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
          hintStyle: TextStyle(color: netural01),
          prefixIcon: isNation()
              ? Icon(
                  Icons.account_box,
                  size: kSizeS * 1.25,
                )
              : Icon(Icons.phone, size: kSizeS * 1.2)),
    );
  }
}
