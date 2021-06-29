import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';
import '../text/mainText.dart';
import 'iconWithText.dart';

class YourAppointment extends StatelessWidget {
  DateTime appointmentDateTime;
  String locationName;
  final String checkColor;
  final Color color;
  YourAppointment(
      {required this.checkColor,
      required this.color,
      required this.appointmentDateTime,
      required this.locationName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kSizeS),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
      child: Consumer<NewAppointmentProvider>(
        builder: (ctx, newAppointmentProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Languages.of(context)!.yourAppointmentHeading,
                style: TextStyle(
                    color: checkColor == '1' ? white : primary01,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              kSizedBoxS,
              Row(
                children: [
                  IconWithText(
                    color: color,
                    icon: FeatherIcons.calendar,
                    text: DateFormat.yMd().format(appointmentDateTime),
                  ),
                  kSizedBoxHorizontalM,
                  IconWithText(
                    color: color,
                    icon: FeatherIcons.clock,
                    text: DateFormat.Hm().format(appointmentDateTime),
                  ),
                ],
              ),
              kSizedBoxVerticalXS,
              IconWithText(
                  color: color, text: locationName, icon: FeatherIcons.mapPin)
            ],
          );
        },
      ),
    );
  }
}
