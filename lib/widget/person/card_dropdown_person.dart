import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:mevaccine/widget/Logo/icon_vaccine.dart';
import 'package:mevaccine/widget/layout/list_person.dart';
import 'package:provider/provider.dart';

class CardDropdownPerson extends StatefulWidget {
  final String text;
  CardDropdownPerson({required this.text});
  List<String> vaccines = [
    'Sinovac',
    'AstraZeneca',
    'Moderna',
    'Sinopharm ',
    'Pfizer-BioNTech'
  ];
  @override
  _CardDropdownPersonState createState() => _CardDropdownPersonState();
}

class _CardDropdownPersonState extends State<CardDropdownPerson> {
  String dropdownVaccine = 'Sinovac';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: kBorderRadiusS, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
            color: const Color(0xFF7090B0).withOpacity(0.2))
      ]),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
                color: primary01, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          DropdownButton(
            underline: Container(
              color: white,
            ),
            value: dropdownVaccine,
            style: TextStyle(color: accent02, fontFamily: 'prompt'),
            items: <String>[
              'Sinovac',
              'Oxford-AstraZeneca',
              'Moderna',
              'Sinopharm ',
              'Pfizer-BioNTech'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            icon: Icon(
              FeatherIcons.chevronDown,
              color: accent02,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownVaccine = value!;
                print(dropdownVaccine);
              });
            },
          ),
        ],
      ),
    );
  }
}
