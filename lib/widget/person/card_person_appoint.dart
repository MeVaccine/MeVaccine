import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:provider/provider.dart';

class CardPersonAppoint extends StatefulWidget {
  // final String text;
  // final String id;
  // final Function onChanged;
  final Person person;
  CardPersonAppoint({required this.person});

  @override
  _CardPersonAppointState createState() => _CardPersonAppointState();
}

class _CardPersonAppointState extends State<CardPersonAppoint> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    final newAppointmentProvider =
        Provider.of<NewAppointmentProvider>(context, listen: false);
    _checked = newAppointmentProvider.isPersonSelected(widget.person);
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
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
            horizontal: kSizeS, vertical: kSizeS * 0.5),
        child: CheckboxListTile(
          title: Text(
            Languages.of(context)!.fullNamePerson(widget.person),
            style: const TextStyle(color: accent01),
          ),
          value: _checked,
          activeColor: accent01,
          onChanged: (bool? value) {
            setState(() {
              _checked = value!;
            });
            newAppointmentProvider.resetSelectedVaccine();
            if (_checked) {
              newAppointmentProvider.selectPerson(widget.person);
            } else {
              newAppointmentProvider.removePerson(widget.person);
            }
          },
        ));
  }
}
