import 'package:flutter/material.dart';
import 'package:mevaccine/provider/addPerson.dart';
import 'package:mevaccine/widget/person/card_dropdown_person.dart';
import 'package:provider/provider.dart';

class ListDropdownperson extends StatelessWidget {
  final String text;
  const ListDropdownperson({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personProvider =
        Provider.of<AddPersonProvider>(context, listen: false);
    final persons = personProvider.person;
    return Container(
      height: 300,
      width: 370,
      child: ListView(
        children: persons.map((e) {
          if (e.check) {
            return CardDropdownPerson(
              text: e.fistname + " " + e.lastname,
            );
          }
          return SizedBox();
        }).toList(),
      ),
    );
  }
}
