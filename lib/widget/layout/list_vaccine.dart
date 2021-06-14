import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import './vaccine.dart';

class ListVaccine extends StatelessWidget {
  const ListVaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary02,
      height: 200,
      width: 315,
      child: Column(
        children: [Vaccine()],
      ),
    );
  }
}
