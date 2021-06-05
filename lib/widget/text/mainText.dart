import 'package:flutter/material.dart';
import '../../config/color.dart';
import '../../config/constants.dart';
import '../../model/textType.dart';

class MainText extends StatelessWidget {
  final String text;
  final text_type type;
  MainText(this.text, this.type);
  bool isBold() {
    return (type == text_type.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: primary01,
          fontSize: kFontSizeHeadline4,
          fontWeight: isBold() ? FontWeight.bold : null,
          fontFamily: 'Prompt'),
    );
  }
}
