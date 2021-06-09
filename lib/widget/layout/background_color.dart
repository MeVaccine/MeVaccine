import 'package:flutter/material.dart';

class BlackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
            colors: [Color(0xFFB0B2E2), Color(0xFFB2C7DE), Color(0xFFB4DADB)],
            stops: [0.0, 0.5, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomRight),
      ),
    );
  }
}
