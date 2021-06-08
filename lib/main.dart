import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import './screen/register_Screen.dart';
import './screen/register_detail_screen.dart';
import './screen/verification_screen.dart';
import './screen/landing_screen.dart';
import './screen/appointment/step1_screen.dart';

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
        Step1.routeName:(ctx)=>Step1(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        RegisterDetailScreen.routeName: (ctx) => RegisterDetailScreen(),
        VerificationScreen.routeName:(ctx)=> VerificationScreen(),
        LandingScreen.routeName:(ctx)=> LandingScreen(),

      },
    );
  }
}
