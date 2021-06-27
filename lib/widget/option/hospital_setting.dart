import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/widget/button/primaryButton.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../model/location_type.dart';
import '../../screen/Setting/setting_screen.dart';

class HospitalSetting extends StatefulWidget {
  @override
  State<HospitalSetting> createState() => _HospitalSettingState();
}

class _HospitalSettingState extends State<HospitalSetting> {
  Future<void> updateHospital() async {
    String locationID = isProvinceChange
        ? Provider.of<AuthenicateProvider>(context, listen: false)
            .hospital[0]
            .id
        : updateLocation;

    try {
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .updateLocation(noChange
              ? Provider.of<AuthenicateProvider>(context, listen: false)
                  .location
                  .id
              : locationID);
      Navigator.of(context)
          .popUntil(ModalRoute.withName(SettingScreen.routeName));
    } catch (error) {}
  }

  bool isProvinceChange = false;
  bool isHospitalChange = false;
  bool noChange = true;
  String selectedValue = "";
  String selectedHospital = "";
  String updateLocation = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenicateProvider>(context, listen: false).getLocation();
    Provider.of<AuthenicateProvider>(context, listen: false)
        .getHospitalLocation(isProvinceChange
            ? selectedValue
            : Provider.of<AuthenicateProvider>(context, listen: false)
                .location
                .province_en);
    return Consumer<AuthenicateProvider>(
        builder: (context, authen, child) => SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kSizeS, vertical: kSizeS),
                      child: SearchableDropdown.single(
                        items: authen.dataprovince.map((e) {
                          return DropdownMenuItem<dynamic>(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        hint: 'Province',
                        isCaseSensitiveSearch: true,
                        searchHint: const Text('Select your province'),
                        value: isProvinceChange
                            ? selectedValue
                            : authen.location.province_en,
                        onChanged: (value) {
                          setState(() {
                            isProvinceChange = true;
                            selectedValue = value;
                            noChange = false;
                          });
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
                        value: isProvinceChange
                            ? isHospitalChange
                                ? selectedHospital
                                : authen.hospital[0].name_en
                            : isHospitalChange
                                ? selectedHospital
                                : authen.location.name_en,
                        onChanged: (value) {
                          setState(() {
                            isHospitalChange = true;
                            selectedHospital = value;
                            noChange = false;
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
                    )
                  ],
                ),
              ),
            ));
  }
}
