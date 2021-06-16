import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:provider/provider.dart';
import '../auth/authTextFormField.dart';
import '../button/primaryButton.dart';
import '../../screen/register_detail_screen.dart';
import '../text/mainText.dart';
import '../../model/authType.dart';
import '../../widget/layout/errorDailog.dart';
import '../../screen/AddPerson/AddPersonRegister_screen.dart';
import '../../provider/authenicateProvider.dart';
import '../../model/httpException.dart';

class RegisterForm extends StatefulWidget {
  final String text;
  final RegisterType type;
  RegisterForm(this.text, this.type);
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nationID = TextEditingController();
  final _laserID = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool validate() {
    return _formKey.currentState!.validate();
  }

  bool isRegister() {
    return (widget.type == RegisterType.register);
  }

  Future<void> register() async {
    var nationalID = _nationID.text.replaceAll("-", "");
    var laserID = _laserID.text.replaceAll("-", "");
    if (validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<AuthenicateProvider>(context, listen: false)
            .getUserInformation(nationalID, laserID);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamed(RegisterDetailScreen.routeName);
      } on HttpException catch (error) {
        setState(() => _isLoading = false);
        showErrorDialog(context: context, text: error.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MainText(
                widget.text, text_type.bold, kFontSizeHeadline4, primary01),
            kSizedBoxVerticalS,
            AuthTextForm(
              label: 'National ID',
              textEditingController: _nationID,
              type: AuthTextFormType.nationId,
            ),
            kSizedBoxVerticalS,
            AuthTextForm(
              label: 'Laser ID',
              textEditingController: _laserID,
              type: AuthTextFormType.laserID,
            ),
            kSizedBoxVerticalL,
            PrimaryButton(
              isLoading: _isLoading,
              onPressed: register,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
