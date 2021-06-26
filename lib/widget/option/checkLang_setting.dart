import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';

class CheckLang extends StatefulWidget {
  @override
  _CheckLangState createState() => _CheckLangState();
}

class _CheckLangState extends State<CheckLang> {
  bool valueEng = false;
  bool valueThai = false;

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
                  'English',
                  style: TextStyle(color: primary01),
                ),
                Checkbox(
                    checkColor: primary01,
                    activeColor: primary01,
                    value: valueEng,
                    onChanged: (bool? value) => setState(() {
                          valueEng = value!;
                          valueThai = false;
                        }))
              ],
            ),
          ),
          Divider(
            color: primary06,
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thai',
                  style: TextStyle(color: primary01),
                ),
                Checkbox(
                    checkColor: primary01,
                    activeColor: primary01,
                    value: valueThai,
                    onChanged: (bool? value) => setState(() {
                          valueThai = value!;
                          valueEng = false;
                        }))
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
