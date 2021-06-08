import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/textType.dart';
import '../text/mainText.dart';

class YourAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kSizeS),
      width: kSizeXXL * 2,
      height: kSizeL * 2,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xFF7090B0),
        //     blurRadius: 20,
        //     offset: Offset(5, 5),
        //   )
        // ],
        borderRadius: kBorderRadiusS,
        gradient: LinearGradient(
            colors: [Color(0xFFB0B2E2), Color(0xFFB2C7DE), Color(0xFFB4DADB)],
            stops: [0.0, 0.5, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText('Your Appointment', text_type.regular,
              kFontSizeHeadline4 * 0.7, white),
          kSizedBoxS,
          MainText('There is no appointment yet ', text_type.regular,
              kFontSizeHeadline4 * 0.6, white)
        ],
      ),
    );
  }
}
