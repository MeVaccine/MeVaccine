import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:mevaccine/widget/Logo/empty_person.dart';
import 'package:mevaccine/widget/button/smallButton.dart';
import 'package:provider/provider.dart';
import '../../widget/layout/profile_card.dart';
import '../../widget/layout/layout_appointment.dart';
import '../appointment/step2_screen.dart';
import '../../widget/layout/list_person.dart';

class Step1 extends StatelessWidget {
  static const routeName = '/step1';
  @override
  Widget build(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false).getPerson();
    return Consumer<PersonProvider>(
      builder: (context, authen, child) => Container(
        height: 490,
        child: Column(
          children: [
            kSizedBoxVerticalS,
            ProfileCard(
              text: 'Kavisara Srisuwatcharee',
            ),
            // Center(
            //   child: EmptyPerson(),
            // ),
            // if(authen.isPersonEmpty)
            // EmptyPerson()
            // else
            ListPerson(),
          ],
        ),
      ),
    );
  }
}
