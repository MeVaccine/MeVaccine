import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mevaccine/provider/addPerson.dart';
import 'package:provider/provider.dart';

class CardPersonAppoint extends StatefulWidget {
  final String text;
  final String id;
  final Function onChanged;
  CardPersonAppoint(
      {required this.text, required this.id, required this.onChanged});

  @override
  _CardPersonAppointState createState() => _CardPersonAppointState();
}

class _CardPersonAppointState extends State<CardPersonAppoint> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    // final persons = Provider.of<AddPersonProvider>(context).person;
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
            widget.text,
            style: const TextStyle(color: accent01),
          ),
          value: _checked,
          activeColor: accent01,
          onChanged: (bool? value) {
            setState(() {
              _checked = value!;
              widget.onChanged(_checked);
            });
          },
        ));
  }
}
