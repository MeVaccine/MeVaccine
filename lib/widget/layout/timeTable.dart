// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

// TODO: If isSelectable == false -> It should grey out the text
class TimeTable extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => changeSelectedIndex(index),
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? primary01 : white,
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
          '${time} (${seat})',
          style: TextStyle(
              color: isSelectable
                  ? isSelected
                      ? white
                      : accent01
                  : Colors.grey.shade400,
              fontSize: 16),
        ),
      ),
    );
  }
}
