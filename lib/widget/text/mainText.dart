import 'package:flutter/material.dart';
import '../../config/color.dart';
import '../../config/constants.dart';

class MainText extends StatelessWidget {
  final String text;
  MainText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: primary01,
          fontSize: kFontSizeHeadline4,
          fontWeight: FontWeight.bold,
          fontFamily: 'Prompt'),
    );
  }
}
