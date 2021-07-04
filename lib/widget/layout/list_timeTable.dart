// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';
import './timeTable.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class MyTimeTable {
  final String time;
  final int seat;
  final bool isSelectable;
  MyTimeTable(
      {required this.time, required this.seat, required this.isSelectable});
}

class ListTimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MyTimeTable> times = Provider.of<NewAppointmentProvider>(context)
        .locationDateime
        .map(
          (dateTime) => MyTimeTable(
              time: DateFormat.Hm().format(dateTime.startDateTime),
              seat: dateTime.avaliable,
              isSelectable:
                  dateTime.startDateTime.isAfter(DateTime.now().toLocal()) ||
                      dateTime.avaliable <= 0),
        )
        .toList();

    return Container(
      height: 380,
      width: 330,
      child: GridView.count(
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        childAspectRatio: 3,
        crossAxisCount: 2,
        children: times
            .map(
              (el) => TimeTable(
                  index: times.indexOf(el),
                  time: el.time,
                  seat: el.seat,
                  isSelectable: el.isSelectable,
                  isSelected: times.indexOf(el) ==
                      Provider.of<NewAppointmentProvider>(context)
                          .selectedDateTimeIndex,
                  changeSelectedIndex: (int index) {
                    if (el.isSelectable) {
                      Provider.of<NewAppointmentProvider>(context,
                              listen: false)
                          .selectDateTime(index);
                    }
                  }),
            )
            .toList(),
      ),
    );
  }
}

// times.map((el)=>{
//             var index = times.indexOf(el);
//             return TimeTable(time:el.time, isSelected: index == selectedIndex,changeSelectedIndex:changeSelectedIndex);
//           }).toList();
