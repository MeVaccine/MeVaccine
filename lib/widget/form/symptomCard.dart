import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/widget/text/mainText.dart';

class SymptomCard extends StatefulWidget {
  final String text;
  bool value;
  Function onChange;
  SymptomCard({
    required this.text,
    required this.value,
    required this.onChange,
  });
  @override
  State<SymptomCard> createState() => _SymptomCardState();
}

class _SymptomCardState extends State<SymptomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText(widget.text, text_type.regular, kFontSizeHeadline4 * 0.8,
                  primary01),
              Checkbox(
                checkColor: primary01,
                activeColor: primary01,
                value: widget.value,
                onChanged: (bool? value) {
                  widget.onChange();
                },
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
