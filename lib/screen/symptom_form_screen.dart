import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/layout/background_color.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../model/textType.dart';
import '../widget/form/SymptomForm.dart';

class SymptomFormScreen extends StatelessWidget {
  static const routeName = '/symptom-form';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
        ),
        BlackgroundColor(),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Positioned(
          top: 150,
          left: 22.5,
          child: Container(
            width: 330,
            height: 500,
            decoration: BoxDecoration(
                color: white,
                borderRadius: kBorderRadiusS,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      offset: const Offset(0, 16),
                      spreadRadius: 0,
                      color: const Color(0xFF7090B0).withOpacity(0.2)),
                ]),
            child: SymptomForm(),
          ),
        ),
      ]),
    );
  }
}
