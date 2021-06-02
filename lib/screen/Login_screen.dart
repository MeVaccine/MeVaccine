import 'package:flutter/material.dart';
import '../widget/Logo/Logo_LoginScreen.dart';
import '../config/color.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            LogoImage(),
            Text('Login',style: TextStyle(color:primary01),)
          ],
        ),
      ),
    );
  }
}
