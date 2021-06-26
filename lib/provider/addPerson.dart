import 'package:flutter/material.dart';

class Persons {
  final int id;
  final String fistname;
  final String lastname;
  bool check;
  Persons(
      {required this.id,
      required this.fistname,
      required this.lastname,
      this.check = false});
}

class AddPersonProvider with ChangeNotifier {
  List<Persons> _person = [
    Persons(id: 1, fistname: 'Sethanant', lastname: ' Pipatpakorn'),
    Persons(id: 2, fistname: 'Kavisara', lastname: ' Srisuwatcharee'),
    Persons(id: 3, fistname: 'Thanakorn', lastname: ' Aunglunchuchod'),
    Persons(id: 4, fistname: 'Wisarut', lastname: ' Kitiyeah'),
  ];
  List<Persons> get person {
    return _person;
  }

  void setItem(List<Persons> persons) {
    this._person = persons;
  }

  void checkedPerson(int index) {
    _person[index].check = !_person[index].check;
  }
}
