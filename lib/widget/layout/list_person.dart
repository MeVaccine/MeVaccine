import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:provider/provider.dart';
import '../person/card_person_appoint.dart';

class ListPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personProvider =
        Provider.of<AddPersonProvider>(context, listen: false);
    final persons = personProvider.person;
    persons.forEach((element) {
      element.check = false;
    });
    return Container(
        height: 300,
        width: 370,
        // color: primary01,
        child: ListView(
          children: persons
              .map(
                (el) => CardPersonAppoint(
                  text: el.fistname + el.lastname,
                  id: el.id,
                  onChanged: () {
                    personProvider.checkedPerson(persons.indexOf(el));
                    persons.forEach((element) {
                      print(element.check);
                    });
                    print('______');
                  },
                ),
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
