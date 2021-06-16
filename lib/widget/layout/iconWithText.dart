import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  IconWithText({
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          icon,
          color: color,
          size: 18,
        ),
        kSizedBoxHorizontalXS,
        Text(
          text,
          style: TextStyle(color: color, fontSize: 14),
        )
      ]),
    );
  }
}
