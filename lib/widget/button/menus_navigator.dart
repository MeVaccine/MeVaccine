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
        decoration: _buildBoxDecoration(context),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Card(
        elevation: 10,
        shadowColor: const Color(0xFF7090B0).withOpacity(0.5),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: kSizeS*1.1, horizontal: kSizeM),
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

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return const BoxDecoration(
      color: white,
      borderRadius: kBorderRadiusM,
      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          offset: Offset(5, 150),
        ),
      ],
    );
  }
}
