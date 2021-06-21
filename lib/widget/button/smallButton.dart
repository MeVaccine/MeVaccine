import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;
  final Color color;
  final Color colorFont;
  final double width;
  final double height;
  SmallButton(
      {required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.color = primary01,
      this.colorFont = white,
      this.width = double.infinity,
      this.height = kSizeS});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: width,
        decoration: _buildBoxDecoration(context),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: kSizeXS, horizontal: kSizeXS),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: white),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(color: color, borderRadius: kBorderRadiusXS);
  }
}
