import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class CardDropdownPerson extends StatefulWidget {
  CardDropdownPerson({Key? key}) : super(key: key);

  @override
  _CardDropdownPersonState createState() => _CardDropdownPersonState();
}

class _CardDropdownPersonState extends State<CardDropdownPerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: kBorderRadiusS, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
            color: const Color(0xFF7090B0).withOpacity(0.2))
      ]),
    );
  }
}
