import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';

class ButtonEachPerson extends StatelessWidget {
  String text;
  ButtonEachPerson({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        width: 300,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {},
                child: Card(
                  elevation: 10,
                  shadowColor: const Color(0xFF7090B0).withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        child: Text(
                          text,
                          style: const TextStyle(color: accent02),
                        )),
                  ),
                ))
          ],
        ));
  }
}
