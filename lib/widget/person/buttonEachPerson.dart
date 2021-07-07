import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';

class ButtonEachPerson extends StatelessWidget {
  String text;
  Function onTap;
  ButtonEachPerson({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        width: 400,
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => onTap(),
              child: Card(
                elevation: 10,
                shadowColor: const Color(0xFF7090B0).withOpacity(0.2),
                child: Container(
                  alignment: Alignment.center,
                    width: 150,
                    child: Text(
                      text,
                      style: const TextStyle(color: accent02),
                    )),
              ),
            )
          ],
        ));
  }
}
