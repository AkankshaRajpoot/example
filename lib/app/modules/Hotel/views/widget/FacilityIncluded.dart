import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
class FacilityIncluded extends StatelessWidget {
  const FacilityIncluded({Key? key, required this.label}) : super(key: key);
  final String label;


  @override
  Widget build(BuildContext context) {
    return

      Container(

        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kcDarkAlt.withOpacity(0.3))
        ),

        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),


        child:   Text(
          "$label",
          style: TextStyl.bodySm?.copyWith(color: kcGreen, fontSize: 13,
              fontWeight: FontWeight.normal),
        )
      );

  }
}
