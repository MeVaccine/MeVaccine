// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class TimeTable extends StatefulWidget {
  final int index;
  final String time;
  final int seat;
  final bool isSelected;
  final bool isSelectable;
  final Function changeSelectedIndex;
  TimeTable({
    required this.index,
    required this.time,
    required this.seat,
    required this.isSelected,
    required this.changeSelectedIndex,
    required this.isSelectable,
  });
  @override
  _TimeTableState createState() => _TimeTableState();
}

// TODO: If isSelectable == false -> It should grey out the text
class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.changeSelectedIndex(widget.index),
      child: Container(
        decoration: BoxDecoration(
            color: widget.isSelected ? primary01 : white,
            borderRadius: kBorderRadiusS,
            boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(0, 16),
                  color: const Color(0xFF7090B0).withOpacity(0.2))
            ]),
        alignment: Alignment.center,
        child: Text(
          '${widget.time} (${widget.seat})',
          style: TextStyle(
              color: widget.isSelected ? white : primary01, fontSize: 16),
        ),
      ),
    );
  }
}
