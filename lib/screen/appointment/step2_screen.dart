import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/locationProvider.dart';
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
    return FutureBuilder(
        future: Provider.of<AuthenicateProvider>(context, listen: false)
            .getPreferedLocation(),
        builder: (ctx, snapshort) {
          if (snapshort.connectionState == ConnectionState.done) {
            // Set inital prefered location
            Provider.of<NewAppointmentProvider>(ctx, listen: false)
                .initSelectLocation(snapshort.data as Location);
            return Container(
              height: 490,
              child: Column(
                children: [
                  kSizedBoxVerticalS,
                  ListVaccine(
                    locationID: Provider.of<NewAppointmentProvider>(context)
                        .selectedLocation
                        .id,
                  ),
                  kSizedBoxVerticalM,
                  Container(
                      margin: EdgeInsets.only(right: 200),
                      child: MainText('Location', text_type.regular,
                          kFontSizeHeadline3, primary01)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeM, vertical: kSizeXXS),
                    child: SearchableDropdown.single(
                      items: Provider.of<NewAppointmentProvider>(context)
                          .provinces
                          .map((e) {
                        return DropdownMenuItem<dynamic>(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      hint: 'Province',
                      isCaseSensitiveSearch: true,
                      searchHint: const Text('Select your province'),
                      value: Provider.of<NewAppointmentProvider>(context)
                          .selectedLocation
                          .province_en,
                      onChanged: (value) async {
                        Provider.of<NewAppointmentProvider>(context,
                                listen: false)
                            .setSelectedProvince(value);
                        await Provider.of<LocationProvider>(ctx, listen: false)
                            .getLocationByProvince(value);
                      },
                      isExpanded: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kSizeM, vertical: kSizeXXS),
                    child: FutureBuilder(
                      future: Provider.of<LocationProvider>(ctx)
                          .getLocationByProvince(
                              Provider.of<NewAppointmentProvider>(context,
                                      listen: false)
                                  .selectedProvince),
                      builder: (ctx, snapshort) => SearchableDropdown.single(
                        items: Provider.of<LocationProvider>(ctx)
                            .hospitals
                            .map((e) {
                          return DropdownMenuItem<dynamic>(
                            child: Text(e.name_en),
                            value: e.id,
                          );
                        }).toList(),
                        hint: Provider.of<NewAppointmentProvider>(context)
                            .selectedLocation
                            .name_en,
                        isCaseSensitiveSearch: true,
                        searchHint: const Text('Select your hospital'),
                        value: Provider.of<NewAppointmentProvider>(context)
                            .selectedLocation
                            .id,
                        onChanged: (value) {
                          print(value);
                        },
                        isExpanded: true,
                      ),
                    ),
                  ),
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
            );
          }
          return CircularProgressIndicator();
        });
  }
}
