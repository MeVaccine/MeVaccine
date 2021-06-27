// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/provider/changeLanguageProvider.dart';
import 'package:provider/provider.dart';

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
                    value: Provider.of<ChangeLanguageProvider>(context)
                        .isEngSelected,
                    onChanged: (bool? value) {
                      Provider.of<ChangeLanguageProvider>(context,
                              listen: false)
                          .selectEngish();
                    })
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
                    value: Provider.of<ChangeLanguageProvider>(context)
                        .isThaiSelected,
                    onChanged: (bool? value) {
                      Provider.of<ChangeLanguageProvider>(
                        context,
                        listen: false,
                      ).selectThai();
                    })
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
