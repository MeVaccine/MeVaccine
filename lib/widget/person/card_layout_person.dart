import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class CardPersonLayout extends StatelessWidget {
  String name;
  CardPersonLayout({required this.name });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Long Time No See !',
            style:
                TextStyle(color: primary01, fontSize: kFontSizeHeadline4 * 0.7),
          ),
          Text(
            name,
            style: TextStyle(color: accent02, fontSize: kFontSizeHeadline2),
          ),
          const Text(
            'Let\`s add another person and go vacinate',
            style:
                TextStyle(color: accent02, fontSize: kFontSizeHeadline4 * 0.65),
          ),
          const Text('together .',
              style: TextStyle(
                  color: accent02, fontSize: kFontSizeHeadline4 * 0.65))
        ],
      ),
    );
  }
}
