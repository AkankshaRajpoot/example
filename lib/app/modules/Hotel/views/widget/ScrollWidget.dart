import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({Key? key, required this.header, required this.active, required this.onTap}) : super(key: key);
 final String header;
 final bool active;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 15, horizontal:0),
        decoration: BoxDecoration(
            border: Border(
                bottom:  BorderSide(
                    color: active ? kcInfo : kcWhite,
                    width: 2))),
        child: Text(
          '$header',
          style: TextStyl.bodySm?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: active ? kcInfo : kcDarkGray ),
         // fontWeight: active ? FontWeight.bold : FontWeight.normal,
             // color: kcDarkAlt
              ),
        ),
    );
  }
}
