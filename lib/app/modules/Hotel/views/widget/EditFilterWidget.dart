import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/buttons/Button.dart';
import 'package:ui_x/widgets/forms/FormInputHotelDate.dart';
import '../../../../helpers/Global.dart';
import '../../../Home/controllers/HomeController.dart';
import '../../../Home/route/HomeRoutes.dart';
import 'RoomChoiceWidget.dart';

class EditFilterWidget extends StatelessWidget {
  const EditFilterWidget(
      {Key? key,
      required this.checkInDate,
      required this.checkOutDate,
      required this.guests,
      required this.rooms,
      this.landmark = false,
      this.title = true,
      this.city,
      required this.onTap, required this.controller,
     })
      : super(key: key);

  final String checkInDate;
  final String checkOutDate;
  final String guests;
  final String rooms;
  final String? city;
  final bool landmark;
  final bool title;
  final VoidCallback onTap;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(color: kcWhite, border: Border(top: BorderSide(color: kcGray.withOpacity(0.5)))),
      child: Column(
        children: [
          if (landmark)
            Container(
              width: screen.width,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              decoration: BoxDecoration(color: kcInfo.withOpacity(0.15), borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Area, Landmark or Property",
                    style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "$city",
                    style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                  )
                ],
              ),
            ),
          if (title)
            Center(
              child: Text(
                'Select your travel dates for best price',
                style: TextStyl.bodySm?.copyWith(color: kcDarkGray, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Obx(
                () => FormInputHotelDate(
                  heading: 'CheckIn date',
                  onChanged: (value) {
                    controller.onChangeCheckInDate(value);
                  },
                  value: controller.checkInDate,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              FormInputHotelDate(heading: 'CheckOut date',
                onChanged: (value) {
                  controller.onChangeCheckOutDate(value);
                },
                value: controller.checkOutDate,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              RoomChoiceWidget(
                onTap: () {
                  Get.toNamed(HomeRoutes.rooms);
                },
                heading: 'Guests',
                subHeading: "$guests",
              ),
              SizedBox(
                width: 8,
              ),
              RoomChoiceWidget(
                onTap: () {
                  Get.toNamed(HomeRoutes.rooms);
                },
                heading: 'Rooms',
                subHeading: "$rooms",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Button.block(
              key: UniqueKey(),
              label: 'UPDATE SEARCH',
              onTap: (set)async {
                set.setBusy(true).setDisabled(true);
                Get.back();
                set.setBusy(false).setDisabled(false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
