import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../person/card_person_appoint.dart';

class AddPerson {
  final int id;
  final String name;
  AddPerson({required this.id, required this.name});
}

class ListPerson extends StatelessWidget {
  List<AddPerson> person = [
    AddPerson(id: 1, name: 'Sethanant Pipatpakorn'),
    AddPerson(id: 2, name: 'Kavisara Srisuwatcharee'),
    AddPerson(id: 3, name: 'Thanakorn Aunglunchuchod'),
    AddPerson(id: 4, name: 'Wisarut Kitticharoenphonngam'),
  ];
  // var person = [
  //   'Sethanant Pipatpakorn',
  //   'Kavisara Srisuwatcharee',
  //   'Thanakorn Aunglunchuchod',
  //   'Thanaphon Sombunkaeo',
  //   'Wisarut Kitticharoenphonngam'
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 370,
        // color: primary01,
        child: ListView(
          children: person
              .map(
                (el) => CardPersonAppoint(text: el.name),
              )
              .toList(),
        ));
  }
}
//  list.map((el) =>
//               Column(
//                 children: [
//                   CardPersonAppoint(
//                     text: ,
//                   ),
//                   kSizedBoxVerticalS
//                 ],
//               ),
//             ),
