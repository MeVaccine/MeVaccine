import 'package:flutter/material.dart';
import './timeTable.dart';

class ListTimeTable extends StatefulWidget {
  ListTimeTable({Key? key}) : super(key: key);

  @override
  _ListTimeTableState createState() => _ListTimeTableState();
}

class _ListTimeTableState extends State<ListTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 330,
      child: GridView.count(
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        childAspectRatio: 4,
        crossAxisCount: 2,
        children: [
          TimeTable(
            time: '9:00',
            click: false,
          ),
          TimeTable(
            time: '10:00',
            click: false,
          ),
          TimeTable(
            time: '11:00',
            click: false,
          ),
          TimeTable(
            time: '13:00',
            click: false,
          ),
          TimeTable(
            time: '14:00',
            click: false,
          ),
          TimeTable(
            time: '15:00',
            click: false,
          ),
          TimeTable(
            time: '16:00',
            click: false,
          ),
          TimeTable(
            time: '17:00',
            click: false,
          ),
        ],
      ),
    );
  }
}
