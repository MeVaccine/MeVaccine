import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
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
  // Future<void> updateHospital() async {
  //   String locationID = isProvinceChange
  //       ? Provider.of<AuthenicateProvider>(context, listen: false)
  //           .hospital[0]
  //           .id
  //       : updateLocation;

  //   try {
  //     await Provider.of<AuthenicateProvider>(context, listen: false)
  //         .updateLocation(noChange
  //             ? Provider.of<AuthenicateProvider>(context, listen: false)
  //                 .location
  //                 .id
  //             : locationID);
  //     Navigator.of(context)
  //         .popUntil(ModalRoute.withName(SettingScreen.routeName));
  //   } catch (error) {}
  // }

  String selectedValue = "";
  String selectedHospital = "";
  String updateLocation = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Provider.of<AuthenicateProvider>(context, listen: false).getLocation();
    // Provider.of<AuthenicateProvider>(context, listen: false)
    //     .getHospitalLocation(isProvinceChange
    //         ? selectedValue
    //         : Provider.of<AuthenicateProvider>(context, listen: false)
    //             .location
    //             .province_en);
    return FutureBuilder(
      future: Provider.of<AuthenicateProvider>(context, listen: false)
          .getPreferedLocation(),
      builder: (context, AsyncSnapshot<Location> snapshort) => snapshort
                  .connectionState ==
              ConnectionState.done
          ? SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kSizeS, vertical: kSizeS),
                      child: SearchableDropdown.single(
                        items: Provider.of<AuthenicateProvider>(
                          context,
                          listen: false,
                        ).dataProvince.map((e) {
                          return DropdownMenuItem<dynamic>(
                            child: Text(
                                Languages.of(context)!.provinceDropdownItem(e)),
                            value: e['EN'],
                          );
                        }).toList(),
                        hint: Languages.of(context)!.provinceInputLabel,
                        isCaseSensitiveSearch: true,
                        searchHint:
                            Text(Languages.of(context)!.provinceSelectLabel),
                        value: snapshort.data!.province_en,
                        onChanged: (value) {
                          if (value) {}
                        },
                        isExpanded: true,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: kSizeS, vertical: kSizeS),
                    //   child: SearchableDropdown.single(
                    //     // items: authen.hospital.map((e) {
                    //     //   return DropdownMenuItem<dynamic>(
                    //     //     child: Text(e.name_en),
                    //     //     value: e.name_en,
                    //     //   );
                    //     // }).toList(),
                    //     hint: 'Hospital',
                    //     isCaseSensitiveSearch: true,
                    //     searchHint: const Text('Select your hospital'),
                    //     // value: '',
                    //     onChanged: (value) {
                    //       if (value) {}
                    //     },
                    //     isExpanded: true,
                    //   ),
                    // ),
                    kSizedBoxVerticalS,
                    PrimaryButton(
                      onPressed: () {},
                      text: Languages.of(context)!.updateButtonLabel,
                    )
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
