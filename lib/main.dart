import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/Login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(),
        home: LoginScreen(),
    );
  }
}
