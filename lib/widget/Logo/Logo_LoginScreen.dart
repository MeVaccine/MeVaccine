import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Image.asset('assets/images/logo-login.png',fit:BoxFit.contain),
      
    );
  }
}