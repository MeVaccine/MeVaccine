import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mevaccine/config/color.dart';
import 'package:mevaccine/config/constants.dart';
import 'package:mevaccine/localization/language/languages.dart';
import 'package:mevaccine/provider/newAppointmentProvider.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../widget/layout/list_vaccine.dart';
import 'package:mevaccine/widget/text/mainText.dart';
import 'package:mevaccine/model/textType.dart';

class Step2 extends StatelessWidget {
  static const routeName = '/step2';

  @override
  Widget build(BuildContext context) {
    Widget render(BuildContext ctx) {
      return Container(
        height: 490,
        child: Column(
          children: [
            kSizedBoxVerticalS,
            ListVaccine(
              locationID:
                  Provider.of<NewAppointmentProvider>(ctx).selectedLocation!.id,
            ),
            kSizedBoxVerticalM,
            Container(
                margin: const EdgeInsets.only(right: 200),
                child: MainText(Languages.of(ctx)!.locationHeading,
                    text_type.regular, kFontSizeHeadline3, primary01)),
            // Province Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSizeM, vertical: kSizeXXS),
              child: SearchableDropdown.single(
                items: Provider.of<NewAppointmentProvider>(ctx, listen: false)
                    .provinces
                    .map((e) {
                  return DropdownMenuItem<dynamic>(
                    child: Text(Languages.of(ctx)!.provinceDropdownItem(e)),
                    value: e['EN'],
                  );
                }).toList(),
                hint: 'Province',
                isCaseSensitiveSearch: true,
                searchHint: const Text('Select your province'),
                value:
                    Provider.of<NewAppointmentProvider>(ctx).selectedProvince,
                onChanged: (value) async {
                  await Provider.of<NewAppointmentProvider>(ctx, listen: false)
                      .setSelectedProvince(value);
                },
                isExpanded: true,
              ),
            ),
            // Location Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSizeM, vertical: kSizeXXS),
              child: SearchableDropdown.single(
                items:
                    Provider.of<NewAppointmentProvider>(ctx).locations.map((e) {
                  return DropdownMenuItem<dynamic>(
                    child: Text(Languages.of(ctx)!.locationNameItem(e)),
                    value: e.id,
                  );
                }).toList(),
                hint: Languages.of(ctx)!.locationNameItem(
                    Provider.of<NewAppointmentProvider>(ctx).selectedLocation!),
                isCaseSensitiveSearch: true,
                searchHint: const Text('Select your hospital'),
                value: Provider.of<NewAppointmentProvider>(ctx)
                    .selectedLocation!
                    .id,
                onChanged: (value) {
                  Provider.of<NewAppointmentProvider>(ctx, listen: false)
                      .selectLocation(value);
                },
                isExpanded: true,
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
                        Text(Languages.of(ctx)!.changingLocationMessage1,
                            style: TextStyle(color: primary01, fontSize: 10)),
                        Text(Languages.of(ctx)!.changingLocationMessage2,
                            style: TextStyle(color: primary01, fontSize: 10)),
                      ],
                    )),
              ],
            ),
            kSizedBoxVerticalM,
          ],
        ),
      );
    }

    final isLocationLoaded =
        Provider.of<NewAppointmentProvider>(context).selectedLocation != null;
    return isLocationLoaded
        ? render(context)
        : FutureBuilder(
            future: Provider.of<NewAppointmentProvider>(context, listen: false)
                .getPreferedLocation(),
            builder: (ctx, snapshort) {
              if (snapshort.connectionState == ConnectionState.done) {
                // Set inital prefered location
                return render(ctx);
              }
              return CircularProgressIndicator();
            });
  }
}
