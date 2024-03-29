import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/provider/locationProvider.dart';
import 'package:mevaccine/widget/layout/vaccine.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:provider/provider.dart';

class ListVaccine extends StatelessWidget {
  String locationID;
  ListVaccine({Key? key, required this.locationID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<LocationProvider>(context, listen: false)
          .getVaccine(locationID),
      builder: (ctx, snapshort) {
        return Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: kBorderRadiusS,
              boxShadow: [
                BoxShadow(
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: const Offset(0, 16),
                    color: const Color(0xFF7090B0).withOpacity(0.2))
              ]),
          padding: const EdgeInsets.symmetric(vertical: 5),
          // color: primary02,
          height: 170,
          width: 350,
          child: GridView.count(
            childAspectRatio: 10,
            crossAxisCount: 1,
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              ...Provider.of<LocationProvider>(ctx).vaccine.map((e) => Vaccine(
                    text: e.name,
                    number: e.avaliable,
                  ))
            ],
          ),
        );
      },
    );

    // return
  }
}
