import 'package:flutter/material.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:provider/provider.dart';
import '../person/card_person_appoint.dart';

class ListPerson extends StatelessWidget {
  Widget renderListPerson(List<Person> persons) {
    return ListView(
      children: persons
          .map(
            (person) => CardPersonAppoint(
              person: person,
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context, listen: false);
    final isPersonLoaded =
        Provider.of<PersonProvider>(context).person.isNotEmpty;
    return Container(
      height: 300,
      width: 370,
      // color: primary01,
      child: isPersonLoaded
          ? renderListPerson(personProvider.person)
          : FutureBuilder(
              future: personProvider.getPerson(),
              builder: (ctx, snapshort) =>
                  snapshort.connectionState == ConnectionState.done
                      ? renderListPerson(personProvider.person)
                      : Center(child: CircularProgressIndicator()),
            ),
    );
  }
}
