import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuNavigator extends StatelessWidget {
  final String text;
  final Function onPressed;
  MenuNavigator({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: double.infinity,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Card(
        elevation: 10,
        shadowColor: const Color(0xFF7090B0).withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kSizeS * 1.3, horizontal: kSizeM),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: primary01),
            ),
            const Icon(
              FontAwesomeIcons.angleRight,
              color: primary01,
            )
          ]),
        ),
      ),
    );
  }
}
