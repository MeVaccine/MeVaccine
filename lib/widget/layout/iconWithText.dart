import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  IconWithText({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    var text_type;
    return Container(
      height: 25,
      child: Row(children: [
        Icon(
          icon,
          color: primary01,
          size: 18,
        ),
        Text(
          text,
          style: TextStyle(color: primary01, fontSize: 12),
        )
        // MainText(text, text_type.regular, 12, primary01)
      ]),
    );
  }
}
