import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../appointment/step3_screen.dart';
import '../appointment/step1_screen.dart';
import '../../widget/layout/list_vaccine.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:mevaccine/model/textType.dart';

class Step2 extends StatefulWidget {
  static const routeName = '/step2';

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  bool isProvinceChange = false;
  bool isHospitalChange = false;
  bool noChange = true;
  String selectedValue = "";
  String selectedHospital = "";
  String updateLocation = '';
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenicateProvider>(context, listen: false)
        .getPreferedLocation()
        .then((value) {
      Provider.of<NewAppointmentProvider>(context, listen: false)
          .setSelectedLocation(value);
    });
    // Provider.of<AuthenicateProvider>(context, listen: false)
    //     .getHospitalLocation(
    //         Provider.of<AuthenicateProvider>(context, listen: false)
    //                     .locationAppointment ==
    //                 ""
    //             ? Provider.of<AuthenicateProvider>(context, listen: false)
    //                 .location
    //                 .province_en
    //             : isProvinceChange
    //                 ? selectedValue
    //                 : Provider.of<AuthenicateProvider>(context, listen: false)
    //                     .nameProvinceAppointment);
    print(Provider.of<NewAppointmentProvider>(context, listen: true)
        .selectedLocation
        .name_en);
    return Consumer<NewAppointmentProvider>(
        builder: (context, appointment, child) => Container(
              height: 490,
              child: Column(
                children: [
                  kSizedBoxVerticalS,
                  ListVaccine(locationID: appointment.selectedLocation.id),
                  kSizedBoxVerticalM,
                  Container(
                      margin: EdgeInsets.only(right: 200),
                      child: MainText('Location', text_type.regular,
                          kFontSizeHeadline3, primary01)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeM, vertical: kSizeXXS),
                    child: SearchableDropdown.single(
                      items: appointment.provinces.map((e) {
                        return DropdownMenuItem<dynamic>(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      hint: 'Province',
                      isCaseSensitiveSearch: true,
                      searchHint: const Text('Select your province'),
                      value: appointment.selectedLocation.province_en,
                      onChanged: (value) {
                        setState(() {
                          isProvinceChange = true;
                          selectedValue = value;
                          noChange = false;
                        });
                        // Provider.of<AuthenicateProvider>(context, listen: false)
                        //     .getLocationAppointment(
                        //         isHospitalChange
                        //             ? selectedHospital
                        //             : authen.hospital[0].name_en,
                        //         isHospitalChange
                        //             ? updateLocation
                        //             : authen.hospital[0].id,
                        //         selectedValue);
                      },
                      isExpanded: true,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: kSizeM, vertical: kSizeXXS),
                  //   child: SearchableDropdown.single(
                  //     items: authen.hospital.map((e) {
                  //       return DropdownMenuItem<dynamic>(
                  //         child: Text(e.name_en),
                  //         value: e.name_en,
                  //       );
                  //     }).toList(),
                  //     hint: 'Hospital',
                  //     isCaseSensitiveSearch: true,
                  //     searchHint: const Text('Select your hospital'),
                  //     value: isProvinceChange
                  //         ? isHospitalChange
                  //             ? selectedHospital
                  //             : authen.hospital[0].name_en
                  //         : isHospitalChange
                  //             ? selectedHospital
                  //             : authen.locationAppointment,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         isHospitalChange = true;
                  //         selectedHospital = value;
                  //         noChange = false;
                  //       });
                  //       print(selectedHospital);
                  //       for (int i = 0; i < authen.hospital.length; i++) {
                  //         if (selectedHospital == authen.hospital[i].name_en) {
                  //           setState(() {
                  //             updateLocation = authen.hospital[i].id;
                  //           });
                  //         }
                  //       }
                  // Provider.of<AuthenicateProvider>(context, listen: false)
                  //     .getLocationAppointment(
                  //         selectedHospital,
                  //         updateLocation,
                  //         selectedValue == ""
                  //             ? authen.nameProvinceAppointment
                  //             : selectedValue);
                  //     },
                  //     isExpanded: true,
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.alertTriangle,
                        color: primary01,
                        size: 16,
                      ),
                      kSizedBoxHorizontalXS,
                      Container(
                          width: 280,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('If you want to change the location.',
                                  style: TextStyle(
                                      color: primary01, fontSize: 10)),
                              Text(
                                  'You can be select text form that you want to go.',
                                  style: TextStyle(
                                      color: primary01, fontSize: 10)),
                            ],
                          )),
                    ],
                  ),
                  kSizedBoxVerticalM,
                ],
              ),
            ));
  }
}
