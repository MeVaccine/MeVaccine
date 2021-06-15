import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class TimeTable extends StatefulWidget {
  final String time;
  TimeTable({required this.time});
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 45,
      decoration:
          BoxDecoration(color: white, borderRadius: kBorderRadiusS, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
            color: const Color(0xFF7090B0).withOpacity(0.2))
      ]),
      child: Text(widget.time),
    );
  }
}
