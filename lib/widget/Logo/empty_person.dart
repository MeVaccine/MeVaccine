import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';

class EmptyPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: kSizeXXL * 1.1,
            child: Image.asset('assets/images/person_empty.png'),
          ),
          Text(
            Languages.of(context)!.noPersonDescription,
            textAlign: TextAlign.center,
            style: TextStyle(color: primary01),
          )
        ],
      ),
    );
  }
}
