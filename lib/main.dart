import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mevaccine/screen/register_detail_screen.dart';
import 'package:provider/provider.dart';
import './screen/register_Screen.dart';

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
      home: LoginScreen(),
      routes: {
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        RegisterDetailScreen.routeName: (ctx) => RegisterDetailScreen(),
      },
    );
  }
}
