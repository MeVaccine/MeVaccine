import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/model/authType.dart';
import 'package:mevaccine/model/httpException.dart';
import 'package:mevaccine/model/textType.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/layout/errorDailog.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../config/color.dart';
import '../widget/button/primaryButton.dart';
import '../config/constants.dart';
import '../widget/Logo/logo-medkit.dart';
import '../widget/auth/register_TextForm.dart';
import '../screen/verification_screen.dart';
import 'package:provider/provider.dart';

class RegisterDetailScreen extends StatefulWidget {
  static const routeName = '/register-detail';

  @override
  State<RegisterDetailScreen> createState() => _RegisterDetailScreenState();
}

class _RegisterDetailScreenState extends State<RegisterDetailScreen> {
  bool _isLoading = false;
  String nationID = "";
  String laserID = "";
  final _nothing = TextEditingController();
  final _phoneNumber = TextEditingController();
  String selectedValue = "";
  String selectedHospital = "";
  String hospitalID = "";
  bool isNull() {
    return (selectedValue == "");
  }

  Future<void> register() async {
    setState(() {
      _isLoading = true;
    });
    var phoneNumber = _phoneNumber.text.replaceAll("-", "");
    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .register(nationID, laserID, phoneNumber, hospitalID);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushNamed(VerificationScreen.routeName);
    } on HttpException catch (error) {
      setState(() => _isLoading = false);
      showErrorDialog(context: context, text: error.message);
    }
  }

  Future<void> getHospital() async {
    String province = selectedValue;
    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .getHospitalLocation(province);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Consumer<AuthenicateProvider>(
          builder: (context, authen, child) => Scaffold(
                body: Container(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ตอนแรกมีปัญหา app bar อนู่ใน scaffold เลื่อนแล้ว appbar บัง เลยทำเป็น widget ตัวหนึ่งไปเลย
                        AppBar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          iconTheme: const IconThemeData(color: Colors.black),
                        ),
                        // ข้างล่างนี้กห็ ฟอร์ม ต่างๆ
                        MainText(Languages.of(context)!.registerHeadingLabel,
                            text_type.bold, kFontSizeHeadline4, primary01),
                        kSizedBoxVerticalS,
                        LogoMedkit(),
                        kSizedBoxVerticalS,
                        MainText(Languages.of(context)!.personalInfoHeading,
                            text_type.regular, kFontSizeHeadline4, primary01),
                        RegisterTextForm(
                          label: Languages.of(context)!
                              .personalPrefix(authen.personal),
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: Languages.of(context)!
                              .personalFirstname(authen.personal),
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: Languages.of(context)!
                              .personalLastname(authen.personal),
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: Languages.of(context)!
                              .personalGender(authen.personal),
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: DateFormat.yMd()
                              .format(authen.personal.en.date_of_birth),
                          type: RegsiterTextFormType.calendar,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                            textEditingController: _phoneNumber,
                            label: Languages.of(context)!.phoneNumberInputLabel,
                            type: RegsiterTextFormType.phoneNumber,
                            active: RegisterActiveType.enable),
                        kSizedBoxVerticalM,
                        MainText(Languages.of(context)!.registerLocationHeading,
                            text_type.bold, kFontSizeHeadline4, primary01),

                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kSizeS, vertical: kSizeS),
                            child: SearchableDropdown.single(
                              items: authen.dataProvince.map((e) {
                                return DropdownMenuItem<dynamic>(
                                  child: Text(Languages.of(context)!
                                      .provinceDropdownItem(e)),
                                  value: e['EN'],
                                );
                              }).toList(),
                              hint: Languages.of(context)!.provinceInputLabel,
                              isCaseSensitiveSearch: true,
                              searchHint: Text(
                                  Languages.of(context)!.provinceInputLabel),
                              onChanged: (value) async {
                                if (value != null) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                  await getHospital();
                                  setState(() {
                                    selectedHospital =
                                        authen.hospital[0].name_en;
                                  });
                                }
                              },
                              isExpanded: true,
                            )),

                        //SerachAbleDropDown  ยังไม่ได้ทำ searchFN
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kSizeS, vertical: kSizeS),
                          child: SearchableDropdown.single(
                            items: authen.hospital.map((e) {
                              return DropdownMenuItem<dynamic>(
                                child: Text(
                                  Languages.of(context)!.hospitalNameItem(e),
                                ),
                                value: e.name_en,
                              );
                            }).toList(),
                            value: selectedHospital == null ||
                                    selectedHospital.isEmpty
                                ? null
                                : selectedHospital,
                            hint:
                                Text(Languages.of(context)!.locationInputLabel),
                            isCaseSensitiveSearch: true,
                            searchHint:
                                Text(Languages.of(context)!.locationInputLabel),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedHospital = value;
                                });
                              }
                            },
                            isExpanded: true,
                          ),
                        ),
                        kSizedBoxVerticalM,
                        PrimaryButton(
                          isLoading: _isLoading,
                          onPressed: () {
                            for (int i = 0; i < authen.hospital.length; i++) {
                              if (selectedHospital ==
                                  authen.hospital[i].name_en) {
                                setState(() {
                                  hospitalID = authen.hospital[i].id;
                                });
                              }
                            }
                            setState(() {
                              nationID = authen.personal.id;
                              laserID = authen.personal.laserId;
                            });
                            register();
                            // Navigator.of(context)
                            //     .pushNamed(VerificationScreen.routeName);
                          },
                          text: Languages.of(context)!.doneButtonLabel,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
