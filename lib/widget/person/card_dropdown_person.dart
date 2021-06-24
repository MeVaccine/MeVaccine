import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:mevaccine/widget/layout/list_person.dart';
import 'package:provider/provider.dart';

class CardDropdownPerson extends StatefulWidget {
  final String text;
  CardDropdownPerson({required this.text});
  @override
  _CardDropdownPersonState createState() => _CardDropdownPersonState();
}

class _CardDropdownPersonState extends State<CardDropdownPerson> {
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(
          horizontal: kSizeM, vertical: kSizeM * 0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: const TextStyle(color: primary01),
          ),
          Icon(
            FeatherIcons.chevronDown,
            color: primary01,
          )
        ],
      ),
    );
  }
}
