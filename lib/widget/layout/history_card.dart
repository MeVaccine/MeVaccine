import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: kBorderRadiusS,
        gradient: LinearGradient(
            colors: [Color(0xFFB0B2E2), Color(0xFFB2C7DE), Color(0xFFB4DADB)],
            stops: [0.0, 0.5, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomRight),
      ),
    );
  }
}
