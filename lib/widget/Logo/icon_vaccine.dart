import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';

class VaccineIcon extends StatelessWidget {
  const VaccineIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: kSizeM,
      child: Image.asset('assets/images/vaccine.png'),
    );
  }
}
