import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../config/constants.dart';
import '../widget/layout/profile.dart';
import '../widget/layout/your_appointment.dart';
import '../widget/layout/menu.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landing-screen';
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenicateProvider>(context, listen: false).getName();
    return Consumer<AuthenicateProvider>(
      builder: (ctx, authen, child) => Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kSizeS * 1.5, vertical: kSizeL),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profile(
                name: authen.userInfo.firstname_en,
              ),
              kSizedBoxXS,
              MainText(Languages.of(context)!.scheduleHeading,
                  text_type.regular, kFontSizeHeadline4, primary01),
              Container(
                height: 190,
                child: YourAppointment(
                  checkColor: '1',
                  color: white,
                  appointmentDateTime: DateTime(2021, 7, 1),
                  locationName: 'Mockup location',
                ),
              ),
              Menu()
            ],
          ),
        ),
      ),
    );
  }
}
