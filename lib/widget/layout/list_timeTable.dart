import 'package:flutter/material.dart';
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
  @override
  List<MyTimeTable> times = [
    MyTimeTable(time: '9:00', seat: 10),
    MyTimeTable(time: '10:00', seat: 10),
    MyTimeTable(time: '11:00', seat: 10),
    MyTimeTable(time: '13:00', seat: 10),
    MyTimeTable(time: '14:00', seat: 10),
    MyTimeTable(time: '15:00', seat: 10),
    MyTimeTable(time: '16:00', seat: 10),
    MyTimeTable(time: '17:00', seat: 10),
  ];
  int selectedIndex = -1;
  void changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
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
                  isSelected: times.indexOf(el) == selectedIndex,
                  changeSelectedIndex: changeSelectedIndex),
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
