import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class TimeTable extends StatefulWidget {
  final String time;
  bool click;
  Color color = white;
  Color fontcolor = primary01;
  TimeTable({required this.time, required this.click});
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  void _changeColor() {
    setState(() {
      if (widget.click = false) {
        widget.color = primary01;
        widget.fontcolor = white;
      } else {
        widget.color = white;
        widget.fontcolor = primary01;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _changeColor,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: widget.color,
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
          widget.time,
          style: TextStyle(color: widget.fontcolor, fontSize: 16),
        ),
      ),
    );
  }
}
