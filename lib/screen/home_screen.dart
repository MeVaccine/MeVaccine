import 'package:flutter/material.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/screen/Login_screen.dart';
import 'package:mevaccine/screen/landing_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<AuthenicateProvider>(context, listen: false)
            .tryAutoLogin(),
        builder: (ctx, AsyncSnapshot<bool> snapshort) {
          if (snapshort.connectionState == ConnectionState.done) {
            return snapshort.data! ? LandingScreen() : LoginScreen();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
