import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../person/card_person_appoint.dart';

class AddPerson {
  final int id;
  final String fistname;
  final String lastname;
  AddPerson({required this.id, required this.fistname, required this.lastname});
}

class ListPerson extends StatelessWidget {
  List<AddPerson> person = [
    AddPerson(id: 1, fistname: 'Sethanant', lastname: ' Pipatpakorn'),
    AddPerson(id: 2, fistname: 'Kavisara', lastname: ' Srisuwatcharee'),
    AddPerson(id: 3, fistname: 'Thanakorn', lastname: ' Aunglunchuchod'),
    AddPerson(id: 4, fistname: 'Wisarut', lastname: ' Aunglunchuchod'),
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
                (el) => CardPersonAppoint(text: el.fistname + el.lastname),
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
