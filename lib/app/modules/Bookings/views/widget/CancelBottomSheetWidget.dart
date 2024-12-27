import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../../helpers/Global.dart';
import '../../controllers/BookingsController.dart';
class CancelBottomSheetWidget extends StatelessWidget {
  const CancelBottomSheetWidget({
    Key? key, required this.controller,
  }) : super(key: key);
  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: screen.width,
          color: kcWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cancellation Reason",
                      style: TextStyle(color: kcBlack, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                      style: TextStyle(color: kcDarkAlt),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        Positioned(
          top: -20,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: kcWhite, shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: kcDarkAlt.withOpacity(0.2), //New
                    blurRadius: 2.0,
                    spreadRadius: 2)
              ]),
              child: Icon(
                Icons.close,
                color: kcBlack,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
