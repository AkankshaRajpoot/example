import 'package:flutter/material.dart';
import 'package:ui_x/helpers/Sizes.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/ui_x.dart';

class ThankyouWidget extends StatelessWidget {
  const ThankyouWidget({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kcWhite,
            borderRadius: BorderRadius.circular(spacer2),
          ),
          padding: EdgeInsets.symmetric(vertical: spacer * 5, horizontal: spacer5),
          child: Column(
            children: [
              Image.asset(
                "assets/placeholders/thankyou_bg.png",
                width: 150,
                height: 150,
              ),

              Text(
                'Thank You!',
                style: TextStyl.subtitle?.copyWith(fontSize: 22 ,color: kcBlack),
              ),
              const SizedBox(height: spacer3),
              Text(
                'This room has been successfully reserved by you',
                style: TextStyl.body?.copyWith(color: kcDarkAlt),
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'View Booking',
                style: TextStyl.label?.copyWith(
                  fontSize: 15,
                  color: kcDarkAlt,
                  // fontWeight: fw600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward,
                color: kcDarkAlt,
                size: 18,
              ),
            ],
          ),
          onTap: onTap,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
