import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  ProfileText(this.text, this.color,this.size);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size,fontWeight: FontWeight.w600),
    );
  }
}
