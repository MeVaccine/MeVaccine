import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/widget/Logo/icon_vaccine_white.dart';
import 'package:mevaccine/widget/layout/iconWithText.dart';

class CardHistory extends StatelessWidget {
  final DateTime time;
  final String hospitalName;
  final String vaccine;
  final int dose;
  final String status;
  CardHistory(
      {required this.time,
      required this.hospitalName,
      required this.vaccine,
      required this.dose,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 170,
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
            Languages.of(context)!.vaccineDoseHeading(dose),
            style: TextStyle(
                color: white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          kSizedBoxVerticalXS,
          Row(
            children: [
              IconWithText(
                color: white,
                icon: FeatherIcons.calendar,
                text: DateFormat('dd-MM-yyyy').format(time),
              ),
              kSizedBoxHorizontalM,
              IconWithText(
                color: white,
                icon: FeatherIcons.clock,
                text: DateFormat.Hm().format(time),
              ),
            ],
          ),
          kSizedBoxVerticalXXS,
          IconWithText(
            color: white,
            icon: FeatherIcons.mapPin,
            text: hospitalName,
          ),
          kSizedBoxVerticalXXS,
          Row(
            children: [
              VaccineIconWhite(width: 19, height: 19),
              kSizedBoxHorizontalXS,
              Text(
                vaccine,
                style: TextStyle(color: white, fontSize: 14),
              )
            ],
          ),
          kSizedBoxVerticalXXS,
          IconWithText(
            color: white,
            icon: FeatherIcons.activity,
            text: status,
          ),
        ],
      ),
    );
  }
}
