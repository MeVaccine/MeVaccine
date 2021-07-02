import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/widget/Logo/icon_vaccine.dart';
import 'package:mevaccine/widget/layout/list_person.dart';
import 'package:provider/provider.dart';

class CardDropdownPerson extends StatefulWidget {
  final String text;
  final int index;
  CardDropdownPerson({required this.text, required this.index});
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
  @override
  Widget build(BuildContext context) {
    final vaccines = Provider.of<NewAppointmentProvider>(context)
        .vaccinableVaccine[widget.index];

    final selectedVaccine = Provider.of<NewAppointmentProvider>(context)
        .selectedVaccine[widget.index];

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
          // TODO: Decorate the error message
          DropdownButton(
            underline: Container(
              color: white,
            ),
            disabledHint: Text(
              Languages.of(context)!.noVaccineAvaliableMessage,
              style: TextStyle(color: Colors.red),
            ),
            iconDisabledColor: Colors.grey,
            value: selectedVaccine,
            style: TextStyle(color: accent02, fontFamily: 'prompt'),
            items: selectedVaccine != null
                ? vaccines.map<DropdownMenuItem<String>>((vaccine) {
                    return DropdownMenuItem<String>(
                      value: vaccine.name,
                      child: Text(vaccine.name),
                    );
                  }).toList()
                : null,
            icon: selectedVaccine != null
                ? const Icon(
                    FeatherIcons.chevronDown,
                    color: accent02,
                  )
                : const Icon(
                    FeatherIcons.chevronDown,
                    color: Colors.grey,
                  ),
            onChanged: (String? value) {
              Provider.of<NewAppointmentProvider>(context, listen: false)
                  .selectVaccine(widget.index, value!);
            },
          ),
        ],
      ),
    );
  }
}
