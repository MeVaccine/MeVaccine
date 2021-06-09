import 'package:flutter/material.dart';
import '../../model/textType.dart';

class MainText extends StatelessWidget {
  final String text;
  final text_type type;
  final double size;
  final Color color;
  MainText(this.text, this.type,this.size,this.color);
  //เช็ค Type enum
  bool isBold() {
    return (type == text_type.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          // แล้วก็เช็คแบบนี้เลย isBold() true? then .....   or false then :  .....
          fontWeight: isBold() ? FontWeight.bold : FontWeight.w200,
          fontFamily: 'Prompt'),
    );
  }
}
