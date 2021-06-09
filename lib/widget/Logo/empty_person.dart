import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';

class EmptyPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kSizeXXL * 1.4,
      child: Image.asset('assets/images/person_empty.png'),
    );
  }
}
