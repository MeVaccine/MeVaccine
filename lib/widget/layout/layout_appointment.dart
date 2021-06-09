import 'package:flutter/material.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../config/color.dart';
import '../../config/constants.dart';
import '../../model/textType.dart';

class LayoutAppointment extends StatelessWidget {
  final String text;
  final String description;
  final String step;
  final double value;
  LayoutAppointment(
      {required this.text,
      required this.description,
      required this.step,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
            colors: [Color(0xFFB0B2E2), Color(0xFFB2C7DE), Color(0xFFB4DADB)],
            stops: [0.0, 0.5, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomRight),
      ),
      child: Column(
        children: [
          AppBar(
            //สีตามพื้นหลัง
            backgroundColor: Colors.transparent,
            // `ไม้มีเงา
            elevation: 0,
            // สี icon appbar
            iconTheme: const IconThemeData(color: white),
          ),
          Row(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 100.0,
                      width: 100,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                color: primary02,
                                backgroundColor: netural04,
                                strokeWidth: 10,
                                value: value,
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            step,
                            style: const TextStyle(
                                color: primary01, fontSize: kFontSizeHeadline4),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                MainText(text, text_type.regular, kFontSizeHeadline4, white),
                MainText(description, text_type.regular,
                    kFontSizeHeadline4 * 0.7, white)
              ])
            ],
          )
        ],
      ),
    );
  }
}
