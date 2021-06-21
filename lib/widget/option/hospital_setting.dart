import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../model/textType.dart';
import '../../screen/Setting/setting_screen.dart';

class HospitalSetting extends StatefulWidget {
  final String text;
  HospitalSetting(this.text);
  @override
  State<HospitalSetting> createState() => _HospitalSettingState();
}

class _HospitalSettingState extends State<HospitalSetting> {
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
  String updateLocation = "";
  Future<void> getHospital() async {
    String province = selectedValue;
    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .getHospitalLocation(province);
    } catch (error) {}
  }

  Future<void> updateHospital() async {
    String locationID = updateLocation;

    print(locationID);
    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .updateLocation(locationID);
      Navigator.of(context)
          .popUntil(ModalRoute.withName(SettingScreen.routeName));
    } catch (error) {}
  }

  bool isChange = false;
  bool isOnly = false;
  String selectedValue = "";
  String selectedHospital = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenicateProvider>(context, listen: false).getLocation();
    return Consumer<AuthenicateProvider>(
        builder: (context, authen, child) => SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    MainText(widget.text, text_type.bold, kFontSizeHeadline4,
                        primary01),
                    kSizedBoxVerticalS,
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
                        hint: 'Province',
                        isCaseSensitiveSearch: true,
                        searchHint: const Text('Select your province'),
                        value: isChange
                            ? selectedValue
                            : authen.location.province_en,
                        onChanged: (value) {
                          setState(() {
                            isChange = true;
                            selectedValue = value;
                          });
                          getHospital();
                        },
                        isExpanded: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kSizeS, vertical: kSizeS),
                      child: SearchableDropdown.single(
                        items: authen.hospital.map((e) {
                          return DropdownMenuItem<dynamic>(
                            child: Text(e.name_en),
                            value: e.name_en,
                          );
                        }).toList(),
                        hint: 'Hospital',
                        isCaseSensitiveSearch: true,
                        searchHint: const Text('Select your hospital'),
                        value: isChange
                            ? selectedHospital
                            : isOnly
                                ? selectedHospital
                                : authen.location.name_en,
                        onChanged: (value) {
                          setState(() {
                            isOnly = true;
                            selectedHospital = value;
                          });
                          for (int i = 0; i < authen.hospital.length; i++) {
                            if (selectedHospital ==
                                authen.hospital[i].name_en) {
                              setState(() {
                                updateLocation = authen.hospital[i].id;
                              });
                            }
                          }
                        },
                        isExpanded: true,
                      ),
                    ),
                    kSizedBoxVerticalS,
                    PrimaryButton(
                      onPressed: updateHospital,
                      text: 'Update',
                    ),
                  ],
                ),
              ),
            ));
  }
}
