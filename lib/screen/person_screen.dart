import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:provider/provider.dart';
import '../screen/AddPerson/addPerson_screen.dart';
import '../widget/Logo/empty_person.dart';
import '../widget/person/card_layout_person.dart';
import '../widget/layout/background_color.dart';
import '../screen/landing_screen.dart';
import '../widget/person/card_eachPerson.dart';

class PersonScreen extends StatefulWidget {
  static const routeName = '/person';

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false).getPerson();
    return Consumer<PersonProvider>(
        builder: (ctx, authen, child) => Scaffold(
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
                                color:
                                    const Color(0xFF7090B0).withOpacity(0.2)),
                          ]),
                      child: CardPersonLayout(
                        name: authen.name_en,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 330,
                    left: 22.5,
                    child: Container(
                      width: 330,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Person ',
                            style: TextStyle(
                                color: primary01, fontSize: kFontSizeHeadline4),
                          ),
                          kSizedBoxS,
                          if (authen.isPersonEmpty)
                            EmptyPerson()
                          else
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...authen.person.map(
                                    (e) => CardEachPerson(
                                      firstname: e.firstname_en,
                                      lastname: e.lastname_en,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // AppBar(
                  //   //สีตามพื้นหลัง
                  //   backgroundColor: Colors.transparent,
                  //   // `ไม้มีเงา
                  //   elevation: 0,
                  //   // สี icon appbar

                  //   iconTheme: const IconThemeData(color: white),
                  // ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context, LandingScreen.routeName);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: white,
                        size: kSizeM,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 720,
                    left: 290,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AddPerson.routeName);
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
            ));
  }
}
