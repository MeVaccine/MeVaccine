import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class CardPersonAppoint extends StatefulWidget {
  final String text;
  CardPersonAppoint({required this.text});

  @override
  _CardPersonAppointState createState() => _CardPersonAppointState();
}

class _CardPersonAppointState extends State<CardPersonAppoint> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: kBorderRadiusS,
            boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(0, 16),
                  color: const Color(0xFF7090B0).withOpacity(0.2))
            ]),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
            horizontal: kSizeS, vertical: kSizeS * 0.5),
        child: CheckboxListTile(
          title: Text(
            widget.text,
            style: const TextStyle(color: accent01),
          ),
          value: timeDilation != 1.0,
          activeColor: const Color(0xFF6294AF),
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 1.15 : 1.0;
            });
          },
        ));
  }
}
