import 'package:flutter/material.dart';
import 'package:mevaccine/config/constants.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/list_person.dart';

class Step1 extends StatelessWidget {
  static const routeName = '/step1';
  @override
  Widget build(BuildContext context) {
    // Provider.of<PersonProvider>(context, listen: false).getPerson();
    return Container(
      height: 490,
      child: Column(
        children: [
          kSizedBoxVerticalS,
          ProfileCard(),
          ListPerson(),
        ],
      ),
    );
  }
}
