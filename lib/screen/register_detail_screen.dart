import 'package:flutter/material.dart';
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
  List<String> dataprovince = [
    'Bangkok',
    'Samut Prakan',
    'Nonthaburi',
    'Pathum Thani',
    'Phra Nakhon Si Ayutthaya',
    'Ang Thong',
    'Loburi',
    'Sing Buri',
    'Chai Nat',
    'Saraburi',
    'Chon Buri',
    'Rayong',
    'Chanthaburi',
    'Trat',
    'Chachoengsao',
    'Prachin Buri',
    'Nakhon Nayok',
    'Sa Kaeo',
    'Nakhon Ratchasima',
    'Buri Ram',
    'Surin',
    'Si Sa Ket',
    'Ubon Ratchathani',
    'Yasothon',
    'Chaiyaphum',
    'Amnat Charoen',
    'Nong Bua Lam Phu',
    'Khon Kaen',
    'Udon Thani',
    'Loei',
    'Nong Khai',
    'Maha Sarakham',
    'Roi Et',
    'Kalasin',
    'Sakon Nakhon',
    'Nakhon Phanom',
    'Mukdahan',
    'Chiang Mai',
    'Lamphun',
    'Lampang',
    'Uttaradit',
    'Phrae',
    'Nan',
    'Phayao',
    'Chiang Rai',
    'Mae Hong Son',
    'Nakhon Sawan',
    'Uthai Thani',
    'Kamphaeng Phet',
    'Tak',
    'Sukhothai',
    'Phitsanulok',
    'Phichit',
    'Phetchabun',
    'Ratchaburi',
    'Kanchanaburi',
    'Suphan Buri',
    'Nakhon Pathom',
    'Samut Sakhon',
    'Samut Songkhram',
    'Phetchaburi',
    'Prachuap Khiri Khan',
    'Nakhon Si Thammarat',
    'Krabi',
    'Phangnga',
    'Phuket',
    'Surat Thani',
    'Ranong',
    'Chumphon',
    'Songkhla',
    'Satun',
    'Trang',
    'Phatthalung',
    'Pattani',
    'Yala',
    'Narathiwat',
    'buogkan'
  ];
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
                          label: authen.personal.en.prefix,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.firstName,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.lastName,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.gender,
                          type: RegsiterTextFormType.nothing,
                          active: RegisterActiveType.disable,
                          textEditingController: _nothing,
                        ),
                        RegisterTextForm(
                          label: authen.personal.en.date_of_birth.toString(),
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
                              items: dataprovince.map((e) {
                                return DropdownMenuItem<dynamic>(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              hint: Languages.of(context)!.provinceInputLabel,
                              isCaseSensitiveSearch: true,
                              searchHint: const Text('Select your province'),
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                                getHospital();
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
                                  e.name_en,
                                ),
                                value: e.name_en,
                              );
                            }).toList(),
                            hint:
                                Text(Languages.of(context)!.locationInputLabel),
                            isCaseSensitiveSearch: true,
                            searchHint:
                                Text(Languages.of(context)!.locationInputLabel),
                            onChanged: (value) {
                              setState(() {
                                selectedHospital = value;
                              });
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
