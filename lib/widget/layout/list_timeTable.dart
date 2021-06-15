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
      child: TimeTable(
        time: '9:00',
      ),
    );
  }
}
