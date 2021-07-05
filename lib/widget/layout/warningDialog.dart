import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/button/smallButton.dart';

class WarningDialog extends StatelessWidget {
  final String text;
  WarningDialog({required this.text});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
            height: 200,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    alignment: Alignment.topCenter,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                    )),
                kSizedBoxVerticalM,
                SmallButton(
                  text: 'OK',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: primary03,
                  width: 120,
                  colorFont: white,
                ),
              ],
            )));
  }
}

void dialog({required BuildContext context, required String text}) {
  showDialog(
    context: context,
    builder: (context) => WarningDialog(
      text: text,
    ),
  );
}
