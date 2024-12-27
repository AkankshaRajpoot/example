import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        "Hourly hotel booking relates to booking stay at major hotels as per demand. If you have to stay for say just couple of hours, you don't need to pay for the 24 hr check-in option.",
        style: TextStyl.bodySm?.copyWith(
          fontSize: 12,color: kcDarkAlt
        ),
      ),
    );
  }
}
