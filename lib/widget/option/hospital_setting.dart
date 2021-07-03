import 'package:flutter/material.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/authenicateProvider.dart';
import 'package:mevaccine/provider/locationProvider.dart';
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
  bool isLoading = false;
  String? selectedProvince;
  Location? selectedLocation;
  List<Location> locations = [];

  Future<void> fetchPerferLocation() async {
    selectedLocation =
        await Provider.of<AuthenicateProvider>(context, listen: false)
            .getPreferedLocation();
    selectedProvince = selectedLocation!.province_en;
    await fetchLocationByProvince();
  }

  Future<void> fetchLocationByProvince() async {
    final tempLocation =
        await Provider.of<LocationProvider>(context, listen: false)
            .getLocationByProvince(selectedProvince!);
    setState(() {
      locations = tempLocation;
      selectedLocation = tempLocation[0];
    });
  }

  Future<void> updateLocation() async {
    try {
      setState(() {
        isLoading = true;
      });
      await Provider.of<AuthenicateProvider>(context, listen: false)
          .updateLocation(selectedLocation!.id);
      setState(() {
        isLoading = false;
      });
      Navigator.of(context)
          .popUntil(ModalRoute.withName(SettingScreen.routeName));
    } catch (error) {}
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget render() => SafeArea(
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
                    value: selectedProvince,
                    onChanged: (value) async {
                      if (value != null) {
                        // selectedProvince = value;
                        setState(() {
                          selectedProvince = value;
                        });
                        await fetchLocationByProvince();
                      }
                    },
                    isExpanded: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSizeS, vertical: kSizeS),
                  child: SearchableDropdown.single(
                    items: locations.map((e) {
                      return DropdownMenuItem<dynamic>(
                        child: Text(Languages.of(context)!.locationNameItem(e)),
                        value: e.id,
                      );
                    }).toList(),
                    hint: 'Hospital',
                    isCaseSensitiveSearch: true,
                    searchHint: const Text('Select your hospital'),
                    value: selectedLocation!.id,
                    onChanged: (value) {
                      if (value != null) {}
                    },
                    isExpanded: true,
                  ),
                ),
                kSizedBoxVerticalS,
                PrimaryButton(
                  onPressed: () async {
                    await updateLocation();
                  },
                  text: Languages.of(context)!.updateButtonLabel,
                  isLoading: isLoading,
                )
              ],
            ),
          ),
        );

    return selectedLocation == null
        ? FutureBuilder(
            future: fetchPerferLocation(),
            builder: (context, snapshort) =>
                snapshort.connectionState == ConnectionState.done
                    ? render()
                    : Center(child: CircularProgressIndicator()),
          )
        : render();
  }
}
