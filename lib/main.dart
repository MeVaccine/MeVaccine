import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screen/register_Screen.dart';

import 'config/color.dart';
import './screen/Login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          fontFamily: 'Prompt',
          primaryColor: primary01,
        ),
        home: LoginScreen(),
        routes: {
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
        },
    );
  }
}
