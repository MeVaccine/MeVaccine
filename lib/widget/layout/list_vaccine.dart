import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/widget/layout/vaccine.dart';
import 'package:mevaccine/config/constants.dart';

class ListVaccine extends StatelessWidget {
  const ListVaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        // color: primary02,
        height: 170,
        width: 330,
        child: GridView.count(
          childAspectRatio: 4,
          crossAxisCount: 2,
          children: [
            Vaccine(text: 'Sinovac'),
            Vaccine(text: 'AstraZeneca'),
            Vaccine(text: 'Moderna'),
            Vaccine(text: 'Sinopharm'),
            Vaccine(text: 'Pfizer'),
          ],
        ));
  }
}
