import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/constants.dart';
import '../Logo/icon_vaccine.dart';

class Vaccine extends StatelessWidget {
  const Vaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text('Sinovac'), VaccineIcon()],
      ),
    );
  }
}
