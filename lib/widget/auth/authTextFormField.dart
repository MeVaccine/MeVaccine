import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/model/authType.dart';
import '../../config/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class AuthTextForm extends StatefulWidget {
  final key;
  final TextEditingController textEditingController;
  final AuthTextFormType type;
  final String label;
  AuthTextForm(
      {this.key,
      required this.label,
      required this.type,
      required this.textEditingController});
  @override
  _AuthTextFormState createState() => _AuthTextFormState();
}

class _AuthTextFormState extends State<AuthTextForm> {
  bool isNation() {
    return (widget.type == AuthTextFormType.nationId);
  }

  bool isPhoneNumber() {
    return (widget.type == AuthTextFormType.phoneNumber);
  }

  bool isLaser() {
    return (widget.type == AuthTextFormType.laserID);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return '${widget.label} is required';
        }

        return null;
      },
      controller: widget.textEditingController,
      inputFormatters: [
        isNation()
            ? MaskedInputFormatter('#-####-#####-##-#')
            : MaskedInputFormatter('###-###-####'),
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: const TextStyle(color: netural01),
          prefixIcon: isNation()
              ? const Icon(
                  FontAwesomeIcons.addressCard,
                  size: kSizeS * 1.2,
                  color: primary01,
                )
              : isPhoneNumber()
                  ? const Icon(
                      Icons.phone,
                      size: kSizeS * 1.25,
                      color: primary01,
                    )
                  : isLaser()
                      ? const Icon(
                          FontAwesomeIcons.creditCard,
                          size: kSizeS * 1.2,
                          color: primary01,
                        )
                      : null),
    );
  }
}
