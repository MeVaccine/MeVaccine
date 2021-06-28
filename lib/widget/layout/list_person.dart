import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:provider/provider.dart';
import '../person/card_person_appoint.dart';

class ListPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context, listen: false);
    return Container(
      height: 300,
      width: 370,
      // color: primary01,
      child: FutureBuilder(
        future: personProvider.getPerson(),
        builder: (ctx, snapshort) =>
            snapshort.connectionState == ConnectionState.done
                ? ListView(
                    children: personProvider.person
                        .map(
                          (person) => CardPersonAppoint(
                            text: Languages.of(ctx)!.fullNamePerson(person),
                            id: person.id,
                            onChanged: (isSelected) {
                              final newAppointmentProvider =
                                  Provider.of<NewAppointmentProvider>(ctx,
                                      listen: false);
                              if (isSelected) {
                                newAppointmentProvider.selectPerson(person);
                              } else {
                                newAppointmentProvider.removePerson(person);
                              }
                            },
                          ),
                        )
                        .toList(),
                  )
                : Center(child: CircularProgressIndicator()),
      ),
    );
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
