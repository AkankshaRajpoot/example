import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {Key? key, required this.onTap, required this.label, this.active = false})
      : super(key: key);
  final VoidCallback onTap;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: active ? kcInfo : kcWhite, width: 4))),
          child: Text(
            "$label",
            style: TextStyle(
                fontSize: 15,
                fontWeight: active ? FontWeight.bold : FontWeight.normal),
          )),
    );
  }
}
