import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;
  PrimaryButton(
      {required this.text, required this.onPressed, this.isLoading = false});
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: kSizeS, horizontal: kSizeM),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: white),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: primary01,
    );
  }
}
