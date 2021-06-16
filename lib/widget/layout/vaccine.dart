import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../Logo/icon_vaccine.dart';
import '../../model/textType.dart';

class Vaccine extends StatelessWidget {
  final String text;
  Vaccine({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 280,
      child: Row(
        children: [
          VaccineIcon(),
          MainText(text, text_type.regular, 16, primary01)
        ],
      ),
    );
  }
}
