import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/personProvider.dart';
import 'package:mevaccine/widget/layout/deletePersonDialog.dart';
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
              child: Consumer<PersonProvider>(
                builder: (ctx, person, _) => CardPersonLayout(
                  name: Languages.of(ctx)!
                      .firstnameString(person.name_en, person.name_th),
                ),
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
                  Text(
                    Languages.of(context)!.yourPersonHeading,
                    style: TextStyle(
                        color: primary01, fontSize: kFontSizeHeadline4),
                  ),
                  kSizedBoxS,
                  FutureBuilder(
                      future:
                          Provider.of<PersonProvider>(context, listen: false)
                              .getPerson(),
                      builder: (ctx, snapshort) {
                        if (snapshort.connectionState == ConnectionState.done) {
                          final personProvider =
                              Provider.of<PersonProvider>(ctx, listen: false);
                          if (personProvider.person.isEmpty)
                            return EmptyPerson();
                          else
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...personProvider.person.map(
                                    (e) => Dismissible(
                                        key: ValueKey(e.id),
                                        background: Container(
                                          color: Colors.red,
                                          child: Icon(
                                            Icons.delete,
                                            color: white,
                                            size: 40,
                                          ),
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(right: 20),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                        ),
                                        direction: DismissDirection.endToStart,
                                        confirmDismiss: (direction) {
                                          return showDialog(
                                              context: context,
                                              builder: (ctx) =>
                                                  DeletePersonDialog(
                                                    onpressed: () {},
                                                    text: Languages.of(context)!
                                                        .deletePersonConfirmMessage,
                                                  ));
                                        },
                                        onDismissed: (direction) {
                                          Provider.of<PersonProvider>(context,
                                                  listen: false)
                                              .deletePerson(e.id);
                                        },
                                        child: CardEachPerson(
                                          fullName: Languages.of(context)!
                                              .fullNamePerson(e),
                                          id: e.id,
                                        )),
                                  ),
                                ],
                              ),
                            );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
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
            top: 680,
            left: 290,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPerson.routeName).then((_) {
                  setState(() {});
                });
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
