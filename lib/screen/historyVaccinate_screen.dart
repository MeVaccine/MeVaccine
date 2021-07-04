import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/appointmentProvider.dart';
import 'package:mevaccine/widget/layout/history_card.dart';
import 'package:provider/provider.dart';
import '../widget/Logo/logo_history.dart';

class HistoryVaccinateScreen extends StatelessWidget {
  static const routeName = '/history';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //สีตามพื้นหลัง
          backgroundColor: Colors.transparent,
          // `ไม้มีเงา
          elevation: 0,
          // สี icon appbar

          iconTheme: const IconThemeData(color: primary01),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Languages.of(context)!.myAppointmentHeading,
                style: TextStyle(color: accent02, fontSize: 18),
              ),
              kSizedBoxVerticalM,
              Container(
                height: 600,
                child: FutureBuilder(
                    future:
                        Provider.of<AppointmentProvider>(context, listen: false)
                            .getAppointment(),
                    builder: (context, snapshort) {
                      if (snapshort.connectionState == ConnectionState.done) {
                        if (Provider.of<AppointmentProvider>(context)
                            .appointments
                            .isEmpty) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kSizeM, vertical: kSizeL),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [LogoHistory(), kSizedBoxVerticalL],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: Provider.of<AppointmentProvider>(context)
                              .appointments
                              .length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              CardHistory(
                                dose: Provider.of<AppointmentProvider>(context)
                                    .appointments[index]
                                    .doseNumber,
                                hospitalName: Languages.of(context)!
                                    .locationNameItem(
                                        Provider.of<AppointmentProvider>(
                                                context)
                                            .appointments[index]
                                            .location),
                                time: Provider.of<AppointmentProvider>(context)
                                    .appointments[index]
                                    .dateTime,
                                vaccine:
                                    Provider.of<AppointmentProvider>(context)
                                        .appointments[index]
                                        .vaccine
                                        .name,
                              ),
                              kSizedBoxVerticalS,
                            ],
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ));
  }
}
