import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import '../text/mainText.dart';
import 'iconWithText.dart';

class YourAppointment extends StatelessWidget {
  final String checkColor;
  final String checkInfo;
  final String isAppoint;
  final double width;
  final double height;
  YourAppointment(
      {required this.checkColor,
      required this.checkInfo,
      required this.isAppoint,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kSizeS),
      width: kSizeXXL * 2,
      height: kSizeL * 2,
      padding: const EdgeInsets.all(20),
      decoration: checkColor == '1'
          ? BoxDecoration(
              borderRadius: kBorderRadiusS,
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFB0B2E2),
                    Color(0xFFB2C7DE),
                    Color(0xFFB4DADB)
                  ],
                  stops: [
                    0.0,
                    0.5,
                    1.0
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomRight),
            )
          : BoxDecoration(
              color: white,
              borderRadius: kBorderRadiusS,
              boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      spreadRadius: 0,
                      offset: const Offset(0, 16),
                      color: const Color(0xFF7090B0).withOpacity(0.2))
                ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText('Your Appointment', text_type.regular,
              kFontSizeHeadline4 * 0.7, white),
          kSizedBoxXXS,
          IconWithText(
            icon: FeatherIcons.calendar,
            text: '06-03-2021',
          ),
          // MainText('There is no appointment yet ', text_type.regular,
          //     kFontSizeHeadline4 * 0.6, white)
        ],
      ),
    );
  }
}
