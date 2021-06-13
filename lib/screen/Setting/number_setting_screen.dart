import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/widget/Logo/Logo_LoginScreen.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import '../../model/textType.dart';

class NumberSettingScreen extends StatelessWidget {
  static const routeName = '/number-setting';
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     bool validate() {
    return _formKey.currentState!.validate();
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
                    MainText('Change Number', text_type.bold, kFontSizeHeadline4,
                        primary01),
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
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(color: netural01),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: primary01,
                        ),
                      ),
                    ),
                    kSizedBoxL,
                    PrimaryButton(
                      onPressed: () {
                        if(validate()){
                          
                        }
                      },
                      text: 'Update',
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
