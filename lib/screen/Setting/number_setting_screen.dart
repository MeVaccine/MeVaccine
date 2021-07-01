import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/widget/Logo/Logo_LoginScreen.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../../model/textType.dart';
import '../../provider/userProvider.dart';
import './verification_changeNumber.dart';

class NumberSettingScreen extends StatefulWidget {
  static const routeName = '/number-setting';

  @override
  State<NumberSettingScreen> createState() => _NumberSettingScreenState();
}

class _NumberSettingScreenState extends State<NumberSettingScreen> {
  final _phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool validate() {
      return _formKey.currentState!.validate();
    }

    bool _isLoading = false;

    Future<void> changeNumber() async {
      setState(() {
        _isLoading = true;
      });
      var phoneNumber = _phoneNumber.text.replaceAll("-", "");
      try {
        await Provider.of<UserProvider>(context, listen: false)
            .changeNumber(phoneNumber);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamed(VerificationChangeNumber.routeName);
      } on HttpException catch (error) {
        setState(() => _isLoading = false);
        showErrorDialog(
            context: context,
            text: Languages.of(context)!.httpExceptionErrorMessage(error));
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: primary01),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LogoImage(),
                    MainText(Languages.of(context)!.changePhoneNumberHeading,
                        text_type.bold, kFontSizeHeadline4, primary01),
                    kSizedBoxM,
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Number is required';
                        }
                      },
                      inputFormatters: [MaskedInputFormatter('###-###-####')],
                      controller: _phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: Languages.of(context)!.phoneNumberInputLabel,
                        hintStyle: const TextStyle(color: netural01),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: primary01,
                        ),
                      ),
                    ),
                    kSizedBoxL,
                    PrimaryButton(
                      isLoading: _isLoading,
                      onPressed: () {
                        if (validate()) {
                          changeNumber();
                        }
                      },
                      text: Languages.of(context)!.updateButtonLabel,
                      color: primary01,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
