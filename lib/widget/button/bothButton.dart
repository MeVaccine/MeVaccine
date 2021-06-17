import 'package:flutter/material.dart';
import 'package:mevaccine/widget/button/smallButton.dart';

class BothButton extends StatelessWidget {
  const BothButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: kSizeS),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SmallButton(
        //       onPressed: () {
        //         Navigator.of(context).pushNamed(Step1.routeName);
        //       },
        //       text: 'Previous',
        //       color: accent02,
        //       width: 120,
        //     ),
        //     SmallButton(
        //       onPressed: () {
        //         Navigator.of(context).pushNamed(Step3.routeName);
        //       },
        //       text: 'Next',
        //       color: accent02,
        //       width: 120,
        //     ),
        //   ],
        // ),
        );
  }
}
