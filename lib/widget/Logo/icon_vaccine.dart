import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';

class VaccineIcon extends StatelessWidget {
  final double width;
  final double height;
  VaccineIcon({required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset('assets/images/vaccine.png'),
    );
  }
}
