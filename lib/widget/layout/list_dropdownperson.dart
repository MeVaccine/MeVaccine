import 'package:flutter/material.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/widget/person/card_dropdown_person.dart';
import 'package:provider/provider.dart';

class ListDropdownperson extends StatelessWidget {
  final String text;
  const ListDropdownperson({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedPerson =
        Provider.of<NewAppointmentProvider>(context, listen: false)
            .selectedPerson;
    return FutureBuilder(
      future: Provider.of<NewAppointmentProvider>(context, listen: false)
          .getVaccineForSelectedPerson(),
      builder: (ctx, snapshort) =>
          snapshort.connectionState == ConnectionState.done
              ? Container(
                  height: 300,
                  width: 350,
                  child: ListView(
                    children: selectedPerson
                        .map((e) => CardDropdownPerson(
                              text: Languages.of(context)!.fullNamePerson(e),
                              index: selectedPerson
                                  .indexWhere((element) => element.id == e.id),
                            ))
                        .toList(),
                  ),
                )
              : CircularProgressIndicator(),
    );
  }
}
