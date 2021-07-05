import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/layout/background_color.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import '../widget/layout/errorDailog.dart';
import '../model/textType.dart';
import '../provider/symptomFormProvider.dart';
import '../widget/form/SymptomForm.dart';

class SymptomFormScreen extends StatefulWidget {
  static const routeName = '/symptom-form';

  @override
  State<SymptomFormScreen> createState() => _SymptomFormScreenState();
}

class _SymptomFormScreenState extends State<SymptomFormScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)!.settings.arguments as String?;
    return FutureBuilder(
        future: Provider.of<SymptomfromProvider>(
          context,
        ).checkUser(userId),
        builder: (context, snapshort) =>
            snapshort.connectionState == ConnectionState.done
                ? Consumer<SymptomfromProvider>(
                    builder: (ctx, authen, child) => GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Scaffold(
                          body: Stack(children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            BlackgroundColor(),
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            Positioned(
                              top: 150,
                              left: 23,
                              child: Container(
                                  width: 330,
                                  height: 500,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: kBorderRadiusS,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 40,
                                            offset: const Offset(0, 16),
                                            spreadRadius: 0,
                                            color: const Color(0xFF7090B0)
                                                .withOpacity(0.2)),
                                      ]),
                                  child: AbsorbPointer(
                                    absorbing:
                                        authen.errorStatusCode ? true : false,
                                    child: SymptomForm(),
                                  )),
                            ),
                            (authen.errorStatusCode)
                                ? Positioned(
                                    top: 250,
                                    left: 12,
                                    child: ErrorDialog(
                                      text: Languages.of(context)!
                                          .emptySymptomFormErrorMessage,
                                    ))
                                : Container()
                          ]),
                        )))
                : Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ));
  }
}
