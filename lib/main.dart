import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screen/register_Screen.dart';
import './screen/register_detail_screen.dart';
import './screen/verification_screen.dart';
import './screen/landing_screen.dart';
import './screen/appointment/step1_screen.dart';
import './screen/person_screen.dart';
import './screen/AddPerson/addPerson_screen.dart';
import './screen/AddPerson/AddPersonRegister_screen.dart';
import './screen/AddPerson/verification_addperson.dart';
import './screen/historyVaccinate_screen.dart';

import 'config/color.dart';
import './screen/Login_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Prompt',
        primaryColor: primary01,
      ),
      //หน้าแรกสุด
      home: LoginScreen(),
      // Routes เอาไว้ ตอนไปหน้าอื่นก็จะมา assign routeName เอ่ไว้ตรงนี้ เพื่อบอกว่า routeName นี้ไปไหน
      routes: {
        HistoryVaccinateScreen.routeName:(ctx)=>HistoryVaccinateScreen(),
        VerificationAddPerson.routeName:(ctx)=>VerificationAddPerson(),
        AddPersonRegister.routeName:(ctx)=>AddPersonRegister(),
        Step1.routeName: (ctx) => Step1(),
        AddPerson.routeName:(ctx) => AddPerson(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        RegisterDetailScreen.routeName: (ctx) => RegisterDetailScreen(),
        VerificationScreen.routeName: (ctx) => VerificationScreen(),
        LandingScreen.routeName: (ctx) => LandingScreen(),
        PersonScreen.routeName: (ctx) => PersonScreen(),
      },
    );
  }
}
