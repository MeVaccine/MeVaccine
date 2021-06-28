// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';
import './timeTable.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class ListTimeTable extends StatefulWidget {
  ListTimeTable({Key? key}) : super(key: key);

  @override
  _ListTimeTableState createState() => _ListTimeTableState();
}

class MyTimeTable {
  final String time;
  final int seat;
  MyTimeTable({required this.time, required this.seat});
}

class _ListTimeTableState extends State<ListTimeTable> {
  int selectedIndex = -1;

  Widget build(BuildContext context) {
    List<MyTimeTable> times = Provider.of<NewAppointmentProvider>(context)
        .locationDateime
        .map((dateTime) => MyTimeTable(
            time: DateFormat.Hm().format(dateTime.startDateTime),
            seat: dateTime.avaliable))
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
                  isSelected: times.indexOf(el) == selectedIndex,
                  changeSelectedIndex: (int index) {
                    if (el.seat != 0) {
                      Provider.of<NewAppointmentProvider>(context,
                              listen: false)
                          .selectDateTime(index);
                      setState(() {
                        selectedIndex = index;
                      });
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
