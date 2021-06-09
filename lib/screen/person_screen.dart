import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../screen/AddPerson/addPerson_screen.dart';
import '../widget/Logo/empty_person.dart';
import '../widget/person/card_layout_person.dart';
import '../widget/layout/background_color.dart';

class PersonScreen extends StatelessWidget {
  static const routeName = '/person';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(width: double.infinity, height: double.infinity),
          BlackgroundColor(),
          Positioned(
            top: 150,
            left: 22.5,
            child: Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: kBorderRadiusS,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        offset: const Offset(0, 16),
                        spreadRadius: 0,
                        color: const Color(0xFF7090B0).withOpacity(0.2)),
                  ]),
              child: CardPersonLayout(),
            ),
          ),
          Positioned(
            top: 330,
            left: 22.5,
            child: Container(
              width: 345,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Person ',
                      style: TextStyle(
                          color: primary01, fontSize: kFontSizeHeadline4),
                    ),
                    kSizedBoxS,
                    EmptyPerson()
                  ]),
            ),
          ),
          AppBar(
            //สีตามพื้นหลัง
            backgroundColor: Colors.transparent,
            // `ไม้มีเงา
            elevation: 0,
            // สี icon appbar
            iconTheme: const IconThemeData(color: white),
          ),
          Positioned(
            top: 720,
            left: 290,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AddPerson.routeName);
              },
              backgroundColor: primary01,
              child: Icon(
                Icons.add,
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
