import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:mevaccine/provider/personProvider.dart' as PersonProvider;
import 'package:provider/provider.dart';
import '../../config/color.dart';
import '../../config/constants.dart';
import '../text/mainText.dart';
import '../../model/textType.dart';

class ProfileCard extends StatefulWidget {
  final String text;
  ProfileCard({required this.text});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    final personalInfo =
        Provider.of<AuthenicateProvider>(context, listen: false).personal;
    final person = PersonProvider.Person(
      id: personalInfo.id,
      firstname_en: personalInfo.en.firstName,
      lastname_en: personalInfo.en.lastName,
      firstname_th: personalInfo.th.firstName,
      lastname_th: personalInfo.th.lastName,
      gender_en: personalInfo.en.gender,
      gender_th: personalInfo.th.gender,
      prefix_en: personalInfo.en.prefix,
      prefix_th: personalInfo.th.prefix,
    );
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: kBorderRadiusS, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 16),
            color: const Color(0xFF7090B0).withOpacity(0.2))
      ]),
      margin: const EdgeInsets.all(20),
      padding:
          const EdgeInsets.symmetric(horizontal: kSizeXS, vertical: kSizeS * 2),
      child: CheckboxListTile(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/user-profile.png',
              ),
              radius: kSizeS * 1.5,
            ),
            kSizedBoxHorizontalXS,
            Text(
              '${person.firstname_en} ${person.lastname_en}',
              style: const TextStyle(color: primary01),
            ),
          ],
        ),
        value: _checked,
        activeColor: primary01,
        onChanged: (bool? value) {
          setState(() {
            _checked = value!;
            if (_checked) {
              Provider.of<NewAppointmentProvider>(context).selectPerson(person);
            } else {
              Provider.of<NewAppointmentProvider>(context).removePerson(person);
            }
          });
        },
      ),
    );
  }
}
