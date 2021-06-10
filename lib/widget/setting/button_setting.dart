import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonSetting extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onPressed;
  ButtonSetting(
      {required this.text, required this.onPressed, required this.icon});
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
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kSizeS * 1.3, horizontal: kSizeM),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        icon,
                        kSizedBoxS,
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: primary01,fontSize: kFontSizeHeadline4*0.8),
                        ),
                      ],
                    ),
                  ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                          FontAwesomeIcons.angleRight,
                          color: primary01,size: kSizeS*1.2
                        ),
                    )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(6),
                child: Divider(
                  color: black,
                  thickness: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
