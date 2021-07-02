import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/Logo/icon_vaccine.dart';
import 'package:mevaccine/widget/layout/iconWithText.dart';
import 'package:mevaccine/widget/layout/vaccine.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: kBorderRadiusS,
        gradient: LinearGradient(
            colors: [Color(0xFFB0B2E2), Color(0xFFB2C7DE), Color(0xFFB4DADB)],
            stops: [0.0, 0.5, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomRight),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Languages.of(context)!.vaccineDoseHeading,
            style: TextStyle(
                color: white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          kSizedBoxVerticalXS,
          Row(
            children: [
              IconWithText(
                color: white,
                icon: FeatherIcons.calendar,
                text: '06-03-2021',
              ),
              kSizedBoxHorizontalM,
              IconWithText(
                color: white,
                icon: FeatherIcons.clock,
                text: '9:00',
              ),
            ],
          ),
          kSizedBoxVerticalXXS,
          IconWithText(
            color: white,
            icon: FeatherIcons.mapPin,
            text: 'Siriraj Piyamaharajkarun Hospital',
          ),
          kSizedBoxVerticalXXS,
          Row(
            children: [
              VaccineIcon(width: 20, height: 20),
              kSizedBoxHorizontalXS,
              Text(
                'Sinovac Life Sciences',
                style: TextStyle(color: white, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
