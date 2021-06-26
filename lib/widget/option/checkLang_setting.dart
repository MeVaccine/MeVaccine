import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/config/color.dart';

class CheckLang extends StatelessWidget {
  final String text;
  CheckLang({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(color: primary01),
                ),
                // Checkbox(value: value, onChanged: )
              ],
            ),
          ),
          Divider(
            color: primary06,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
