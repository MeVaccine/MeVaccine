import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import '../widget/Logo/logo_history.dart';

class HistoryVaccinateScreen extends StatelessWidget {
  static const routeName ='/history';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:AppBar(
            //สีตามพื้นหลัง
            backgroundColor: Colors.transparent,
            // `ไม้มีเงา
            elevation: 0,
            // สี icon appbar

            iconTheme: const IconThemeData(color: primary01),
          ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kSizeS*1.5,vertical: kSizeL),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoHistory(),
            kSizedBoxVerticalL

          ],
        ),
      ),
    );
  }
}