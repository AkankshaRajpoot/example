import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../Home/route/HomeRoutes.dart';

class RoomChoiceWidget extends StatelessWidget {
  const RoomChoiceWidget({Key? key, required this.heading, required this.subHeading, required this.onTap}) : super(key: key);
  final String heading;
  final String subHeading;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          decoration: BoxDecoration(color: kcInfo.withOpacity(0.15), borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$heading",
                    style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20,
                    color: kcDarkAlt,
                  ),
                ],
              ),
              Text(
                "$subHeading",
                style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
