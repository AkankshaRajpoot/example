import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';
class EditBottomSheetWidget extends StatelessWidget {
  const EditBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 350,
      width: screen.width,
      decoration: BoxDecoration( color: kcWhite,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25) ,topRight: Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Edit Booking",  style: TextStyle(color: kcDarkAlt, fontSize: 20)),
            SizedBox(height: 20),
            Text("Check in", style: TextStyle(color: kcDarkAlt)),
            SizedBox(height: 5),
            TextFormField(),
            SizedBox(height: 10),
            Text("Check out", style: TextStyle(color: kcDarkAlt)),
            SizedBox(height: 5),
            TextFormField(),
            SizedBox(height: 10),
            Text("Room", style: TextStyle(color: kcDarkAlt)),
            SizedBox(height: 5),
            TextFormField(),
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: kcGray.withOpacity(0.8))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 32,
                        child: Transform.scale(scale: 0.7),
                      ),
                      Text(
                        'Search',
                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: kcGray.withOpacity(0.8))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 32,
                        child: Transform.scale(scale: 0.7),
                      ),
                      Text(
                        'Save',
                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
