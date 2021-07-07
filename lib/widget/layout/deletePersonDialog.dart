import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/button/smallButton.dart';

class DeletePersonDialog extends StatelessWidget {
  final String text;
  Function onpressed;
  DeletePersonDialog({required this.text, required this.onpressed});
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallButton(
                        text: Languages.of(context)!.cancelButtonLabel,
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        color: white,
                        width: 100,
                        colorFont: error,
                        colorBorder: error,
                      ),
                      SmallButton(
                        text: Languages.of(context)!.confirmButtonLabel,
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        color: error,
                        width: 100,
                        colorFont: white,
                      ),
                    ]),
              ],
            )));
  }
}

void deleteDialog(
    {required BuildContext context,
    required String text,
    required Function onpressed}) {
  showDialog(
    context: context,
    builder: (context) => DeletePersonDialog(
      text: text,
      onpressed: onpressed,
    ),
  );
}
