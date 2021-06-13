import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class cardPersonAppoint extends StatefulWidget {
  @override
  _cardPersonAppointState createState() => _cardPersonAppointState();
}

class _cardPersonAppointState extends State<cardPersonAppoint> {
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
          horizontal: kSizeS, vertical: kSizeS * 2.5),
    );
  }
}
