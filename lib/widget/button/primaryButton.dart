import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;
  final Color color;
  final double width;
  final double height;
  PrimaryButton(
      {required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.color = primary01,
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
            const EdgeInsets.symmetric(vertical: kSizeS, horizontal: kSizeM),
        child: isLoading
            ? SizedBox(
                height: 25,
                child: FittedBox(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : Text(
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
