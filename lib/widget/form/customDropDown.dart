import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function onChanged;
  CustomDropDown(
      {required this.title,
      required this.items,
      required this.onChanged});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: widget.items
          .map(
            (el) => DropdownMenuItem(child: Text(el), value: el),
          )
          .toList(),
      onChanged: (value)=> widget.onChanged(value),
    );
  }
}
